// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samanandish/Core/Widgets/back_button.dart';
import 'package:samanandish/Core/Widgets/flutter_icons.dart';
import 'package:samanandish/Core/Widgets/input_box.dart';
import 'package:samanandish/Core/Widgets/samanandish_header.dart';
import 'package:samanandish/Core/Widgets/simple_header.dart';
import 'package:samanandish/Core/Widgets/submit_button.dart';
import 'package:samanandish/Features/Auth/Providers/register.dart';
import 'package:samanandish/Features/Auth/Widgets/auth_text_header.dart';

import '../../../Core/Widgets/loading_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
      create: (ctx) => RegisterProvider(),
      child: const RegisterScreenTile(),
    );
  }
}

class RegisterScreenTile extends StatefulWidget {
  const RegisterScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterScreenTileState createState() => _RegisterScreenTileState();
}

class _RegisterScreenTileState extends State<RegisterScreenTile> {
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
    return Consumer<RegisterProvider>(
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
                      text: '''Join the 
Club''',
                    ),
                    const SizedBox(height: 20),
                    const GlobalBackButton(title: 'ورود به سیستم'),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SimpleHeader(
                        persian: 'ثبت نام در اپلیکیشن',
                        english: 'REGISTRATION',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InputBox(
                        icon: FlutterIcons.user,
                        label: 'نام و نام خانوادگی',
                        controller: provider.nameCtrl,
                        validator: (String value) {
                          if (value.isEmpty) return 'این فیلد موردنیاز است';
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InputBox(
                        icon: FlutterIcons.phone,
                        label: 'شماره تماس خود را وارد کنید',
                        validator: (String value) {
                          if (value.isEmpty) return 'این فیلد موردنیاز است';
                          if (value.length < 11)
                            return 'شماره را بدرستی وارد کنید';
                          return null;
                        },
                        controller: provider.phoneCtrl,
                        fontfamily: 'montserrat',
                        textType: TextInputType.phone,
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
                          if (value.length < 8) return 'حداقل 8 حرف نیاز است';
                          return null;
                        },
                        textDirection: TextDirection.ltr,
                        fontfamily: 'montserrat',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InputBox(
                        icon: FlutterIcons.lock,
                        label: 'تکرار کلمه ی عبور',
                        controller: provider.rePassCtrl,
                        letPersianText: false,
                        hideContent: true,
                        maxLines: 1,
                        validator: (String value) {
                          if (value.isEmpty) return 'این فیلد موردنیاز است';
                          if (value.length < 8) return 'حداقل 8 حرف نیاز است';
                          if (provider.passCtrl.text !=
                              provider.rePassCtrl.text) {
                            return 'رمزها یکسان نیستند!';
                          }
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
                        func: () => provider.register(context),
                        title: 'تایید اطلاعات و ثبت نام',
                        color: const Color(0XFF063F89),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
      ),
    );
  }
}
