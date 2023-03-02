import 'package:flutter/material.dart';

import 'flutter_icons.dart';

class NewPageNavigatorButton extends StatelessWidget {
  const NewPageNavigatorButton({
    Key? key,
    required this.themeData,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.func,
    required this.icon,
    this.isCommentType = false,
    this.subValue = '0',
  }) : super(key: key);

  final TextTheme themeData;
  final String title;
  final String subTitle;
  final Color color;
  final bool isCommentType;
  final String subValue;
  final Function func;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => func(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        color: color,
        child: Row(
          children: <Widget>[
            const Icon(
              FlutterIcons.angle_left,
              color: Colors.white,
              size: 25,
            ),
            const SizedBox(width: 5),
            isCommentType
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        subValue,
                        style: themeData.bodyText2!.copyWith(
                          color: Colors.white,
                          fontFamily: 'montserrat',
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        'نــظـــر',
                        style: themeData.bodyText1!.copyWith(
                          fontFamily: 'iranyekanregular',
                          color: Colors.white,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  )
                : Container(),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: themeData.caption!.copyWith(
                      fontFamily: 'iranyekanmedium', color: Colors.white),
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  subTitle.toUpperCase(),
                  style: themeData.bodyText1!.copyWith(
                    color: Colors.white,
                    fontFamily: 'montserrat',
                    letterSpacing: 4,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Icon(
                icon,
                size: 29,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
