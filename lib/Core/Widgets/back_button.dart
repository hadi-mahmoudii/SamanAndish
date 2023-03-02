import 'package:flutter/material.dart';
import 'flutter_icons.dart';

class GlobalBackButton extends StatelessWidget {
  const GlobalBackButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Color(0XFFF9FBFA),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Color(0xFF707070),
                fontSize: 13,
                fontFamily: 'iranyekanLight',
              ),
            ),
            const SizedBox(width: 3),
            Icon(
              FlutterIcons.right_chevron,
              color: const Color(0xFF707070).withOpacity(.5),
              size: 20,
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
