import 'package:flutter/material.dart';

void changeScreen(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

// request here
Future changeScreenReplacement(BuildContext context, Widget widget) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}
