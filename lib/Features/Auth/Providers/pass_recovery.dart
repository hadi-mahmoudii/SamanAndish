// ignore_for_file: empty_catches
import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:samanandish/Core/Config/routes.dart';

import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';

class PasswordRecoveryProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool codeSended = false;
  ScrollController scrollController = ScrollController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController codeCtrl = TextEditingController();
  int timerValue = 60;
  late Timer globalTimer;

  void startTimer() {
    timerValue = 60;
    const oneSec = Duration(seconds: 1);
    globalTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        // if(!this.mounted){
        //   timer.cancel();
        // }
        if (timerValue < 1) {
          timer.cancel();
          notifyListeners();
        } else {
          timerValue -= 1;
          notifyListeners();
        }
      },
    );
  }

  requestCode(BuildContext context) async {
    if (phoneCtrl.text.length < 11) {
      Fluttertoast.showToast(msg: 'شماره را بدرستی وارد کنید');
      return;
    }
    timerValue = 60;
    isLoading = true;
    notifyListeners();
    final Either<ErrorResult, dynamic> result = await ServerRequest().sendData(
      Urls.getForgetPassNumber,
      datas: {'cell_number': phoneCtrl.text},
    );
    result.fold(
      (error) async {
        await ErrorResult.showDlg(error.type!, context);
      },
      (result) async {
        try {
          if (result['message']['title'] == 'موفق') {
            codeSended = true;
            startTimer();
            isLoading = false;
            notifyListeners();
            return;
          }
        } catch (e) {}
        try {
          if (result['message'] ==
              'No query results for model [WM\\Core\\Models\\User].') {
            Fluttertoast.showToast(msg: 'شماره موردنظر یافت نشد!');
            isLoading = false;
            notifyListeners();
            return;
          }
        } catch (e) {}

        isLoading = false;
        notifyListeners();
      },
    );
  }

  checkCode(BuildContext context) async {
    if (codeCtrl.text.length < 6) {
      Fluttertoast.showToast(msg: 'کد را بدرستی وارد کنید');
      return;
    }
    isLoading = true;
    notifyListeners();
    final Either<ErrorResult, dynamic> result = await ServerRequest().sendData(
      Urls.verifyForgetPassNumber,
      datas: {
        'code': codeCtrl.text,
      },
    );
    result.fold(
      (error) async {
        await ErrorResult.showDlg(error.type!, context);
      },
      (result) async {
        try {
          final String changePassToken = result['data']['token'];
          Navigator.of(context).pushReplacementNamed(
            Routes.newPass,
            arguments: changePassToken,
          );
        } catch (e) {}
        Fluttertoast.showToast(msg: 'کدوارد شده نادرست است!');
        isLoading = false;
        notifyListeners();
      },
    );
  }

  @override
  void reassemble() {}
}
