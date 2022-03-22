import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uberdriver/formValidations.dart';
import 'package:uberdriver/helpers/screen_navigation.dart';
import 'package:uberdriver/otherauthscreens/phoneauthpackage.dart';
import 'package:uberdriver/providers/app_provider.dart';
import 'package:uberdriver/providers/user.dart';
import 'package:uberdriver/widgets/custom_btn.dart';
import 'package:uberdriver/widgets/custom_text.dart';
import 'package:uberdriver/widgets/customtextformfield.dart';

class CarRegistration extends StatelessWidget {
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
                  "Vehicle Details",
                  style: _theme.textTheme.titleMedium!.merge(
                    const TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              screen4(context),
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
                        await authProvider
                            .signUp(context, app.position)
                            .then((value) async {
                          if (value == true) {
                            try {
                              await changeScreenReplacement(
                                  context, const MainOtpPage());
                            } catch (e) {
                              Fluttertoast.showToast(msg: e.toString());
                            }
                          } else {
                            Fluttertoast.showToast(
                                msg: "Incorrect Credentials");
                          }
                        });
                      } catch (e) {
                        _key.currentState!.showSnackBar(const SnackBar(
                            content: Text("Registration failed!")));
                      }
                    }
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

  Widget screen2(BuildContext context) {
    final UserProvider authProvider = Provider.of<UserProvider>(context);

    return Form(
      key: _sighnupKey,
      child: Column(
        children: <Widget>[
          CustomTextFormField(
            suffixIcon: const Icon(Icons.precision_manufacturing_rounded),
            formvalidator: validatename,
            givencontroller: authProvider.name,
            hintText: "Manufacture of your boda/vehicle",
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.email),
            formvalidator: validateemail,
            hintText: "Vehicle Year of Manufacture",
            givencontroller: authProvider.email,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.model_training_outlined),
            formvalidator: validateemail,
            hintText: "Vehicle Model",
            givencontroller: authProvider.email,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.area_chart_outlined),
            hintText: "Number Plate",
            givencontroller: authProvider.countrycode,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.color_lens_outlined),
            formvalidator: validatephone,
            hintText: "Colour",
            givencontroller: authProvider.phone,
          ),
        ],
      ),
    );
  }

  Widget screen3(BuildContext context) {
    final UserProvider authProvider = Provider.of<UserProvider>(context);

    return Form(
      key: _sighnupKey,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              CustomText(
                text: "Legal and Pricing Details",
                size: 26,
                weight: FontWeight.w800,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: Center(
                  child: CustomText(
                    text:
                        "Your National ID and license details will be kept private",
                    size: 18,
                    weight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.email),
            formvalidator: validateemail,
            hintText: "National Id Number",
            givencontroller: authProvider.email,
          ),
          CustomText(
            text:
                "Your Social security number of country's alternative(e.g.BVN)",
            weight: FontWeight.w400,
            color: Colors.black38,
          ),
          const SizedBox(
            height: 30.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.area_chart_outlined),
            hintText: "Driver Licence Reference Number",
            givencontroller: authProvider.countrycode,
          ),
          Row(
            children: [
              CustomText(
                text: "License Number on your Driver's Documents",
                weight: FontWeight.w400,
                color: Colors.black38,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget screen4(BuildContext context) {
    final UserProvider authProvider = Provider.of<UserProvider>(context);

    return Form(
      key: _sighnupKey,
      child: Column(
        children: <Widget>[
          Center(
            //mainAxisAlignment: MainAxisAlignment.center,
            child: CustomText(
              text: "Documents",
              size: 29,
              weight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: Center(
                  child: CustomText(
                    text:
                        "We're legally required to ask you for some documents to sign you up as a driver. Documents scans and quality photos are accepted",
                    size: 18,
                    weight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CustomLargeContainer(
            header: "National ID",
            btnName: "Upload File",
            btnfc: () {},
            customtext:
                "Upload a Clear Kenyan National ID (Front side display details).",
          ),
          SizedBox(
            height: 20,
          ),
          CustomLargeContainer(
            header: "Driver Profile Photo",
            btnName: "Upload File",
            btnfc: () {},
            customtext:
                "Upload your portrait photo on a clear plain background. Remember to smile too.",
          ),
          Container(
            child: Column(
              children: [
                Flexible(
                    child: Text(
                        "Upload a Clear picture of your Kenyan Driving License, or International Dl. Ensure the Expiry Date is visible")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Expires on:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CustomTextFormField(
                    hintText: "Year", givencontroller: authProvider.cvv),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    hintText: "Year",
                    givencontroller: authProvider.countrycode),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomLargeContainer extends StatelessWidget {
  const CustomLargeContainer({
    Key? key,
    required this.header,
    required this.btnName,
    required this.btnfc,
    required this.customtext,
  }) : super(key: key);

  final String header;
  final String btnName;
  final String customtext;
  final Function btnfc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: header,
                size: 26,
                color: Colors.black87,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(text: customtext),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [CustomBtn(text: "Upload File", onTap: () {})],
          )
        ],
      ),
    );
  }
}
