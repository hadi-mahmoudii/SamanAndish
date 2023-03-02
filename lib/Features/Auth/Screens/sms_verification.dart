// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samanandish/Core/Widgets/back_button.dart';
import 'package:samanandish/Core/Widgets/samanandish_header.dart';
import 'package:samanandish/Core/Widgets/simple_header.dart';
import 'package:samanandish/Core/Widgets/submit_button.dart';
import 'package:samanandish/Features/Auth/Providers/sms_verification.dart';
import 'package:samanandish/Features/Auth/Widgets/auth_text_header.dart';

import '../../../Core/Widgets/loading_widget.dart';

class SMSVerificationScreen extends StatelessWidget {
  const SMSVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SMSVerificationProvider>(
      create: (ctx) => SMSVerificationProvider(),
      child: const SMSVerificationScreenTile(),
    );
  }
}

class SMSVerificationScreenTile extends StatefulWidget {
  const SMSVerificationScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _SMSVerificationScreenTileState createState() =>
      _SMSVerificationScreenTileState();
}

class _SMSVerificationScreenTileState extends State<SMSVerificationScreenTile> {
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
    return Consumer<SMSVerificationProvider>(
      builder: (ctx, provider, _) => Scaffold(
        bottomNavigationBar: const SizedBox(
          height: 50,
          child: SamanAndishHeader(),
        ),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    AuthScreensHeaderTextWidget(
                      themeData: themeData,
                      text: '''Just a 
Quick 
Check''',
                    ),
                    const SizedBox(height: 20),
                    const GlobalBackButton(title: 'ثبت نام'),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SimpleHeader(
                        persian: 'تایید تلفن همراه',
                        english: 'CELL NUMBER VERIFY',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'کد دریافتی را وارد کنید',
                        style: themeData.caption,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        onChanged: (value) async {
                          if (value.length == 6) {
                            provider.checkCode(context);
                          }
                        },
                        controller: provider.codeCtrl,
                        decoration: const InputDecoration(isDense: true),
                        style: const TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          letterSpacing: 5,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 6,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SubmitButton(
                        func: () => provider.checkCode(context),
                        title: 'تایید کد',
                        color: const Color(0XFF063F89),
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
