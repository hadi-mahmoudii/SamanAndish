// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samanandish/Core/Widgets/back_button.dart';
import 'package:samanandish/Core/Widgets/flutter_icons.dart';
import 'package:samanandish/Core/Widgets/input_box.dart';
import 'package:samanandish/Core/Widgets/samanandish_header.dart';
import 'package:samanandish/Core/Widgets/simple_header.dart';
import 'package:samanandish/Core/Widgets/submit_button.dart';
import 'package:samanandish/Features/Auth/Providers/new_pass.dart';
import 'package:samanandish/Features/Auth/Widgets/auth_text_header.dart';

import '../../../Core/Widgets/loading_widget.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewPasswordProvider>(
      create: (ctx) => NewPasswordProvider(
          newPassToken: ModalRoute.of(context)!.settings.arguments as String),
      child: const NewPasswordScreenTile(),
    );
  }
}

class NewPasswordScreenTile extends StatefulWidget {
  const NewPasswordScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _NewPasswordScreenTileState createState() => _NewPasswordScreenTileState();
}

class _NewPasswordScreenTileState extends State<NewPasswordScreenTile> {
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
    return Consumer<NewPasswordProvider>(
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
                      text: '''keep it 
safe''',
                    ),
                    const SizedBox(height: 20),
                    const GlobalBackButton(title: 'فراموشی رمز عبور'),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SimpleHeader(
                        persian: 'تنظیم مجدد رمز عبور',
                        english: 'RESET YOUR PASSWORD',
                      ),
                    ),
                    const SizedBox(height: 10),
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
                        textDirection: TextDirection.ltr,
                        validator: (String value) {
                          if (value.isEmpty) return 'این فیلد موردنیاز است';
                          if (value.length < 8) return 'حداقل 8 حرف نیاز است';
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
                        controller: provider.rePassCtrl,
                        letPersianText: false,
                        hideContent: true,
                        maxLines: 1,
                        textDirection: TextDirection.ltr,
                        validator: (String value) {
                          if (value.isEmpty) return 'این فیلد موردنیاز است';
                          if (value.length < 8) return 'حداقل 8 حرف نیاز است';
                          if (provider.passCtrl.text !=
                              provider.rePassCtrl.text) {
                            return 'رمزها یکسان نیستند!';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SubmitButton(
                        func: () => provider.changePass(context),
                        title: 'تنظیم مجدد رمز عبور',
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
