import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/OtherScreens/DrawerScreens/router.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/loginpage.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/providers/user.dart';
import 'package:taxiapp/widgets/custom_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    final ThemeData _theme = Theme.of(context);
    final List _drawerMenu = [
      {
        "icon": Icons.restore,
        "text": "My rides",
        "route": MyRidesRoute,
      },
      {
        "icon": Icons.local_activity,
        "text": "Promotions",
        "route": PromotionRoute
      },
      {
        "icon": Icons.star_border,
        "text": "My favourites",
        "route": FavoritesRoute
      },
      {
        "icon": Icons.credit_card,
        "text": "My payments",
        "route": PaymentRoute,
      },
      {
        "icon": Icons.notifications,
        "text": "Notification",
      },
      {
        "icon": Icons.chat,
        "text": "Support",
        "route": ChatRiderRoute,
      }
    ];
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width -
          (MediaQuery.of(context).size.width * 0.3),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProfileRoute);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                height: 250.0,
                color: _theme.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                            height: 80,
                            child: FadeInImage(
                              image: NetworkImage(
                                  userProvider.userModel.tokenvalue),
                              placeholder: AssetImage("assets/images/user.png"),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/images/user.png',
                                    fit: BoxFit.fitWidth);
                              },
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          userProvider.userModel.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      userProvider.userModel.email,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userProvider.userModel.phone,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.black45,
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: ListView(
                  children: _drawerMenu.map((menu) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(menu["route"]);
                      },
                      child: Column(
                        children: [
                          const Divider(
                            height: 1,
                            color: Colors.black12,
                          ),
                          ListTile(
                            leading: Icon(
                              menu["icon"],
                              color: Colors.black,
                            ),
                            title: Text(
                              menu["text"],
                              style: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
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
    );
  }
}
