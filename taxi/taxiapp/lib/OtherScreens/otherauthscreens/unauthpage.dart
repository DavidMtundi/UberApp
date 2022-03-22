import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/loginpage.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/registerpage.dart';
import 'package:taxiapp/OtherScreens/otherconstants/constants.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/helpers/style.dart';
import 'package:taxiapp/widgets/custom_btn.dart';

class UnAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  "assets/images/rides.jpg",
                  // height: 100,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: _theme.primaryColor,
              ),
              height: 150.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:
                            //CustomBtn(text: "Login", onTap: () {}
                            Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white30,
                              boxShadow: [
                                BoxShadow(
                                    color: green.withOpacity(0.5),
                                    offset: Offset(2, 3),
                                    blurRadius: 4)
                              ]),
                          child: TextButton(
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 40.0),
                      // CustomBtn(
                      //     text: "REGISTER",
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => Register()));
                      //     }),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: black,
                              boxShadow: [
                                BoxShadow(
                                    color: green.withOpacity(0.5),
                                    offset: Offset(2, 3),
                                    blurRadius: 4)
                              ]),
                          child: TextButton(
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                          ),
                        ),
                        // child: FlatButton(
                        //   color: facebookColor,
                        //   child: const Text(
                        //     "REGISTER",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Register()));
                        //   },
                        // ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: Divider(
                  //         color: dbasicGreyColor,
                  //       ),
                  //     ),
                  //     Container(
                  //       child: const Text(
                  //         "Or connect with social",
                  //       ),
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 15.0,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Divider(
                  //         color: dbasicGreyColor,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 15.0),
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 15.0,
                  //   ),
                  //   height: 45.0,
                  //   decoration: BoxDecoration(
                  //     color: facebookColor,
                  //     borderRadius: BorderRadius.circular(6.0),
                  //   ),
                  //   child: Row(
                  //     children: const <Widget>[
                  //       Icon(
                  //         FontAwesomeIcons.googlePlusG,
                  //         color: Colors.white,
                  //       ),
                  //       Expanded(
                  //         child: Text(
                  //           "Login with Google",
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 15.0),
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 15.0,
                  //   ),
                  //   height: 45.0,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: _theme.primaryColor),
                  //     borderRadius: BorderRadius.circular(6.0),
                  //   ),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Icon(
                  //         FontAwesomeIcons.google,
                  //         color: _theme.primaryColor,
                  //       ),
                  //       Expanded(
                  //         child: Text(
                  //           "Login with Google",
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             color: _theme.primaryColor,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       )
                  //    ],
                  //  ),
                  //  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
