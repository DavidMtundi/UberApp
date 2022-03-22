import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uberdriver/constants.dart';
import 'package:uberdriver/formValidations.dart';
import 'package:uberdriver/helpers/screen_navigation.dart';
import 'package:uberdriver/otherauthscreens/registerpage.dart';
import 'package:uberdriver/providers/user.dart';
import 'package:uberdriver/screens/home.dart';
import 'package:uberdriver/widgets/customtextformfield.dart';

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
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      "Or connect using social account",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 45.0,
                      child: FlatButton(
                        onPressed: () {},
                        color: facebookColor,
                        child: Row(
                          children: <Widget>[
                            // const Icon(
                            //   FontAwesomeIcons.googlePlusSquare,
                            //   color: Colors.white,
                            // ),
                            Expanded(
                              child: Text(
                                "Connect with Google",
                                textAlign: TextAlign.center,
                                style: _theme.textTheme.bodyMedium!.merge(
                                  const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: _theme.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(3.0)),
                      margin: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      height: 45.0,
                      child: FlatButton(
                        onPressed: () {},
                        color: _theme.scaffoldBackgroundColor,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: _theme.primaryColor,
                            ),
                            Expanded(
                              child: Text(
                                "Connect with Phone number",
                                textAlign: TextAlign.center,
                                style: _theme.textTheme.bodyMedium!.merge(
                                  TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _theme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
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
                  try {
                    await authProvider.signIn().then((value) async {
                      if (value == true) {
                        setState(() {
                          isloading = false;
                        });
                        await changeScreenReplacement(
                            context,
                            MyHomePage(
                              title: '',
                            )).then((value) => authProvider.clearController());
                      } else {
                        setState(() {
                          isloading = false;
                        });
                        Fluttertoast.showToast(msg: "Incorrect Credentials");
                      }
                    });
                  } catch (e) {
                    setState(() {
                      isloading = false;
                    });
                    _key.currentState!.showSnackBar(
                        const SnackBar(content: Text("Login failed!")));
                  }
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
