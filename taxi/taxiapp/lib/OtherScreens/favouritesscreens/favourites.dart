import 'package:flutter/material.dart';
import 'package:taxiapp/OtherScreens/DrawerScreens/router.dart';
import 'package:taxiapp/OtherScreens/favouritesscreens/updatefavourite.dart';
import 'package:taxiapp/OtherScreens/favouritesscreens/widgets/Place.dart';

import '../otherwidgets/locationscard.dart';

class Favorites extends StatelessWidget {
  final List<Place> _places = [
    Place(
        name: "BMW of Bellevue",
        address: "13424 NE, 20th St Bellevue, WA 98005"),
    Place(name: "McDonald's", address: "13424 NE, 20th St Bellevue, WA 98005"),
    Place(
        name: "Highland Track Field",
        address: "13424 NE, 20th St Bellevue, WA 98005"),
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
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
              Navigator.of(context).pushNamed(UpdateFavoritesRoute);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 25.0),
              child: Wrap(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    size: 25.0,
                    color: _theme.primaryColor,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Add",
                    style: TextStyle(
                      color: _theme.primaryColor,
                      fontSize: 18.0,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "My favorites",
              style: _theme.textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(),
            const ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0.0,
              ),
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            const Divider(),
            const ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0.0,
              ),
              leading: Icon(Icons.work),
              title: Text(
                "Work",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            const Divider(),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "OTHER PLACES",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                color: Color(0xFF9CA4AA),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              children: _places
                  .map(
                    (place) => LocationCard(place),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
