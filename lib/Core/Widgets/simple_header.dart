import 'package:flutter/material.dart';
import '../Config/app_session.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class SimpleHeader extends StatelessWidget {
  final String persian;
  final String english;

  const SimpleHeader({
    Key? key,
    required this.persian,
    required this.english,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return LayoutBuilder(
      builder: (ctx, cons) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: cons.maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  persian,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: themeData.headline3,
                ),
                const SizedBox(height: 5),
                Text(
                  english,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 10,
                    color: mainFontColor,
                    fontFamily: 'monoton',
                    letterSpacing: 4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
