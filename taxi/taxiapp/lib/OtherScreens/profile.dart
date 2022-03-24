import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/OtherScreens/otherwidgets/customtextformfield.dart';
import 'package:taxiapp/helpers/constants.dart';
import 'package:taxiapp/providers/user.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _image;

  Future getImage(ImgSource source) async {
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
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider authProvider = Provider.of<UserProvider>(context);
    authProvider.name.text = authProvider.userModel.namevalue.toString();
    authProvider.email.text = authProvider.userModel.emailvalue.toString();
    authProvider.phone.text = authProvider.userModel.phonevalue.toString();
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.times),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Hello, " + authProvider.userModel.name,
                      style: _theme.textTheme.titleMedium!.merge(
                          const TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getImage(ImgSource.Both);
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: _image != null
                              ? Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.file(File(_image.path),
                                      fit: BoxFit.fitWidth))
                              : Container(
                                  height: 80,
                                  width: 80,
                                  child: FadeInImage(
                                    image: NetworkImage(
                                        authProvider.userModel.tokenvalue),
                                    placeholder:
                                        AssetImage("assets/images/user.png"),
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/user.png',
                                          fit: BoxFit.fitWidth);
                                    },
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35.0,
              ),
              CustomTextFormField(
                hintText: "Full Name",
                givencontroller: authProvider.name,
                // value: "Olayemi Garuba",
              ),
              const SizedBox(
                height: 25.0,
              ),
              CustomTextFormField(
                hintText: "Email Address",
                givencontroller: authProvider.email,

                //   value: "donyemisco@gmail.com",
                suffixIcon: Icon(
                  Icons.check_circle,
                  color: _theme.primaryColor,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              CustomTextFormField(
                hintText: "Phone Number",
                givencontroller: authProvider.phone,

                //   value: "444-509-980-103",
              ),
              const SizedBox(
                height: 80.0,
              ),
              Container(
                color: Colors.yellow,
                height: 40.0,
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  onPressed: () {},
                  child: const Text(
                    "UPDATE PROFILE",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: _theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
