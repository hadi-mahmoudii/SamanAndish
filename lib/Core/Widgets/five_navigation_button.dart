import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Features/Product/Models/category.dart';
import '../Config/app_session.dart';
import '../Config/routes.dart';

class BottomNavigationButtons extends StatelessWidget {
  const BottomNavigationButtons({
    Key? key,
    required int curIndex,
    required Color mainFontColor,
  })  : _curIndex = curIndex,
        // _mainFontColor = mainFontColor,
        super(key: key);

  final int _curIndex;
  // final Color _mainFontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Color(0xFFF9F9F9),
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey.withOpacity(.75),
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: SvgPicture.asset(
                'assets/Icons/profile.svg',
                height: 25,
                width: 25,
                color: _curIndex == 0 ? mainFontColor : Colors.grey,
              ),
            ),
            label: 'پروفایل',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color(0xFFF9F9F9),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: SvgPicture.asset(
                'assets/Icons/rss.svg',
                height: 25,
                width: 25,
                color: _curIndex == 1 ? mainFontColor : Colors.grey,
              ),
            ),
            label: 'خبرنامه',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color(0xFFF9F9F9),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: SvgPicture.asset(
                'assets/Icons/align.svg',
                height: 25,
                width: 25,
                color: _curIndex == 2 ? mainFontColor : Colors.grey,
              ),
            ),
            label: 'محصولات',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Color(0xFFF9F9F9),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: SvgPicture.asset(
                'assets/Icons/homeheart.svg',
                height: 25,
                width: 25,
                color: _curIndex == 3 ? mainFontColor : Colors.grey,
              ),
            ),
            label: 'خانه',
          ),
        ],
        currentIndex: _curIndex,
        onTap: (index) {
          if (_curIndex != index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed(Routes.dashboard);
                break;
              case 1:
                Navigator.of(context).pushNamed(Routes.blogList);
                break;
              case 2:
                Navigator.of(context).pushNamed(
                  Routes.productCategoriesList,
                  arguments: CategoryModel(
                    id: '(null)',
                    name: 'دسته بندی محصولات',
                    nameE: 'CATEGORIES',
                    image: 'null',
                    parentId: 'null',
                    count: '2000',
                  ),
                );
                break;
              case 3:
                Navigator.of(context).pushNamed(Routes.home);
                break;
              default:
            }
          }
        },
      ),
    );
  }
}
