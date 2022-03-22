import 'package:uberdriver/helpers/style.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Color txtColor;
  final Color bgColor;
  final Color shadowColor;
  final Function onTap;
  final FontWeight weight;

  const CustomBtn(
      {Key? key,
      required this.text,
      this.txtColor = Colors.white,
      this.bgColor = Colors.green,
      this.weight = FontWeight.normal,
      this.shadowColor = Colors.grey,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          onTap();
        } catch (e) {
          print(e.toString());
        }
      },
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
            weight: weight,
          ),
        ),
      ),
    );
  }
}
