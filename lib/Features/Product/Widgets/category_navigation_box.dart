// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:samanandish/Core/Widgets/flutter_icons.dart';

import '../../../Core/Config/routes.dart';
import '../Models/category.dart';

class CategoryNavigationBox extends StatelessWidget {
  final CategoryModel category;
  final TextTheme themeData;

  const CategoryNavigationBox({
    Key? key,
    required this.category,
    required this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (category.count != '0') {
          Navigator.of(context)
              .pushNamed(Routes.productCategoriesList, arguments: category);
        } else {
          Navigator.of(context)
              .pushNamed(Routes.productList, arguments: category);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            const Icon(
              FlutterIcons.left_chevron,
              size: 15,
              color: Color(0XFF191919),
            ),
            // category.count != '0'
            //     ? Container(
            //         margin: EdgeInsets.only(left: 10),
            //         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //         decoration: BoxDecoration(
            //           color: Colors.black12,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Column(
            //           children: <Widget>[
            //             Text(
            //               category.count,
            //               style: TextStyle(
            //                 fontFamily: 'montserrat',
            //                 fontWeight: FontWeight.w700,
            //                 color: Colors.black54,
            //               ),
            //               // textScaleFactor: 0.8,
            //             ),
            //             Text(
            //               'آیتم',
            //               style: TextStyle(
            //                   color: Colors.grey,
            //                   fontSize: 2.3 * _deviceBlockSize),
            //               // textScaleFactor: 0.7,
            //             ),
            //           ],
            //         ),
            //       )
            //     : Container(),
            const Spacer(),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    category.name,
                    textDirection: TextDirection.rtl,
                    style: themeData.caption!.copyWith(fontSize: 15),
                  ),
                  Text(
                    category.nameE,
                    textDirection: TextDirection.rtl,
                    style: themeData.headline2!.copyWith(
                      fontFamily: 'montserrat',
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Image.network(
              category.image,
              height: 25,
              width: 25,
            ),
            // Icon(Icons.settings_input_svideo),
          ],
        ),
      ),
    );
  }
}
