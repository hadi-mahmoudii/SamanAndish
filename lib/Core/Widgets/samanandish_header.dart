import 'package:flutter/material.dart';

import '../Config/app_session.dart';

class SamanAndishHeader extends StatelessWidget {
  const SamanAndishHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, cons) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/Images/logo.png',
            width: 200,
            // height: 50,
            fit: BoxFit.fitWidth,
          ),
          const Text(
            'ALL RIGHTS RESERVED',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: mainFontColor,
              fontSize: 14,
              fontFamily: 'monoton',
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
