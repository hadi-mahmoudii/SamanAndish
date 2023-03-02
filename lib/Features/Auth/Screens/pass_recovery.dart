import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Widgets/back_button.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../../../Core/Widgets/input_box.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../../../Core/Widgets/samanandish_header.dart';
import '../../../Core/Widgets/simple_header.dart';
import '../../../Core/Widgets/submit_button.dart';
import '../Providers/pass_recovery.dart';
import '../Widgets/auth_text_header.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PasswordRecoveryProvider>(
      create: (ctx) => PasswordRecoveryProvider(),
      child: const PasswordRecoveryScreenTile(),
    );
  }
}

class PasswordRecoveryScreenTile extends StatefulWidget {
  const PasswordRecoveryScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _PasswordRecoveryScreenTileState createState() =>
      _PasswordRecoveryScreenTileState();
}

class _PasswordRecoveryScreenTileState
    extends State<PasswordRecoveryScreenTile> {
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
    return Consumer<PasswordRecoveryProvider>(
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
                      text: '''Forgot 
Something?''',
                    ),
                    const SizedBox(height: 20),
                    const GlobalBackButton(title: 'ورود'),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SimpleHeader(
                        persian: 'فراموشی رمز عبور',
                        english: 'FORGET PASSWORD',
                      ),
                    ),
                    const SizedBox(height: 10),
                    !provider.codeSended
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: InputBox(
                              icon: FlutterIcons.phone,
                              label: 'شماره تماس خود را وارد کنید',
                              controller: provider.phoneCtrl,
                              fontfamily: 'montserrat',
                              textType: TextInputType.phone,
                            ),
                          )
                        : SizedBox(
                            width: 200,
                            // height: 100,
                            child: Column(
                              // shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
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
                                    decoration:
                                        const InputDecoration(isDense: true),
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
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    provider.timerValue != 0
                                        ? Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              'ارسال مجدد کد تا ${provider.timerValue.toString()} ثانیه دیگر',
                                              textDirection: TextDirection.rtl,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: mainFontColor,
                                              ),
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () =>
                                                provider.requestCode(context),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Text(
                                                'ارسال مجدد کد',
                                                textDirection:
                                                    TextDirection.rtl,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: mainFontColor,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                          ),
                                    const Icon(
                                      FlutterIcons.asterisk,
                                      size: 20,
                                      color: mainFontColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SubmitButton(
                        func: () {
                          if (provider.codeSended) {
                            provider.checkCode(context);
                          } else {
                            provider.requestCode(context);
                          }
                        },
                        title: 'تایید',
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
