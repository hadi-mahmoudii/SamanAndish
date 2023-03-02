import 'package:flutter/material.dart';

import '../Config/app_session.dart';

class SubmitButton extends StatelessWidget {
  final Function func;
  final Color color;
  final String title;
  final double? fontSize;

  const SubmitButton({
    Key? key,
    required this.func,
    required this.title,
    this.color = mainFontColor,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => func(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.button!.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
