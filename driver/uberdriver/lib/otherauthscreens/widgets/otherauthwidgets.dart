import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:provider/provider.dart';
import 'package:uberdriver/otherconstants/formValidations.dart';
import 'package:uberdriver/otherwidgets/customtextformfield.dart';
import 'package:uberdriver/providers/user.dart';
import 'package:uberdriver/widgets/custom_btn.dart';
import 'package:uberdriver/widgets/custom_text.dart';

final GlobalKey<FormState> screen2key = GlobalKey<FormState>();
final GlobalKey<FormState> screen3key = GlobalKey<FormState>();
final GlobalKey<FormState> screen4key = GlobalKey<FormState>();
final GlobalKey<FormState> screen5key = GlobalKey<FormState>();

Widget screen2(BuildContext context) {
  final UserProvider authProvider =
      Provider.of<UserProvider>(context, listen: false);

  return Container(
    child: Form(
      key: screen2key,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Vehicle Details",
                size: 29,
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
                    text: "Please Provide your Vehicle details",
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
          CustomTextFormField(
            suffixIcon: const Icon(Icons.precision_manufacturing_rounded),
            formvalidator: validatename,
            givencontroller: authProvider.vmanufacture,
            hintText: "Manufacture of your boda/vehicle",
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.date_range_rounded),
            // formvalidator: validateemail,
            hintText: "Vehicle Year of Manufacture",
            givencontroller: authProvider.vyearofmanufacture,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.model_training_outlined),
            //  formvalidator: validateemail,
            hintText: "Vehicle Model",
            givencontroller: authProvider.vmodel,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.area_chart_outlined),
            hintText: "Number Plate",
            givencontroller: authProvider.vnumberplate,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.color_lens_outlined),
            formvalidator: validatephone,
            hintText: "Colour",
            givencontroller: authProvider.vcolor,
          ),
        ],
      ),
    ),
  );
}

Widget screen3(BuildContext context) {
  final UserProvider authProvider =
      Provider.of<UserProvider>(context, listen: false);
  return Container(
    child: Form(
      key: screen3key,
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
            // formvalidator: validateemail,
            hintText: "National Id Number",
            givencontroller: authProvider.vnationalid,
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
            givencontroller: authProvider.vdriverlicense,
          ),
          Row(
            children: [
              Flexible(
                child: CustomText(
                  text: "License Number on your Driver's Documents",
                  weight: FontWeight.w400,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget screen4(BuildContext context) {
  final UserProvider authProvider =
      Provider.of<UserProvider>(context, listen: false);

  return Container(
    child: Form(
      key: screen4key,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Documents",
                size: 29,
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
            btnfc: () async {
              print(" here already");

              try {
                print("Entered here already");
                await getImage(context, ImgSource.Both).then((value) {
                  authProvider.nationalidpath = value.toString();
                });

                //  authProvider.openImageScanner(context);
              } catch (e) {
                print(e.toString());
              }
            },
            customtext:
                "Upload a Clear Kenyan National ID (Front side display details).",
          ),
          SizedBox(
            height: 20,
          ),
          CustomLargeContainer(
            header: "Driver Profile Photo",
            btnName: "Upload File",
            btnfc: () {
              try {
                authProvider.openImageScanner(context);
              } catch (e) {
                print(e.toString());
              }
            },
            customtext:
                "Upload your portrait photo on a clear plain background. Remember to smile too.",
          ),
          Container(
            child: Column(
              children: [
                Text(
                    "Upload a Clear picture of your Kenyan Driving License, or International Dl. Ensure the Expiry Date is visible"),
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
    ),
  );
}

Widget screen5(BuildContext context) {
  final UserProvider authProvider =
      Provider.of<UserProvider>(context, listen: false);

  return Container(
    child: Form(
      key: screen5key,
      child: Column(
        children: <Widget>[
          Center(
            //mainAxisAlignment: MainAxisAlignment.center,
            child: CustomText(
              text: "NTSA PSV License\n (Badge)",
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
                        "Required for vehicles drivers only (not applicable for Boda riders)",
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
                Text(
                    "Upload a Clear picture of your Kenyan Driving License, \n or International Dl. \n Ensure the Expiry Date is visible"),
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
    ),
  );
}

var _image;

Future<String> getImage(BuildContext context, ImgSource source) async {
  var image = await ImagePickerGC.pickImage(
      enableCloseButton: true,
      closeIcon: Icon(
        Icons.close,
        color: Colors.red,
        size: 12,
      ),
      context: context,
      source: source,
      barrierDismissible: true,
      cameraIcon: Icon(
        Icons.camera_alt,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
      cameraText: Text(
        "From Camera",
        style: TextStyle(color: Colors.red),
      ),
      galleryText: Text(
        "From Gallery",
        style: TextStyle(color: Colors.blue),
      ));
  // setState(() {
  //   _image = image;
  // });
  return image.path;
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
