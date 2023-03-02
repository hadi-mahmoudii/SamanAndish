import 'package:flutter/material.dart';
import '../../../Core/Config/app_session.dart';

import '../../../Core/Config/routes.dart';

class UnloginUserContainer extends StatelessWidget {
  const UnloginUserContainer({
    Key? key,
    // @required double deviceBlockSize,
    // @required double deviceHeightBlockSize,
  }) :
        // this.deviceBlockSize = deviceBlockSize,
        // _deviceHeightBlockSize = deviceHeightBlockSize,
        super(key: key);

  // final double deviceBlockSize;
  // final double _deviceHeightBlockSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // SizedBox(
              //   height: User.deviceHeigth / 6,
              // ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                // width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: mainFontColor,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Widget>[
                    Text(
                      'لطفــــــــــــــــا ابتدا',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 25,
                        color: mainFontColor,
                      ),
                    ),
                    Text(
                      'به حساب کاربری خود',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: mainFontColor,
                      ),
                    ),
                    Text(
                      'وارد شـــــــــــوید',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 25,
                        color: mainFontColor,
                      ),
                    ),
                    Text(
                      'PLEASE DO LOGIN',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black12,
                        fontFamily: 'montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(Routes.login),
                child: Container(
                  // margin: EdgeInsets.only(
                  //   top: 4 * _deviceHeightBlockSize,
                  //   bottom: 2 * _deviceHeightBlockSize,
                  // ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: mainFontColor,
                  ),
                  height: 40,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'ورود',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: User.deviceHeigth / 6,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
