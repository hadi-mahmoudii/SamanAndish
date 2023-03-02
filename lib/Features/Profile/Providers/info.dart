// ignore_for_file: empty_catches

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Config/routes.dart';
import '../../../Core/Config/urls.dart';
import '../../../Core/Models/global.dart';
import '../../../Core/Models/server_request.dart';
import '../../../Core/Widgets/error_result.dart';

class InfoProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  // TextEditingController provienceCtrl = TextEditingController();
  // TextEditingController cityCtrl = TextEditingController();
  TextEditingController birthCtrl = TextEditingController();
  TextEditingController birthLabelCtrl = TextEditingController();

  var formKey = GlobalKey<FormState>();

  getDatas(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final Either<ErrorResult, dynamic> result = await ServerRequest().fetchData(
      Urls.userInfo,
    );
    result.fold(
      (error) async {
        // await ErrorResult.showDlg(error.type, context);
        isLoading = false;
        notifyListeners();
      },
      (result) {
        // for (var data in result['data'].keys) {
        //   print(data);
        //   print(result['data'][data]);
        // }
        try {
          emailCtrl.text = GlobalEntity.dataFilter(result['data']['email']);
          nameCtrl.text = GlobalEntity.dataFilter(result['data']['first_name']);
          lNameCtrl.text = GlobalEntity.dataFilter(result['data']['last_name']);
          birthCtrl.text = result['data']['birthday'];
          if (birthCtrl.text != '') {
            var dateDatas = birthCtrl.text.split(' ')[0].split('-');
            DateTime gregorianDate = DateTime(int.parse(dateDatas[0]),
                int.parse(dateDatas[1]), int.parse(dateDatas[2]));
            Jalali date = Jalali.fromDateTime(gregorianDate);
            birthLabelCtrl.text = date.formatFullDate();
          }
        } catch (e) {}
        isLoading = false;
        notifyListeners();
      },
    );
  }

  changeInfo(BuildContext context) async {
    // if (!formKey.currentState!.validate()) return;
    isLoading = true;
    // print(birthCtrl.text);
    notifyListeners();
    final Either<ErrorResult, dynamic> result =
        await ServerRequest().updateData(
      Urls.userUpdate,
      datas: {
        'email': emailCtrl.text,
        'first_name': nameCtrl.text,
        'last_name': lNameCtrl.text,
        'birthday': birthCtrl.text,
        // 'last_name': rePassCtrl.text,
        // 'last_name': rePassCtrl.text,
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
          if (result['data']['id'] != '') {
            Fluttertoast.showToast(msg: 'اطلاعات شما تغییر یافت');
            AppSession.userName = nameCtrl.text + ' ' + lNameCtrl.text;
            Navigator.of(context).pop();
            Navigator.of(context).popAndPushNamed(Routes.dashboard);
            return;
          }
        } catch (e) {}
        Fluttertoast.showToast(msg: 'خطایی در تغییر اطلاعات رخ داده است!');
        isLoading = false;
        notifyListeners();
      },
    );
  }

  @override
  void reassemble() {}
}
