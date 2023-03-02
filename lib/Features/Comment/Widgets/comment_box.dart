import 'package:flutter/material.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../Models/comment.dart';

class CommentBox extends StatelessWidget {
  final CommentModel comment;
  final TextTheme themeData;
  const CommentBox({
    Key? key,
    required this.comment,
    required this.themeData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 20,
            top: 16,
            bottom: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // _index % 2 == 1
              //     ? ReplyHeader(
              //         'بهزاد فرزانه',
              //         ' شنبه 12 اردیبهشت 99 - 12:39',
              //         'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
              //       )
              //     : Container(),
              Row(
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 10),
                  //   child: Icon(
                  //     FontAwesomeIcons.solidHeart,
                  //     color: _secondColor,
                  //     size: 7 * _deviceWidthBlockSize,
                  //   ),
                  // ),
                  // Icon(
                  //   FontAwesomeIcons.reply,
                  //   size: 7 * _deviceWidthBlockSize,
                  //   color: _mainFontColor,
                  // ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        comment.user,
                        style: themeData.subtitle1!.copyWith(
                          fontFamily: 'iranyekanlight',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 3),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            comment.createdAt,
                            style: themeData.headline5,
                            maxLines: 1,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(width: 3),
                          const Icon(
                            FlutterIcons.clock_1,
                            size: 10,
                            color: Color(0XFF1B2749),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                child: Text(
                  comment.message,
                  style: themeData.bodyText1!
                      .copyWith(fontFamily: 'iranyekanregular'),
                  overflow: TextOverflow.ellipsis,
                  // maxLines: 4,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ReplyHeader extends StatelessWidget {
//   final String _commentWriter;
//   final String _commentDate;
//   final String _commentContent;
//   ReplyHeader(this._commentWriter, this._commentDate, this._commentContent);

//   @override
//   Widget build(BuildContext context) {
//     final _media = MediaQuery.of(context);
//     final double _pixelRatio =
//         (_media.size.height / _media.size.width * 7 / 5).roundToDouble();
//     return Container(
//       margin: EdgeInsets.only(bottom: 15),
//       padding: EdgeInsets.all(13),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(30),
//           bottomRight: Radius.circular(30),
//           bottomLeft: Radius.circular(30),
//         ),
//         border: Border.all(color: Colors.grey, width: 0.5),
//       ),
//       child: Row(
//         children: <Widget>[
//           Spacer(),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(bottom: 2),
//                 width: MediaQuery.of(context).size.width * 1 / 2,
//                 child: Text(
//                   _commentWriter,
//                   style: TextStyle(
//                     fontFamily: 'iranyekanlight',
//                     fontSize: 8,
//                   ),
//                   textScaleFactor: _pixelRatio,
//                   overflow: TextOverflow.visible,
//                   textDirection: TextDirection.rtl,
//                 ),
//               ),
//               Row(
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width * 1 / 2,
//                     child: Text(
//                       _commentDate,
//                       style: TextStyle(
//                         fontSize: 3.5,
//                       ),
//                       textScaleFactor: _pixelRatio,
//                       overflow: TextOverflow.visible,
//                       textAlign: TextAlign.right,
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(1),
//                     child: Icon(
//                       FontAwesomeIcons.clock,
//                       size: 3 * _pixelRatio,
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 11 / 20,
//                 child: Text(
//                   _commentContent,
//                   style: TextStyle(
//                     fontSize: 5,
//                     height: 1.9,
//                   ),
//                   textScaleFactor: _pixelRatio,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                   textDirection: TextDirection.rtl,
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 10),
//             child: Icon(
//               FontAwesomeIcons.reply,
//               color: Colors.grey,
//               size: 14.5 * _pixelRatio,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
