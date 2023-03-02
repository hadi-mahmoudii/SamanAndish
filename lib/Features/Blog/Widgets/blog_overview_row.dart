import 'package:flutter/material.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Config/routes.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../Models/blog.dart';

class BlogOverviewRow extends StatelessWidget {
  final BlogModel blog;
  final TextTheme themeData;

  const BlogOverviewRow({
    Key? key,
    required this.blog,
    required this.themeData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(Routes.blogDetails, arguments: blog.id),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: (ctx, cons) => SizedBox(
              width: cons.maxWidth,
              height: 140,
              // width: User.deviceWidth * .98 - 40,
              // height: User.deviceBlockSize * 42,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: cons.maxWidth * .6,
                    height: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          blog.title,
                          style: themeData.bodyText1!
                              .copyWith(fontFamily: 'iranYekanMedium'),
                          // textScaleFactor: _pixelRatio,
                          textDirection: TextDirection.rtl,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: const Divider(
                            height: 5,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    blog.createdAt,
                                    style: themeData.headline5,
                                    // textScaleFactor: _pixelRatio,
                                    overflow: TextOverflow.visible,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                  child: const Icon(
                                    FlutterIcons.clock,
                                    size: 10,
                                    color: Color(0XFF1B2749),
                                  ),
                                ),
                              ],
                            ),

                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // Container(
                            //   // width: _pageWidth - 28,
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: <Widget>[
                            //       Expanded(
                            //         child: Text(
                            //           blog.user,
                            //           style: TextStyle(
                            //             fontSize:
                            //                 3 * User.deviceBlockSize,
                            //             // color:
                            //             //     _mainFontColor,
                            //           ),
                            //           overflow: TextOverflow.visible,
                            //           textDirection: TextDirection.rtl,
                            //           // textScaleFactor: _pixelRatio,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //           horizontal: 1,
                            //         ),
                            //         child: Icon(
                            //           Icons.person,
                            //           size: 3 * User.deviceBlockSize,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),

                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            blog.abs,
                            style: themeData.overline!
                                .copyWith(height: 1.2, fontSize: 11),
                            maxLines: 3,
                            // textScaleFactor: _pixelRatio,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            // Row(
                            //   children: <Widget>[
                            //     Text(
                            //       blog.likesCount,
                            //       style: TextStyle(
                            //         fontFamily: 'montserrat',
                            //         fontSize: 3 * User.deviceBlockSize,
                            //         // color: _secondColor,
                            //       ),
                            //     ),
                            //     Container(
                            //       margin: EdgeInsets.symmetric(
                            //         horizontal: 2,
                            //         // vertical: 5,
                            //       ),
                            //       padding: EdgeInsets.all(3),
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(
                            //             5 * User.deviceBlockSize),
                            //         color:
                            //             Theme.of(context).accentColor,
                            //         boxShadow: [
                            //           BoxShadow(
                            //             // color: _secondColor,
                            //             blurRadius: 3.0,
                            //             spreadRadius: 1.0,
                            //             offset: Offset(
                            //               00.0,
                            //               1.0,
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(2.0),
                            //         child: Icon(
                            //           FontAwesomeIcons.solidHeart,
                            //           size: 4 * User.deviceBlockSize,
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       margin: EdgeInsets.symmetric(
                            //         horizontal: 2,
                            //         // vertical: 5,
                            //       ),
                            //       padding: EdgeInsets.all(3),
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(
                            //             5 * User.deviceBlockSize),
                            //         color: Color.fromRGBO(
                            //             0x1B, 0x27, 0x49, 1),
                            //         boxShadow: [
                            //           BoxShadow(
                            //             color: Color.fromRGBO(
                            //                 0x1B, 0x27, 0x49, 1),
                            //             blurRadius: 3.0,
                            //             spreadRadius: 1.0,
                            //             offset: Offset(
                            //               00.0,
                            //               1.0,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(2.0),
                            //         child: Icon(
                            //           Icons.share,
                            //           size: 4 * User.deviceBlockSize,
                            //           color: Colors.white,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            GestureDetector(
                              // onTap: () => Navigator.of(context)
                              //     .pushNamed(Routes.commentScreen),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    blog.commentsCount,
                                    style: const TextStyle(
                                      fontFamily: 'montserrat',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: mainFontColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    FlutterIcons.chat_alt,
                                    size: 20,
                                    color: mainFontColor,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        blog.thumbnail,
                        fit: BoxFit.fill,
                        // width: 80,
                        height: 140,
                        // color: Colors.red,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
