// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Config/routes.dart';
import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';

class LoginProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  var formKey = GlobalKey<FormState>();

  login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    isLoading = true;
    notifyListeners();
    final Either<ErrorResult, dynamic> result = await ServerRequest().sendData(
      Urls.login,
      datas: {
        'username': phoneCtrl.text,
        'password': passCtrl.text,
      },
    );
    result.fold(
      (error) async {
        await ErrorResult.showDlg(error.type!, context);
        isLoading = false;
        notifyListeners();
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
              '?????????? ?????????? ???????? ?????????? ???????? ??????.') {
            isLoading = false;
            notifyListeners();
            Fluttertoast.showToast(msg: '?????????? ?????????? ???????? ?????????? ???????? ??????!');
            return;
          }
        } catch (e) {}
        try {
          if (result['errors']['credentials'] ==
              '?????? ???????????? ?? ???? ?????? ???????? ???????????? ???? ????????.') {
            isLoading = false;
            notifyListeners();
            Fluttertoast.showToast(
                msg: '?????? ???????????? ?? ???? ?????? ???????? ???????????? ???? ????????.');
            return;
          }
        } catch (e) {}
        try {
          if (result['message'] == 'The given data was invalid.') {
            isLoading = false;
            notifyListeners();
            Fluttertoast.showToast(msg: '?????????????? ???????? ?????? ???????? ?????? ????????!');
            return;
          }
        } catch (e) {}
      },
    );
  }

  @override
  void reassemble() {}
}
