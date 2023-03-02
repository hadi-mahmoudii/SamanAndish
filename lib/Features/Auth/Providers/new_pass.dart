// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:samanandish/Core/Config/routes.dart';
import 'package:samanandish/Core/Config/urls.dart';
import 'package:http/http.dart' as http;

class NewPasswordProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController rePassCtrl = TextEditingController();
  final String newPassToken;
  var formKey = GlobalKey<FormState>();

  NewPasswordProvider({required this.newPassToken});

  changePass(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    isLoading = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse(Urls.sendRePass),
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': 'Bearer ' + newPassToken,
        'origin': Urls.domain,
      },
      body: {
        'password': passCtrl.text,
        'password_confirmation': rePassCtrl.text,
      },
    );
    // print(json.encode(datas)  );
    // print(response.body);
    var result = json.decode(response.body);
    try {
      if (result['message']['title'] == 'موفق') {
        Navigator.of(context).pushReplacementNamed(Routes.login);
        Fluttertoast.showToast(msg: 'رمز با موفقیت تغییر یافت');
        notifyListeners();
        return;
      }
    } catch (e) {}
    Navigator.of(context).pushReplacementNamed(Routes.login);
    Fluttertoast.showToast(msg: 'مشکلی در تغییر رمز بوجود آمده است!');
    notifyListeners();
    return;
  }

  @override
  void reassemble() {}
}
