import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Config/app_session.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInit = true;
  bool isLoggdedIn = false;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      isLoggdedIn =
          await Provider.of<AppSession>(context).tryAutoLogin(context);

      // var sizes = MediaQuery.of(context).size;
      // Provider.of<AppSession>(context, listen: false).setSizes(sizes);
      // AppSession.mainFontColor = Theme.of(context).primaryColor;
      // AppSession.backgroundColor = Theme.of(context).canvasColor;
      setState(() {
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/Images/logo.png',
              width: 250,
              // height: 50,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'گـــــــــــــروه صـــــــــــــنعتی',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'iranyekanregular',
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'ســـــــــامـــــــــان انـــــــــدیش',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
