import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Config/routes.dart';
import '../../../Core/Widgets/five_navigation_button.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../../../Core/Widgets/simple_header.dart';
import '../../Auth/Widgets/auth_text_header.dart';
import '../Providers/dashboard.dart';
import '../Widgets/dashboard_row_navigator.dart';
import '../Widgets/login_navigator_box.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardProvider>(
      create: (ctx) => DashboardProvider(),
      child: const DashboardScreenTile(),
    );
  }
}

class DashboardScreenTile extends StatefulWidget {
  const DashboardScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardScreenTileState createState() => _DashboardScreenTileState();
}

class _DashboardScreenTileState extends State<DashboardScreenTile> {
  @override
  initState() {
    super.initState();
    // Future.microtask(
    //   () => Provider.of<Test>(context, listen: false).getUserDatas(context),
    // );
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return Consumer<DashboardProvider>(
      builder: (ctx, provider, _) => Scaffold(
        bottomNavigationBar: const BottomNavigationButtons(
          curIndex: 0,
          mainFontColor: mainFontColor,
        ),
        body: AppSession.token == ''
            ? const UnloginUserContainer()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    AuthScreensHeaderTextWidget(
                      themeData: themeData,
                      text: '''Your
Private''',
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.symmetric(
                        // horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => provider.logout(context),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 10, top: 10, bottom: 10),
                              child: const Icon(
                                FlutterIcons.logout,
                                color: mainFontColor,
                                size: 30,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SimpleHeader(
                              persian: 'محیط کاربری شما',
                              english: 'YOUR DASHBOARD',
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: const Icon(
                                FlutterIcons.angle_right,
                                color: mainFontColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            AppSession.userPhone,
                            style: themeData.headline6!
                                .copyWith(fontFamily: 'montserrat'),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 10,
                            ),
                          ),
                          Text(
                            AppSession.userName,
                            style: themeData.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    DashboardRowNavigator(
                        pTitle: 'اطلاعات شخصی من',
                        eTitle: 'MY PERSONAL INFO',
                        icon: FlutterIcons.user,
                        route: Routes.info,
                        color: const Color(0XFF063F89).withOpacity(0.05),
                        themeData: themeData),
                    const Divider(height: 1, color: mainFontColor),
                    DashboardRowNavigator(
                        pTitle: 'تغییر کلمه ی عبور',
                        eTitle: 'CHANGE PASSWORD',
                        icon: FlutterIcons.asterisk,
                        route: Routes.changePass,
                        color: const Color(0XFFEEEEEE),
                        themeData: themeData),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
      ),
    );
  }
}
