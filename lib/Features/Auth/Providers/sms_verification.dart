// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Config/routes.dart';
import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';

class SMSVerificationProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  TextEditingController codeCtrl = TextEditingController();
  checkCode(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final Either<ErrorResult, dynamic> result = await ServerRequest().sendData(
      Urls.verifyRegisterNumber,
      datas: {'code': codeCtrl.text},
    );
    result.fold(
      (error) async {
        await ErrorResult.showDlg(error.type!, context);
      },
      (result) async {
        try {
          if (result['data']['token'] != '') {
            Map<String, dynamic> _userData = result['data']['user'];
            AppSession.userName = _userData['name'];
            AppSession.userPhone = _userData['cell_number'];
            AppSession.token = 'Bearer ' + result['data']['token'];
            final prefs = await SharedPreferences.getInstance();
            final userData =
                json.encode({'token': AppSession.token, 'user': _userData});
            prefs.setString('userData', userData);
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.of(context).pushReplacementNamed(Routes.home);
            return;
          }
        } catch (e) {}
        try {
          if (result['errors']['verification'] ==
              'تأیید شماره تلفن انجام نشده است.') {
            isLoading = false;
            notifyListeners();
            Fluttertoast.showToast(msg: 'تایید شماره تلفن انجام نشده است!');
            return;
          }
        } catch (e) {}
        try {
          if (result['errors']['credentials'] ==
              'نام کاربری و یا رمز عبور نادرست می باشد.') {
            isLoading = false;
            notifyListeners();
            Fluttertoast.showToast(
                msg: 'نام کاربری و یا رمز عبور نادرست می باشد.');
            return;
          }
        } catch (e) {}
        try {
          if (result['message'] == 'The given data was invalid.') {
            isLoading = false;
            notifyListeners();
            Fluttertoast.showToast(msg: 'اطلاعات وارد شده صحیح نمی باشد!');
            return;
          }
        } catch (e) {}
        isLoading = false;
        notifyListeners();
        Fluttertoast.showToast(msg: 'کدوارد شده صحیح نمی باشد!');
        return;
      },
    );
  }

  @override
  void reassemble() {}
}
