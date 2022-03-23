import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/OtherScreens/otherwidgets/customtextformfield.dart';
import 'package:taxiapp/providers/user.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider authProvider = Provider.of<UserProvider>(context);

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
                  Text(
                    "Hello " + authProvider.userModel.name,
                    style: _theme.textTheme.titleMedium!.merge(const TextStyle(
                        fontSize: 26.0, fontWeight: FontWeight.bold)),
                  ),
                  const CircleAvatar(
                    radius: 25.0,
                    // backgroundImage: NetworkImage(
                    //     "https://pbs.twimg.com/profile_images/1214214436283568128/KyumFmOO.jpg"),
                  )
                ],
              ),
              const SizedBox(
                height: 35.0,
              ),
              CustomTextFormField(
                hintText: authProvider.userModel.name,
                givencontroller: authProvider.name,
                // value: "Olayemi Garuba",
              ),
              const SizedBox(
                height: 25.0,
              ),
              CustomTextFormField(
                hintText: authProvider.userModel.email,
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
                hintText: authProvider.userModel.phone,
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
