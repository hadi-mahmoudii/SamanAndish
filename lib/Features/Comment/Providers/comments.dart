// ignore_for_file: empty_catches

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:samanandish/Core/Config/routes.dart';
import 'package:samanandish/Core/Widgets/flutter_icons.dart';
import 'package:samanandish/Core/Widgets/input_box.dart';
import 'package:samanandish/Core/Widgets/loading_widget.dart';
import 'package:samanandish/Core/Widgets/simple_header.dart';
import 'package:samanandish/Core/Widgets/submit_button.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';
import '../Models/comment.dart';

class CommentsProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  TextEditingController commentCtrl = TextEditingController();

  int currentPage = 1;
  bool lockPage = false;

  List<CommentModel> comments = [];

  final String commentsType;
  final String typeId;

  CommentsProvider({
    required this.commentsType,
    required this.typeId,
  });

  getDatas(BuildContext context, {bool resetPage = false}) async {
    if (resetPage) {
      currentPage = 1;
      lockPage = false;
    }
    if (lockPage) return;
    if (currentPage == 1) {
      comments = [];
      isLoading = true;
      // scrollController.jumpTo(0);
      notifyListeners();
    } else {
      isLoadingMore = true;
      notifyListeners();
    }
    // print(Urls.getComments(typeId, commentsType, currentPage.toString()));
    final Either<ErrorResult, dynamic> result = await ServerRequest().fetchData(
      Urls.getComments(typeId, commentsType, currentPage.toString()),
      header: {
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json',
        'origin': Urls.domain,
        'Module': commentsType == 'product' ? 'product' : 'blog',
        'Authorization': AppSession.token,
      },
    );
    result.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        try {
          result['data'].forEach((element) {
            comments.add(CommentModel.fromJson(element));
            // print(result['children']);
          });
          if (currentPage == 1) {
            currentPage += 1;
            isLoading = false;
            notifyListeners();
          } else {
            if (result['data'].length > 0) {
              currentPage += 1;
            } else {
              lockPage = true;
            }
            isLoadingMore = false;
            notifyListeners();
          }
        } catch (e) {
          isLoading = false;
          isLoadingMore = false;
          notifyListeners();
        }
      },
    );
  }

  openCommentBox(BuildContext context) async {
    if (AppSession.token.isEmpty) {
      Fluttertoast.showToast(msg: 'برای ثبت نظر وارد شوید');
      return;
    }
    showDialog(
      context: context,
      builder: (
        ctx,
      ) =>
          AlertDialog(
        content: isLoading
            ? const SizedBox(
                height: 100,
                child: LoadingWidget(),
              )
            : SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SimpleHeader(
                        persian: 'نظرشما', english: 'YOUR COMMENT'),
                    const SizedBox(height: 20),
                    InputBox(
                      icon: FlutterIcons.chat_alt,
                      label: 'متن کامنت',
                      controller: commentCtrl,
                      maxLines: 6,
                      minLines: 3,
                    ),
                    const SizedBox(height: 15),
                    SubmitButton(
                        func: () => sendComment(context), title: 'ثبت کامنت'),
                  ],
                ),
              ),
      ),
    );
  }

  sendComment(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Navigator.of(context).pop();
    final Either<ErrorResult, dynamic> result = await ServerRequest().sendData(
      Urls.sendComment,
      datas: {
        'message': commentCtrl.text,
        'rel_id': typeId,
        'rel_type': commentsType,
      },
      header: {
        'Authorization': AppSession.token,
        'Module': commentsType == 'product' ? 'product' : 'blog',
        'origin': Urls.domain,
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json'
      },
    );
    result.fold(
      (error) async {
        await ErrorResult.showDlg(error.type!, context);
      },
      (result) async {
        // print(result);
        try {
          if (result['data']['id'] != '') {
            Fluttertoast.showToast(msg: 'نظرشماثبت شد.');
            Navigator.of(context).pushReplacementNamed(Routes.comment,
                arguments: [typeId, commentsType]);
            return;
          }
        } catch (e) {}
        Fluttertoast.showToast(msg: 'خطایی درارسال نظر رخ داده است!');
        isLoading = false;
        notifyListeners();
      },
    );
  }

  @override
  void reassemble() {}
}
