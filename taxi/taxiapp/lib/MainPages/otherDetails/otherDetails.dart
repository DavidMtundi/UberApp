import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/MainPages/otherDetails/widgets/customContainerHeader.dart';
import 'package:taxiapp/MainPages/otherDetails/widgets/customContainerSmall.dart';
import 'package:taxiapp/OtherScreens/DrawerScreens/router.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/loginpage.dart';
import 'package:taxiapp/OtherScreens/profile.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/providers/user.dart';
import 'package:taxiapp/widgets/custom_text.dart';

class OtherProperties extends StatefulWidget {
  OtherProperties({Key? key}) : super(key: key);

  @override
  State<OtherProperties> createState() => _OtherPropertiesState();
}

class _OtherPropertiesState extends State<OtherProperties> {
  final List _drawerMenu = [
    {
      "icon": "assets/images/car.png",
      "text": "My rides",
      "route": MyRidesRoute,
    },
    {
      "icon": "assets/images/walkthrough2.png",
      "text": "Promotions",
      "route": PromotionRoute
    },
    {
      "icon": "assets/images/favourites.png",
      "text": "My favourites",
      "route": FavoritesRoute
    },
    {
      "icon": "assets/images/visa.png",
      "text": "My payments",
      "route": PaymentRoute,
    },
    {
      "icon": "assets/images/notification.png",
      "text": "Notification",
    },
    {
      "icon": "assets/images/chat.png",
      "text": "Support",
      "route": ChatRiderRoute,
    }
  ];
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // leading: backButtonVisible
          //     ?
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          )
          // : null,
          ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(right: 10),
        // width: MediaQuery.of(context).size.width -
        //     (MediaQuery.of(context).size.width * 0.1),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    changeScreen(context, Profile());
                  },
                  child: CustomContainerHeader(
                    title: userProvider.userModel.name,
                    img: "assets/images/user.png",
                    email: userProvider.userModel.email,
                    phone: userProvider.userModel.phone,
                  ),
                ),

                Expanded(
                  child: Container(
                      child: ListView(
                          children: _drawerMenu.map((menu) {
                    return Column(
                      children: [
                        const Divider(
                          height: 3,
                          color: Colors.black12,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(menu["route"]);
                            },
                            child: CustomContainerSmall(
                              img: menu["icon"],
                              title: menu["text"],
                            )),
                        const Divider(
                          height: 3,
                          color: Colors.black12,
                        ),
                      ],
                    );
                  }).toList())),
                ),
                // Expanded(
                //   child: Container(
                //     padding: const EdgeInsets.only(
                //       top: 1.0,
                //     ),
                //  child:
                // Container(
                //   // height: 150,
                //   child: ListView(
                //     children: _drawerMenu.map((menu) {
                //       return GestureDetector(
                //         onTap: () {
                //           Navigator.of(context).pushNamed(menu["route"]);
                //         },
                //         child:
                //             //  Column(
                //             //   children: [
                //             // const Divider(
                //             //   height: 1,
                //             //   color: Colors.black12,
                //             // ),
                //             CustomContainerSmall(
                //                 title: menu["text"], img: menu["icon"]),
                //         // const Divider(
                //         //   height: 1,
                //         //   color: Colors.black12,
                //         // ),
                //         //   ],
                //         // ),
                //       );
                //     }).toList(),
                //   ),
                // ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    leading: const Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    title: CustomText(
                      text: "Log out",
                      weight: FontWeight.bold,
                    ),
                    onTap: () {
                      userProvider.signOut();
                      changeScreenReplacement(context, Login());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
