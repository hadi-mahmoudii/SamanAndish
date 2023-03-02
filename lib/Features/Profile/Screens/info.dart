// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Widgets/date_picker.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/input_box.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../../../Core/Widgets/submit_button.dart';
import '../Providers/info.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InfoProvider>(
      create: (ctx) => InfoProvider(),
      child: const InfoScreenTile(),
    );
  }
}

class InfoScreenTile extends StatefulWidget {
  const InfoScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _InfoScreenTileState createState() => _InfoScreenTileState();
}

class _InfoScreenTileState extends State<InfoScreenTile> {
  @override
  initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<InfoProvider>(context, listen: false).getDatas(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoProvider>(
      builder: (ctx, provider, _) => Scaffold(
        appBar: const GlobalAppBar(
          eLabel: 'PERSONAL INFO',
          pLabel: 'اطلاعات شخصی من',
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : RefreshIndicator(
                onRefresh: () async => provider.getDatas(context),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: InputBox(
                              icon: FlutterIcons.user,
                              label: 'نام خانوادگی',
                              controller: provider.lNameCtrl,
                              validator: (String value) {
                                if (value.isEmpty)
                                  return 'این فیلد موردنیاز است';
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: InputBox(
                              icon: FlutterIcons.user,
                              label: 'نام',
                              controller: provider.nameCtrl,
                              validator: (String value) {
                                if (value.isEmpty)
                                  return 'این فیلد موردنیاز است';
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InputBox(
                        icon: Icons.email,
                        label: 'پست الکترونیک',
                        controller: provider.emailCtrl,
                        validator: (String value) {
                          if (value.isEmpty) return 'این فیلد موردنیاز است';
                          return null;
                        },
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                        fontfamily: 'montserrat',
                        textType: TextInputType.emailAddress,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: StaticBottomSelector(
                    //           icon: FlutterIcons.align_right,
                    //           label: 'شهرمحل سکونت',
                    //           controller: provider.cityCtrl,
                    //           datas: const [],
                    //           color: const Color(0XFF707070),
                    //         ),
                    //       ),
                    //       const SizedBox(width: 10),
                    //       Expanded(
                    //         child: StaticBottomSelector(
                    //           icon: FlutterIcons.align_right,
                    //           label: 'استان محل سکونت',
                    //           controller: provider.provienceCtrl,
                    //           datas: const [],
                    //           color: const Color(0XFF707070),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: DatePicker(
                        icon: FlutterIcons.birthday,
                        label: 'تاریخ تولد',
                        controller: provider.birthCtrl,
                        color: const Color(0XFF707070),
                        dateLabelCtrl: provider.birthLabelCtrl,
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
                        func: () => provider.changeInfo(context),
                        title: 'ذخیره ی اطلاعات',
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
