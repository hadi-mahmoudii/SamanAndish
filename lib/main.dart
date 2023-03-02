// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:samanandish/Core/splash_screen.dart';

import 'Core/Config/app_session.dart';
import 'Core/Config/routes.dart';
import 'Features/General/Screens/home.dart';

void main() {
  if (Platform.isAndroid || Platform.isIOS) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0XFFEEEEEE), // transparent status bar
      statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
      statusBarIconBrightness:
          Platform.isIOS ? Brightness.light : Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      runApp(const MyApp());
    });
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppSession()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SamanAndish',
        theme: ThemeData(
          primaryColor: mainFontColor,
          fontFamily: 'iranyekan',
          colorScheme: const ColorScheme.light(secondary: Color(0XFFFFD600)),
          canvasColor: const Color(0xFFF9F9F9),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: mainFontColor,
            // selectionColor: Colors.white,
            selectionHandleColor: Colors.white,
          ),
          textTheme: TextTheme(
            headline1: const TextStyle(
              fontSize: 18,
              color: mainFontColor,
              fontFamily: 'iranyekanlight',
            ),
            headline2: const TextStyle(
              fontSize: 8,
              color: mainFontColor,
              fontFamily: 'monoton',
              letterSpacing: 4,
            ),
            headline3: const TextStyle(
              fontSize: 20,
              color: mainFontColor,
              fontFamily: 'iranyekanregular',
            ),
            headline4: const TextStyle(
              fontSize: 15,
              color: mainFontColor,
              // fontFamily: 'monoton',
              // letterSpacing: 4,
            ),
            subtitle1: const TextStyle(
              fontSize: 16,
              color: mainFontColor,
              fontFamily: 'iranyekanmedium',
            ),
            subtitle2: const TextStyle(
              fontSize: 12,
              color: Color(0XFFBEBEBE),
            ),
            caption: const TextStyle(
              fontSize: 14,
              color: mainFontColor,
              fontFamily: 'iranyekanregular',
            ),
            overline: TextStyle(
              fontSize: 10,
              color: mainFontColor.withOpacity(.9),
            ),
            button: const TextStyle(
              fontSize: 12,
              color: mainFontColor,
            ),
            bodyText1: const TextStyle(
              fontSize: 12,
              color: mainFontColor,
            ),
            headline5: const TextStyle(
              fontSize: 10,
              color: Color(0XFF1B2749),
              fontFamily: 'iranyekanlight',
            ),
            headline6: const TextStyle(
              fontSize: 30,
              color: mainFontColor,
              fontFamily: 'monoton',
            ),
            bodyText2: const TextStyle(
              fontSize: 20,
              color: mainFontColor,
            ),
          ),
        ),
        routes: Routes().appRoutes,
        home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return const SplashScreen();
            else
              return const HomeScreen();
          },
        ),
      ),
    );
  }
}

// // ignore_for_file: curly_braces_in_flow_control_structures

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:samanandish/Core/splash_screen.dart';

// import 'Core/Config/app_session.dart';
// import 'Core/Config/routes.dart';
// import 'Features/General/Screens/home.dart';

// void main() {
//   if (Platform.isAndroid || Platform.isIOS) {
//     WidgetsFlutterBinding.ensureInitialized();
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: const Color(0XFFEEEEEE), // transparent status bar
//       statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
//       statusBarIconBrightness:
//           Platform.isIOS ? Brightness.light : Brightness.dark,
//     ));
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//         .then((_) {
//       runApp(const MyApp());
//     });
//   } else {
//     runApp(const MyApp());
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Init.instance.initialize(),
//       builder: (ctx, snapShot) {
//         if (snapShot.connectionState == ConnectionState.waiting) {
//           return const MaterialApp(home: SplashScreen());
//         } else
//           return MultiProvider(
//             providers: [
//               ChangeNotifierProvider.value(value: AppSession()),
//             ],
//             child: MaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'SamanAndish',
//               theme: ThemeData(
//                 primaryColor: mainFontColor,
//                 fontFamily: 'iranyekan',
//                 colorScheme:
//                     const ColorScheme.light(secondary: Color(0XFFFFD600)),
//                 canvasColor: const Color(0xFFF9F9F9),
//                 textSelectionTheme: const TextSelectionThemeData(
//                   cursorColor: mainFontColor,
//                   // selectionColor: Colors.white,
//                   selectionHandleColor: Colors.white,
//                 ),
//                 textTheme: TextTheme(
//                   headline1: const TextStyle(
//                     fontSize: 18,
//                     color: mainFontColor,
//                     fontFamily: 'iranyekanlight',
//                   ),
//                   headline2: const TextStyle(
//                     fontSize: 8,
//                     color: mainFontColor,
//                     fontFamily: 'monoton',
//                     letterSpacing: 4,
//                   ),
//                   headline3: const TextStyle(
//                     fontSize: 20,
//                     color: mainFontColor,
//                     fontFamily: 'iranyekanregular',
//                   ),
//                   headline4: const TextStyle(
//                     fontSize: 15,
//                     color: mainFontColor,
//                     // fontFamily: 'monoton',
//                     // letterSpacing: 4,
//                   ),
//                   subtitle1: const TextStyle(
//                     fontSize: 16,
//                     color: mainFontColor,
//                     fontFamily: 'iranyekanmedium',
//                   ),
//                   subtitle2: const TextStyle(
//                     fontSize: 12,
//                     color: Color(0XFFBEBEBE),
//                   ),
//                   caption: const TextStyle(
//                     fontSize: 14,
//                     color: mainFontColor,
//                     fontFamily: 'iranyekanregular',
//                   ),
//                   overline: TextStyle(
//                     fontSize: 7,
//                     color: mainFontColor.withOpacity(.9),
//                   ),
//                   button: const TextStyle(
//                     fontSize: 12,
//                     color: mainFontColor,
//                   ),
//                   bodyText1: const TextStyle(
//                     fontSize: 10,
//                     color: mainFontColor,
//                   ),
//                   headline5: const TextStyle(
//                     fontSize: 6,
//                     color: Color(0XFF1B2749),
//                     fontFamily: 'iranyekanlight',
//                   ),
//                   headline6: const TextStyle(
//                     fontSize: 30,
//                     color: mainFontColor,
//                     fontFamily: 'monoton',
//                   ),
//                   bodyText2: const TextStyle(
//                     fontSize: 20,
//                     color: mainFontColor,
//                   ),
//                 ),
//               ),
//               routes: Routes().appRoutes,
//               home: HomeScreen(),
//             ),
//           );
//       },
//     );
//   }
// }

// class Init {
//   Init._();
//   static final instance = Init._();

//   Future initialize() async {
//     // This is where you can initialize the resources needed by your app while
//     // the splash screen is displayed.  Remove the following example because
//     // delaying the user experience is a bad design practice!
//     await Future.delayed(const Duration(seconds: 3));
//   }
// }
