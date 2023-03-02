import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';
import '../Models/blog.dart';

class BlogDetailsProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = true;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  late BlogModel blog;
  final String blogId;
  BlogDetailsProvider({required this.blogId});
  getDatas(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final Either<ErrorResult, dynamic> result3 =
        await ServerRequest().fetchData(
      Urls.getBlogItem(blogId),
    );
    result3.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        try {
          blog = BlogModel.fromJson(result['data']);
          isLoading = false;
          notifyListeners();
        } catch (e) {
          Fluttertoast.showToast(msg: 'خطا در دریافت اطلاعات!');
          Navigator.of(context).pop();
        }
        // if (currentPage == 1) {
        //   currentPage += 1;
        //   isLoading = false;
        //   notifyListeners();
        // } else {
        //   if (result['data'].length > 0) {
        //     currentPage += 1;
        //   } else {
        //     lockPage = true;
        //   }

        // }
      },
    );
  }

  @override
  void reassemble() {}
}
