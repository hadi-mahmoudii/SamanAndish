// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samanandish/Core/Config/app_session.dart';

// import '../Config/app_session.dart';

class InputBox extends StatefulWidget {
  // final Color? color;
  final IconData? icon;
  final String? label;
  final Function? function;
  final Function? onTapFunction;
  final TextEditingController? controller;
  final bool enable;
  final TextInputType textType;
  final bool readOnly;
  final int minLines;
  final int maxLines;
  final bool mustFill;
  final Function? validator;
  final int? maxLength;
  final double fontSize;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final String fontfamily;

  final bool hideContent;
  final bool letPersianText;

  const InputBox({
    Key? key,
    // @required this.color,
    @required this.icon,
    @required this.label,
    @required this.controller,
    this.function,
    this.onTapFunction,
    this.enable = true,
    this.textType = TextInputType.text,
    this.readOnly = false,
    this.minLines = 1,
    this.maxLines = 5,
    this.mustFill = false,
    this.fontSize = 13,
    this.textDirection = TextDirection.rtl,
    this.textAlign = TextAlign.right,
    this.validator,
    this.maxLength,
    this.hideContent = false,
    this.letPersianText = true,
    this.fontfamily = 'iranyekanregular',
  }) : super(key: key);

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  bool isTapped = false;
  Function? validator;
  @override
  void initState() {
    //this use for set default validator
    if (widget.validator != null)
      validator = widget.validator;
    else
      validator = (value) {
        return null;
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.transparent,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: FocusScope(
          onFocusChange: (val) {
            setState(() {
              isTapped = val;
            });
          },
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.hideContent,
            enabled: widget.enable,
            readOnly: widget.readOnly,
            onTap: widget.onTapFunction != null
                ? () async {
                    widget.onTapFunction!();
                  }
                : () {},
            inputFormatters: !widget.letPersianText
                ? [
                    FilteringTextInputFormatter.deny(RegExp(r'[^\x00-\x7F]+')),
                  ]
                : [],
            validator: (val) => validator!(val),
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              counterText: '',
              // isDense: true,
              // border: InputBorder.none,
              labelText: widget.label,
              labelStyle: TextStyle(
                fontSize: widget.fontSize * 4 / 5,
                color: isTapped
                    ? const Color(0XFF707070)
                    : const Color(0XFF707070).withOpacity(.5),
                fontFamily: 'iranyekan',
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.5),
                ),
                // borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: mainFontColor,
                ),
                // borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                // borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                // borderRadius: BorderRadius.circular(15),
              ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: widget.color!,
              //   ),
              //   borderRadius: BorderRadius.circular(15),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: widget.color!.withOpacity(.5),
              //   ),
              //   borderRadius: BorderRadius.circular(15),
              // ),
              // errorBorder: InputBorder.none,
              // disabledBorder: InputBorder.none,
              prefixIcon: InkWell(
                onTap:
                    widget.function != null ? () => widget.function!() : () {},
                child: Icon(
                  widget.icon,
                  color: isTapped
                      ? const Color(0XFF707070)
                      : const Color(0XFF707070).withOpacity(.5),

                  // size: 5 * AppSession.deviceBlockSize,
                ),
              ),
            ),
            // cursorColor: widget.color,
            style: TextStyle(
              fontSize: widget.fontSize,
              color: isTapped ? Colors.black : Colors.black.withOpacity(.5),
              fontFamily: widget.fontfamily,
            ),
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            keyboardType: widget.textType,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
          ),
        ),
      ),
    );
  }
}
