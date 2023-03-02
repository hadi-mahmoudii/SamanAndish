import 'package:flutter/material.dart';
import 'package:samanandish/Core/Widgets/global_appbar.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Config/datas.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        eLabel: 'PRIVACY',
        pLabel: 'حریم خصوصی',
      ).build(context),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              privacyText,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 16,
                color: mainFontColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
