import 'package:flutter/material.dart';
import 'flutter_icons.dart';

import '../Config/app_session.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    Key? key,
    required this.pLabel,
    required this.eLabel,
    this.letReturn = true,
    this.iconWidget,
  }) : super(key: key);

  final String pLabel;
  final String eLabel;
  final bool letReturn;
  final Widget? iconWidget;

  @override
  PreferredSizeWidget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: const Color(0xFFEEEEEE),
      title: iconWidget,
      automaticallyImplyLeading: false,
      leading: iconWidget,
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pLabel,
              style: themeData.headline1,
              textDirection: TextDirection.rtl,
            ),
            Text(
              eLabel,
              style: themeData.headline2,
            ),
          ],
        ),
        letReturn
            ? InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.only(
                      right: 20, left: 10, top: 10, bottom: 10),
                  child: const Icon(
                    FlutterIcons.right_chevron,
                    color: mainFontColor,
                    size: 25,
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.only(
                    right: 20, left: 10, top: 10, bottom: 10),
                child: const Icon(
                  FlutterIcons.home_heart,
                  color: mainFontColor,
                  size: 25,
                ),
              ),
      ],
    );
  }
}

// class GlobalAppbar extends StatelessWidget {
//   const GlobalAppbar({
//     Key? key,
//     this.pLabel = '',
//     this.eLabel = '',
//     this.letReturn = true,
//     this.icon,
//     this.function,
//   }) : super(key: key);

//   final String pLabel;
//   final String eLabel;
//   final bool letReturn;
//   final IconData? icon;
//   final Function? function;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: icon != null
//           ? IconButton(
//               onPressed: () => function!(),
//               icon: Icon(
//                 icon,
//                 color: mainFontColor,
//               ),
//             )
//           : Container(),
//       backgroundColor: const Color(0xFFEEEEEE),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           // SizedBox(
//           //   width: 40,
//           //   height: 40,
//           //   child: Image.asset(
//           //     'assets/Images/logo.png',
//           //     fit: BoxFit.contain,
//           //   ),
//           // ),
//         ],
//       ),
//       actions: [
//         Builder(
//           builder: (context) => IconButton(
//             icon: Opacity(
//               opacity: AppSession.token != '' ? 1.0 : 0,
//               child: const Icon(
//                 FlutterIcons.user,
//                 color: mainFontColor,
//               ),
//             ),
//             onPressed: () {
//               Navigator.of(context).pushNamed(Routes.dashboard);
//             },
//             tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//           ),
//         ),
//       ],
//     );
//   }
// }

// Future logout(BuildContext context, {bool sendRequest = false}) async {
//   showDialog(
//     context: context,
//     builder: (ctx) => AlertDialog(
//       content: const Text(
//         'آیا برای خروج اطمینان دارید؟',
//         textDirection: TextDirection.rtl,
//         style: TextStyle(color: mainFontColor),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () async {
//             Navigator.of(ctx).pop();
//             AppSession.token = '';
//             final prefs = await SharedPreferences.getInstance();
//             prefs.remove('userData');
//             Navigator.of(context).popUntil((route) => route.isFirst);
//             Navigator.of(context).pushReplacementNamed(Routes.home);
//           },
//           child: const Text(
//             'بله',
//             style: TextStyle(color: mainFontColor),
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.of(ctx).pop();
//           },
//           child: const Text(
//             'خیر',
//             style: TextStyle(color: mainFontColor),
//           ),
//         ),
//       ],
//     ),
//   );
//   // if (sendRequest) {
//   // await http.post(
//   //   Urls.logout,
//   //   headers: {
//   //     'X-Requested-With': 'XMLHttpRequest',
//   //     'Authorization': AppSession.token,
//   //     'device-id': AppSession.deviceId,
//   //   },
//   // );
//   // }
//   // notifyListeners();
//   // return true;
// }
