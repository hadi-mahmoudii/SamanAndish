import 'package:flutter/material.dart';

import '../Models/product.dart';
// ignore_for_file: file_names

class ProductItemDetailsTable extends StatelessWidget {
  final ProductModel datas;
  // final String type;
  // final String structure;
  // final String properties;

  const ProductItemDetailsTable({
    Key? key,
    required this.datas,
    // @required this.structure,
    // @required this.properties,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, ind) => DetailsRowWidget(
        color: ind % 2 == 1 ? Colors.transparent : Colors.white,
        title: datas.otherDetails.keys.toList()[ind],
        value: datas.otherDetails.values.toList()[ind],
      ),
      separatorBuilder: (ctx, ind) => const Divider(
        height: .1,
        color: Colors.grey,
      ),
      itemCount: datas.otherDetails.keys.length,
    );
  }
}

class DetailsRowWidget extends StatelessWidget {
  final String title, value;
  final Color color;

  const DetailsRowWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding:
                          const EdgeInsets.only(right: 10, bottom: 5, top: 5),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.grey,
                          ), // provides to left side
                          // for right side
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * .45,
                      child: Text(
                        value,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'iranyekanregular',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .35,
            child: Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Color(0XFF707070),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
