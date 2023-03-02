// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samanandish/Core/Config/app_session.dart';
import 'package:samanandish/Core/Config/routes.dart';
import 'package:samanandish/Core/Widgets/back_button.dart';
import 'package:samanandish/Core/Widgets/flutter_icons.dart';
import 'package:samanandish/Core/Widgets/input_box.dart';
import 'package:samanandish/Core/Widgets/samanandish_header.dart';
import 'package:samanandish/Core/Widgets/simple_header.dart';
import 'package:samanandish/Core/Widgets/submit_button.dart';
import 'package:samanandish/Features/Auth/Widgets/auth_text_header.dart';

import '../../../Core/Widgets/loading_widget.dart';
import '../Providers/login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (ctx) => LoginProvider(),
      child: const LoginScreenTile(),
    );
  }
}

class LoginScreenTile extends StatefulWidget {
  const LoginScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenTileState createState() => _LoginScreenTileState();
}

class _LoginScreenTileState extends State<LoginScreenTile> {
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
    return Consumer<LoginProvider>(
      builder: (ctx, provider, _) => Scaffold(
        bottomNavigationBar: const SizedBox(
          height: 50,
          child: SamanAndishHeader(),
        ),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : Form(
                key: provider.formKey,
                child: ListView(
                  children: [
                    AuthScreensHeaderTextWidget(
                      themeData: themeData,
                      text: '''Let's 
Dig in''',
                    ),
                    const SizedBox(height: 20),
                    const GlobalBackButton(title: 'صفحه ی اصلی'),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SimpleHeader(
                        persian: 'ورود به اپلیکیشن',
                        english: 'LOGIN INTO APP',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InputBox(
                        icon: FlutterIcons.phone,
                        label: 'شماره تماس خود را وارد کنید',
                        controller: provider.phoneCtrl,
                        textType: TextInputType.phone,
                        validator: (String value) {
                          if (value.isEmpty) return 'این فیلد موردنیاز است';
                          if (value.length < 11)
                            return 'شماره را بدرستی وارد کنید';
                          return null;
                        },
                        fontfamily: 'montserrat',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InputBox(
                        icon: FlutterIcons.lock,
                        label: 'کلمه ی عبور',
                        controller: provider.passCtrl,
                        letPersianText: false,
                        hideContent: true,
                        maxLines: 1,
                        validator: (String value) {
                          if (value.isEmpty) return 'این فیلد موردنیاز است';
                          return null;
                        },
                        textDirection: TextDirection.ltr,
                        fontfamily: 'montserrat',
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SubmitButton(
                        func: () => provider.login(context),
                        title: 'ورود به اپلیکیشن',
                        color: const Color(0XFF063F89),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SubmitButton(
                        func: () =>
                            Navigator.of(context).pushNamed(Routes.privacy),
                        title: 'حریم خصوصی',
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SubmitButton(
                        func: () =>
                            Navigator.of(context).pushNamed(Routes.register),
                        title: 'حساب کاربری ندارید؟ ثبت نام',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(Routes.passRecovery),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: mainFontColor,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'رمز عبور خود را فراموش کرده ام',
                              textDirection: TextDirection.rtl,
                              style: themeData.button,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }
}
