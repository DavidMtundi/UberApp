import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/loginpage.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/phoneauthpackage.dart';
import 'package:taxiapp/OtherScreens/otherconstants/formValidations.dart';
import 'package:taxiapp/OtherScreens/otherwidgets/customtextformfield.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/providers/user.dart';
import 'package:taxiapp/screens/home.dart';
import 'package:taxiapp/widgets/customloginScreen.dart';

import 'loginpage.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool isloading = false;
    UserProvider authProvider = Provider.of<UserProvider>(context);

    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Log In",
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
                  "Sign Up",
                  style: _theme.textTheme.titleMedium!.merge(
                    const TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              _signupForm(context),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 30.0),
                height: 45.0,
                child: FlatButton(
                  color: _theme.primaryColor,
                  onPressed: () async {
                    if (_sighnupKey.currentState!.validate()) {
                      try {
                        await authProvider.signUp(context).then((value) async {
                          if (value == true) {
                            try {
                              await changeScreenReplacement(context, Login());
                            } catch (e) {
                              Fluttertoast.showToast(msg: e.toString());
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Incorrect Credentials");
                          }
                        }).catchError((ex) {
                          Fluttertoast.showToast(msg: ex.toString());
                        });
                      } catch (e) {
                        _key.currentState!.showSnackBar(const SnackBar(
                            content: Text("Registration failed!")));
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please Fill in all the Required Details");
                    }
                  },
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text("Or"),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Center(
                  child: isloading
                      ? CustomLoadingContainer()
                      : TextButton.icon(
                          onPressed: () async {
                            setState(() {
                              isloading = true;
                            });

                            try {
                              if (await authProvider.signInWithGoogle() ==
                                  true) {
                                changeScreenReplacement(
                                    context, MyHomePage(title: 'title'));
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Problem Signing in");
                              }
                            } catch (e) {
                              setState(() {
                                isloading = false;
                              });
                            }

                            //AuthService().handleAuth();
                          },
                          label: const Text(
                            'Google SignIn',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          icon: const Icon(Icons.arrow_forward_rounded),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _sighnupKey = GlobalKey<FormState>();

  Widget _signupForm(BuildContext context) {
    final UserProvider authProvider = Provider.of<UserProvider>(context);

    return Form(
      key: _sighnupKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: CustomTextFormField(
                  suffixIcon: const Icon(Icons.person),
                  formvalidator: validatename,
                  givencontroller: authProvider.name,
                  hintText: "First name",
                ),
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: CustomTextFormField(
                  suffixIcon: const Icon(Icons.person_add),
                  hintText: "Last name",
                  givencontroller: authProvider.lastname,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.email),
            formvalidator: validateemail,
            hintText: "Email",
            givencontroller: authProvider.email,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 120.0,
                child: CustomTextFormField(
                  suffixIcon: const Icon(Icons.area_chart_outlined),
                  hintText: "+254",
                  givencontroller: authProvider.countrycode,
                ),
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: CustomTextFormField(
                  suffixIcon: const Icon(Icons.phone),
                  formvalidator: validatephone,
                  hintText: "Phone number",
                  givencontroller: authProvider.phone,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.lock),
            formvalidator: validatepassword,
            hintText: "Password",
            givencontroller: authProvider.password,
            obscuretext: true,
          ),
          const SizedBox(
            height: 25.0,
          ),
          const Text(
            "By clicking \"Sign Up\" you agree to our terms and conditions as well as our pricacy policy",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white24),
          )
        ],
      ),
    );
  }
}
