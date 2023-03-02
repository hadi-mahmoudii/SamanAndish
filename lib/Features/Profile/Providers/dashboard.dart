import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Core/Config/app_session.dart';
import '../../../Core/Config/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();

  logout(BuildContext context, {bool sendRequest = false}) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text(
          'آیا برای خروج اطمینان دارید؟',
          textDirection: TextDirection.rtl,
          style: TextStyle(color: mainFontColor),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              AppSession.token = '';
              AppSession.userName = '';
              AppSession.userPhone = '';

              final prefs = await SharedPreferences.getInstance();
              prefs.remove('userData');
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacementNamed(Routes.home);
            },
            child: const Text(
              'بله',
              style: TextStyle(color: mainFontColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text(
              'خیر',
              style: TextStyle(color: mainFontColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void reassemble() {}
}
