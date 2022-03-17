import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/helpers/style.dart';
import 'package:taxiapp/providers/app_state.dart';
import 'package:taxiapp/providers/user.dart';
import 'package:taxiapp/widgets/custom_text.dart';
import 'package:taxiapp/widgets/loading.dart';

import 'home.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    UserProvider authProvider = Provider.of<UserProvider>(context);
    AppStateProvider app = Provider.of<AppStateProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: Colors.deepOrange,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: white,
                    height: 100,
                  ),
                  Container(
                    color: white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/lg.png",
                          width: 230,
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    color: white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: authProvider.name,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: white),
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: white),
                              labelText: "Name",
                              hintText: "eg: Doe Enoque",
                              icon: Icon(
                                Icons.person,
                                color: white,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: authProvider.email,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: white),
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: white),
                              labelText: "Email",
                              hintText: "test@gmail.com",
                              icon: Icon(
                                Icons.email,
                                color: white,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: authProvider.phone,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: white),
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: white),
                              labelText: "Phone",
                              hintText: "+2547 3213452",
                              icon: Icon(
                                Icons.phone,
                                color: white,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: white),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: authProvider.password,
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(color: white),
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: white),
                              labelText: "Password",
                              hintText: "at least 6 digits",
                              icon: Icon(
                                Icons.lock,
                                color: white,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () async {
                        if (!await authProvider.signUp(context)) {
                          try {
                            _key.currentState!.showSnackBar(const SnackBar(
                                content: Text("Registration failed!")));
                          } catch (e) {
                            print(e.toString());
                          }
                          return;
                        } else {
                          authProvider.clearController();
                          changeScreenReplacement(context, LoginScreen());
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomText(
                                text: "Register",
                                color: white,
                                size: 22,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeScreen(context, LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(
                          text: "Login here",
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
