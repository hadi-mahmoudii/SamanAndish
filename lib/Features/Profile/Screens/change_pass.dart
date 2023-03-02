import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Widgets/flutter_icons.dart';
import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/input_box.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../../../Core/Widgets/submit_button.dart';
import '../Providers/change_pass.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangePassProvider>(
      create: (ctx) => ChangePassProvider(),
      child: const ChangePasswordScreenTile(),
    );
  }
}

class ChangePasswordScreenTile extends StatefulWidget {
  const ChangePasswordScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _ChangePasswordScreenTileState createState() =>
      _ChangePasswordScreenTileState();
}

class _ChangePasswordScreenTileState extends State<ChangePasswordScreenTile> {
  @override
  initState() {
    super.initState();
    // Future.microtask(
    //   () => Provider.of<Test>(context, listen: false).getUserDatas(context),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePassProvider>(
      builder: (ctx, provider, _) => Scaffold(
        appBar: const GlobalAppBar(
          eLabel: 'CHANGE PASSWORD',
          pLabel: 'تغییر کلمه ی عبور',
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : Form(
                key: provider.formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InputBox(
                        icon: FlutterIcons.lock,
                        label: 'رمز عبور فعلی',
                        controller: provider.oldPassCtrl,
                        hideContent: true,
                        maxLines: 1,
                        letPersianText: false,
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
                        label: 'کلمه ی عبور',
                        controller: provider.passCtrl,
                        hideContent: true,
                        letPersianText: false,
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
                        hideContent: true,
                        maxLines: 1,
                        letPersianText: false,
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(color: Colors.grey, height: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SubmitButton(
                        func: () => provider.changePass(context),
                        title: 'تغییر کلمه ی عبور',
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
