import 'package:flutter/material.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Widgets/flutter_icons.dart';

class DashboardRowNavigator extends StatelessWidget {
  const DashboardRowNavigator({
    Key? key,
    required this.pTitle,
    required this.eTitle,
    required this.icon,
    required this.route,
    required this.color,
    required this.themeData,
  }) : super(key: key);
  final String pTitle;
  final String eTitle;
  final IconData icon;
  final String route;
  final Color color;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        color: color,
        child: Row(
          children: [
            const Icon(
              FlutterIcons.angle_left,
              size: 30,
              color: mainFontColor,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  pTitle,
                  textDirection: TextDirection.rtl,
                  style: themeData.caption!.copyWith(
                    fontFamily: 'iranyekanmedium',
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  eTitle,
                  style: themeData.bodyText1!.copyWith(
                    fontFamily: 'montserrat',
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Icon(
              icon,
              size: 30,
              color: mainFontColor,
            ),
          ],
        ),
      ),
    );
  }
}
