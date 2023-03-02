import 'package:flutter/material.dart';

class AuthScreensHeaderTextWidget extends StatelessWidget {
  const AuthScreensHeaderTextWidget({
    Key? key,
    required this.themeData,
    required this.text,
  }) : super(key: key);

  final TextTheme themeData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: const Color(0XFFEEEEEE),
      child: Center(
        child: Text(
          text,
          style: themeData.headline6,
        ),
      ),
    );
  }
}
