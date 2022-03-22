import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/MainPages/MainPage.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/registerpage.dart';
import 'package:taxiapp/OtherScreens/otherconstants/constants.dart';
import 'package:taxiapp/OtherScreens/otherconstants/formValidations.dart';
import 'package:taxiapp/OtherScreens/otherwidgets/customtextformfield.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/providers/user.dart';
import 'package:taxiapp/screens/home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    UserProvider authProvider = Provider.of<UserProvider>(context);

    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => Register())));
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: _theme.primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Log In",
                  style: _theme.textTheme.headlineMedium!.merge(
                    const TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              _loginForm(context),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();

  Widget _loginForm(BuildContext context) {
    bool isloading = false;
    final UserProvider authProvider = Provider.of<UserProvider>(context);

    final ThemeData _theme = Theme.of(context);
    return Form(
      key: _loginformKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomTextFormField(
            suffixIcon: const Icon(Icons.email),
            hintText: "Email",
            givencontroller: authProvider.email,
            formvalidator: validateemail,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.lock),
            hintText: "Password",
            givencontroller: authProvider.password,
            formvalidator: validatepassword,
            obscuretext: true,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "Forgot password?",
            style: TextStyle(
                color: _theme.primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45.0,
            color: _theme.primaryColor,
            child: TextButton(
              onPressed: () async {
                if (_loginformKey.currentState!.validate()) {
                  //  try {
                  await authProvider.signIn().then((value) async {
                    if (value == true) {
                      print("the user id is registered already");
                      await changeScreenReplacement(context, MainPage());
                      // .then((value) => authProvider.clearController());
                    } else {
                      Fluttertoast.showToast(msg: "Incorrect Credentials");
                      print("the user id is not registered already");
                    }
                  });
                  //  } catch (e) {
                  // ?
                }
              },
              child: const Text(
                "LOG IN",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
