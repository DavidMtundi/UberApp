import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uberdriver/constants.dart';
import 'package:uberdriver/helpers/screen_navigation.dart';
import 'package:uberdriver/otherauthscreens/loginpage.dart';
import 'package:uberdriver/otherauthscreens/multistage.dart';
import 'package:uberdriver/otherauthscreens/registerpage.dart';
import 'package:uberdriver/widgets/custom_btn.dart';

class UnAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Image.asset(
                  "assets/images/rides.jpg",
                  // height: 100,
                  fit: BoxFit.fill,
                ),
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0, left: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              height: 130.0,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Drive. Deliver.",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Earn With Ride Share.",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              height: 120.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: CustomBtn(
                        text: "Login",
                        onTap: () {
                          changeScreen(context, Login());
                        },
                        bgColor: Colors.green,
                        weight: FontWeight.bold,
                      )),
                      const SizedBox(width: 20.0),
                      Expanded(
                          child: CustomBtn(
                        text: "Register",
                        onTap: () {
                          changeScreen(context, Register());
                        },
                        weight: FontWeight.bold,
                        bgColor: Colors.white60,
                        txtColor: Colors.black,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
