import 'package:flutter/material.dart';
import '../../../Core/Config/app_session.dart';

import '../Models/attribute.dart';

class AttributeVariableWidget extends StatefulWidget {
  final AttributeModel attribute;
  final TextTheme themeData;
  const AttributeVariableWidget({
    Key? key,
    required this.attribute,
    required this.themeData,
  }) : super(key: key);

  @override
  _AttributeVariableWidgetState createState() =>
      _AttributeVariableWidgetState();
}

class _AttributeVariableWidgetState extends State<AttributeVariableWidget> {
  var _curColorIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 7,
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.65 - 25,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _curColorIndex = index;
                    });
                  },
                  child: ItemRow(
                    item: widget.attribute.values[index],
                    isSelected: _curColorIndex == index ? true : false,
                    themeData: widget.themeData,
                  ),
                ),
                itemCount: widget.attribute.values.length,
              ),
            ),
          ),
          // Spacer(),
          const SizedBox(width: 10),
          Flexible(
            flex: 3,
            // color: Colors.red,
            // // padding: const EdgeInsets.all(5),
            // width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  widget.attribute.name,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.clip,
                  style: widget.themeData.headline3!.copyWith(fontSize: 17),
                ),
                Text(
                  widget.attribute.nameE,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  style: widget.themeData.headline2!.copyWith(
                    fontSize: 10,
                    fontFamily: 'montserrat',
                    color: const Color(0XFF707070),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  final AttributeItemModel item;
  final bool isSelected;
  final TextTheme themeData;

  const ItemRow(
      {Key? key,
      required this.item,
      required this.isSelected,
      required this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: isSelected ? _mainColor : Colors.white,
      color: Colors.white,
      elevation: 2,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Text(
                item.name,
                textDirection: TextDirection.rtl,
                style: themeData.bodyText1,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: isSelected ? Colors.white : _mainColor,
                color: mainFontColor,
              ),
              width: 10,
              child: const Text(' '),
            )
          ],
        ),
      ),
    );
  }
}
