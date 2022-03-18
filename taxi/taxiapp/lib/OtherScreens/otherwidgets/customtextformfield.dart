import 'package:flutter/material.dart';

import '../otherconstants/formValidations.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final double verticalPadding;
  //final String value;
  final Icon suffixIcon;
  final bool showLabel;
  String? Function(String?) formvalidator;
  TextEditingController givencontroller;
  bool obscuretext;

  CustomTextFormField(
      {Key? key,
      required this.hintText,
      this.verticalPadding = 10.0,
      this.obscuretext = false,
      // this.value = "",
      this.suffixIcon = const Icon(Icons.numbers_outlined),
      this.formvalidator = geterror,
      required this.givencontroller,
      this.showLabel = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          showLabel
              ? Text(
                  hintText.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: const Color(0xFF9CA4AA),
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            height: 7.0,
          ),
          TextFormField(
            controller: givencontroller,
            validator: formvalidator,
            obscureText: obscuretext,
            //   initialValue: value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              suffixIcon: suffixIcon != const Icon(Icons.numbers_outlined)
                  ? suffixIcon
                  : null,
              contentPadding: EdgeInsets.symmetric(
                  vertical: verticalPadding, horizontal: 15.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[400]!,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
