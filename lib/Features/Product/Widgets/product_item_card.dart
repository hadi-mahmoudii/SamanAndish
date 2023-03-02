import 'package:flutter/material.dart';

import '../../../Core/Config/routes.dart';
import '../Models/category_product.dart';

class ProductItemCard extends StatelessWidget {
  final CategoryProductModel datas;
  final TextTheme themeData;
  const ProductItemCard(
    this.datas,
    this.themeData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: User.deviceBlockSize * 40,
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 8.0,
        //     offset: Offset(
        //       00.0,
        //       4.0,
        //     ),
        //   )
        // ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          Routes.productDetails,
          arguments: datas.id,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            // width: (User.deviceWidth - 60) / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white60,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // SizedBox(
                //   height: 10,
                // ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (ctx, cons) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        datas.image,
                        fit: BoxFit.cover,
                        // image: NetworkImage(datas.image),
                        width: cons.maxWidth,
                        height: cons.maxWidth,
                        // height: 3  5 * User.deviceBlockSize,
                        // width: 35 * User.deviceBlockSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        width: double.infinity,
                        child: Text(
                          datas.name,
                          textDirection: TextDirection.rtl,
                          style: themeData.bodyText1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 1),
                        width: double.infinity,
                        child: Text(
                          datas.nameE,
                          textDirection: TextDirection.rtl,
                          style: themeData.headline2!.copyWith(
                            fontSize: 7,
                            fontFamily: 'montserrat',
                            letterSpacing: 2.5,
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 2),
                      //   width: double.infinity,
                      //   child: Row(
                      //     children: <Widget>[
                      //       Spacer(),
                      //       Text(
                      //         '3'.toString(),
                      //         style: TextStyle(
                      //           fontSize: 3 * User.deviceBlockSize,
                      //           fontFamily: 'montserrat',
                      //           color: _mainFontColor,
                      //         ),
                      //       ),
                      //       RatingBar(
                      //         ignoreGestures: true,
                      //         initialRating: 3,
                      //         direction: Axis.horizontal,
                      //         itemCount: 5,
                      //         itemSize: 4 * User.deviceBlockSize,
                      //         itemPadding:
                      //             EdgeInsets.all(User.deviceBlockSize / 3),
                      //         itemBuilder: (context, _) => Icon(
                      //           Icons.star,
                      //           color: Colors.amber,
                      //         ),
                      //         onRatingUpdate: (rating) {
                      //           // setState(
                      //           //   () {
                      //           //     _itemStar = rating;
                      //           //   },
                      //           // );
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
