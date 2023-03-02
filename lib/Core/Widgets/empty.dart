import 'package:flutter/material.dart';

import '../Config/app_session.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size sizeDatas = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: sizeDatas.height / 5),
        width: sizeDatas.width / 2,
        child: Column(
          children: [
            SizedBox(
              width: sizeDatas.width / 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: mainFontColor,
                    ),
                    child: const Text(' '),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: mainFontColor,
                    ),
                    child: const Text(' '),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            RotationTransition(
              turns: const AlwaysStoppedAnimation(-10 / 360),
              child: SizedBox(
                width: sizeDatas.width / 5,
                child: const Divider(
                  color: mainFontColor,
                  thickness: 4,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'متــــــــــاسفیم',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: mainFontColor,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            const Text(
              'هیچ آیـــــــــتمی برای\nنمایش وجـــــود ندارد.',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: mainFontColor,
                fontSize: 24,
                fontFamily: 'iranyekanregular',
              ),
            ),
            const Divider(
              color: mainFontColor,
            ),
            Text(
              'NOTHING TO SHOW',
              style: TextStyle(
                color: mainFontColor.withOpacity(.5),
                fontFamily: 'pacifico',
                fontSize: 13,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
