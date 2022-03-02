import 'package:flutter/material.dart';
import 'package:taxiapp/helpers/style.dart';

import 'custom_text.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Color txtColor;
  final Color bgColor;
  final Color shadowColor;
  final Function onTap;

  const CustomBtn(
      {Key? key,
      required this.text,
      this.txtColor = white,
      this.bgColor = black,
      this.shadowColor = Colors.grey,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor,
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(0.5),
                  offset: Offset(2, 3),
                  blurRadius: 4)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: text,
            color: txtColor,
            size: 22,
            weight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
