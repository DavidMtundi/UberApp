import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/MainPages/SearchScreen.dart';
import 'package:taxiapp/MainPages/Widgets/ActionContainerExtraLarge.dart';
import 'package:taxiapp/MainPages/Widgets/ActionContainerLarge.dart';
import 'package:taxiapp/MainPages/otherDetails/otherDetails.dart';
import 'package:taxiapp/OtherScreens/profile.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/providers/app_state.dart';
import 'package:taxiapp/screens/home.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    AppStateProvider appState = Provider.of<AppStateProvider>(context);
    appState.refreshData();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Ride Share",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: IconButton(
                onPressed: () {
                  changeScreen(context, OtherProperties());
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[500],
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                changeScreen(
                    context,
                    MyHomePage(
                      title: '',
                    ));
              },
              child: ActionContainerExtraLarge(
                img: 'assets/images/rides.jpg',
                title: 'Ride',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      changeScreen(
                          context,
                          MyHomePage(
                            title: '',
                          ));
                    },
                    child: ActionContainerLarge(
                      img: 'assets/images/suv.png',
                      title: 'Ride',
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ActionContainerLarge(
                      img: 'assets/images/box.png', title: 'Package'),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                        fullscreenDialog: true),
                  );
                },
                autofocus: false,
                showCursor: false,
                decoration: InputDecoration(
                    hintText: 'Where To?',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 24),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Around You",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: appState.center, zoom: 15),
                  onMapCreated: appState.onCreate,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  compassEnabled: true,
                  rotateGesturesEnabled: true,
                  markers: appState.markers,
                  onCameraMove: appState.onCameraMove,
                  polylines: appState.poly,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
