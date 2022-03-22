import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uberdriver/formValidations.dart';
import 'package:uberdriver/helpers/screen_navigation.dart';
import 'package:uberdriver/otherauthscreens/carRegistration.dart';
import 'package:uberdriver/otherauthscreens/loginpage.dart';
import 'package:uberdriver/otherauthscreens/phoneauthpackage.dart';
import 'package:uberdriver/providers/app_provider.dart';
import 'package:uberdriver/providers/user.dart';
import 'package:uberdriver/widgets/customtextformfield.dart';

class Register extends StatelessWidget {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    UserProvider authProvider = Provider.of<UserProvider>(context);
    AppStateProvider app = Provider.of<AppStateProvider>(context);

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
                    changeScreen(context, CarRegistration());
                    // if (_sighnupKey.currentState!.validate()) {
                    //   try {
                    //     await authProvider
                    //         .signUp(context, app.position)
                    //         .then((value) async {
                    //       if (value == true) {
                    //         try {
                    //           await changeScreenReplacement(
                    //               context, const MainOtpPage());
                    //         } catch (e) {
                    //           Fluttertoast.showToast(msg: e.toString());
                    //         }
                    //       } else {
                    //         Fluttertoast.showToast(
                    //             msg: "Incorrect Credentials");
                    //       }
                    //     });
                    //   } catch (e) {
                    //     _key.currentState!.showSnackBar(const SnackBar(
                    //         content: Text("Registration failed!")));
                    //   }
                    // }
                  },
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              )
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
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.insert_invitation),
            // formvalidator: validatepassword,
            hintText: "InvitationCode",
            givencontroller: authProvider.password,
            // obscuretext: true,
          ),
          const SizedBox(
            height: 25.0,
          ),
          const Text(
            "By clicking \"Sign Up\" you agree to our terms and conditions as well as our pricacy policy",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black45),
          )
        ],
      ),
    );
  }
}
