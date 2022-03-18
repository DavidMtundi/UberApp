import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/loginpage.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/providers/user.dart';
import 'package:taxiapp/screens/home.dart';

class MainOtpPage extends StatefulWidget {
  const MainOtpPage({Key? key}) : super(key: key);

  @override
  State<MainOtpPage> createState() => MainOtpPageState();
}

class MainOtpPageState extends State<MainOtpPage> {
  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    UserProvider authProvider = Provider.of<UserProvider>(context);

    setState(() {
      phoneNumber = (authProvider.countrycode.text.toString() +
              authProvider.phone.text.toString())
          .toString();
    });
    return FirebasePhoneAuthProvider(
      // child: MaterialApp(
      //debugShowCheckedModeBanner: false,
      child: VerifyPhoneNumberScreen(phoneNumber: phoneNumber),
      //  ),
    );
  }
}

// ignore: must_be_immutable
class VerifyPhoneNumberScreen extends StatefulWidget {
  final String phoneNumber;

  VerifyPhoneNumberScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  bool isloading = true;

  String? _enteredOTP;

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider authProvider = Provider.of<UserProvider>(context);

    return SafeArea(
      child: FirebasePhoneAuthHandler(
        phoneNumber: widget.phoneNumber,
        timeOutDuration: const Duration(seconds: 60),
        onLoginSuccess: (userCredential, autoVerified) async {
          _showSnackBar(
            context,
            'Phone number verified successfully!',
          );
          setState(() {
            isloading = false;
          });
          //! save person details then
          await changeScreenReplacement(context, Login())
              .then((value) => authProvider.clearController());
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => Login()));

          debugPrint("Login Success UID: ${userCredential.user?.uid}");
        },
        onLoginFailed: (authException) {
          setState(() {
            isloading = false;
          });
          _showSnackBar(
            context,
            'Something went wrong (${authException.message})',
          );

          debugPrint(authException.message);
          // handle error further if needed
        },
        builder: (context, controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Verify Phone Number"),
              actions: [
                if (controller.codeSent)
                  TextButton(
                    child: Text(
                      controller.timerIsActive
                          ? "${controller.timerCount.inSeconds}s"
                          : "RESEND",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: controller.timerIsActive
                        ? null
                        : () async => await controller.sendOTP(),
                  ),
                const SizedBox(width: 5),
              ],
            ),
            body: controller.codeSent
                ? ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "We've sent an SMS with a \n verification code to \n ${widget.phoneNumber}",
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: controller.timerIsActive ? null : 0,
                        child: Column(
                          children: const [
                            CircularProgressIndicator.adaptive(),
                            SizedBox(height: 50),
                            Text(
                              "Waiting for the OTP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Divider(),
                            Text("OR", textAlign: TextAlign.center),
                            Divider(),
                          ],
                        ),
                      ),
                      const Text(
                        "Enter OTP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        onChanged: (String v) async {
                          _enteredOTP = v;
                          if (_enteredOTP?.length == 6) {
                            final isValidOTP = await controller.verifyOTP(
                              otp: _enteredOTP!,
                            );
                            // Incorrect OTP
                            if (!isValidOTP) {
                              _showSnackBar(
                                context,
                                "Please enter the correct OTP sent to ${widget.phoneNumber}",
                              );
                              setState(() {
                                isloading = false;
                              });
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            }
                          }
                        },
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.commentDots, size: 150),
                      const SizedBox(height: 100),
                      isloading
                          ? const CircularProgressIndicator.adaptive()
                          : SizedBox(),
                      const SizedBox(height: 100),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Sending OTP to Phone Number \n ${widget.phoneNumber}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Please Wait......",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
