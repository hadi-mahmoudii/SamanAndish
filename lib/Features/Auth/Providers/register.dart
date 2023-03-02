// ignore_for_file: empty_catches

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/routes.dart';
import '../../../Core/Config/urls.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';

class RegisterProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController rePassCtrl = TextEditingController();
  var formKey = GlobalKey<FormState>();

  register(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    isLoading = true;
    notifyListeners();
    final Either<ErrorResult, dynamic> result = await ServerRequest().sendData(
      Urls.signUp,
      datas: {
        'last_name': nameCtrl.text,
        'cell_number': phoneCtrl.text,
        'password': passCtrl.text,
        'password_confirmation': passCtrl.text,
      },
    );
    result.fold(
      (error) async {
        await ErrorResult.showDlg(error.type!, context);
      },
      (result) async {
        try {
          if (result['message']['title'] == 'موفق') {
            Navigator.of(context).pushReplacementNamed(Routes.smsVerification);
            return;
          }
        } catch (e) {}
        try {
          if (result['errors']['cell_number'][0] ==
              'تلفن همراه قبلا انتخاب شده است.') {
            isLoading = false;
            notifyListeners();
            Fluttertoast.showToast(msg: 'این شماره قبلا انتخاب شده است!');
            return;
          }
        } catch (e) {}
      },
    );
  }

  @override
  void reassemble() {}
}
