import 'package:flutter/material.dart';

Future changeScreen(BuildContext context, Widget widget) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

// request here
Future changeScreenReplacement(BuildContext context, Widget widget) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}
