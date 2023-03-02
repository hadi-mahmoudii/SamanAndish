// ignore_for_file: empty_catches

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';

class ChangePassProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  TextEditingController oldPassCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController rePassCtrl = TextEditingController();
  var formKey = GlobalKey<FormState>();

  changePass(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    isLoading = true;
    notifyListeners();
    final Either<ErrorResult, dynamic> result = await ServerRequest().sendData(
      Urls.changePass,
      datas: {
        'current_password': oldPassCtrl.text,
        'password': passCtrl.text,
        'password_confirmation': rePassCtrl.text,
      },
      // header: {
      //   'Authorization': AppSession.token,
      //   'Module': commentsType == 'product' ? 'product' : 'blog',
      //   'origin': Urls.domain,
      //   'X-Requested-With': 'XMLHttpRequest',
      //   'Content-Type': 'application/json'
      // },
    );
    result.fold(
      (error) async {
        await ErrorResult.showDlg(error.type!, context);
      },
      (result) async {
        // print(result);
        try {
          if (result['message']['title'] == 'موفق') {
            Fluttertoast.showToast(msg: 'رمز شما تغییر یافت');
            Navigator.of(context).pop();
            return;
          }
        } catch (e) {}
        Fluttertoast.showToast(msg: 'خطایی در تغییر رمز رخ داده است!');
        isLoading = false;
        notifyListeners();
      },
    );
  }

  @override
  void reassemble() {}
}
