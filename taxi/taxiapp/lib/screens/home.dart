import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/loginpage.dart';
import 'package:taxiapp/helpers/constants.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/helpers/style.dart';
import 'package:taxiapp/providers/app_state.dart';
import "package:google_maps_webservice/places.dart";
import 'package:taxiapp/providers/user.dart';
import 'package:google_place/google_place.dart';

import 'package:taxiapp/widgets/custom_text.dart';
import 'package:taxiapp/widgets/destination_selection.dart';
import 'package:taxiapp/widgets/driver_found.dart';
import 'package:taxiapp/widgets/loading.dart';
import 'package:taxiapp/widgets/payment_method_selection.dart';
import 'package:taxiapp/widgets/pickup_selection_widget.dart';
import 'package:taxiapp/widgets/trip_draggable.dart';

import '../OtherScreens/DrawerScreens/customAppDrawer.dart';
import '../helpers/style.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    _deviceToken();
    initialization();
  }

  _deviceToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    UserProvider _user = Provider.of<UserProvider>(context, listen: false);

    if (_user.userModel.token != preferences.getString('token')) {
      Provider.of<UserProvider>(context, listen: false).saveDeviceToken();
    }
  }

  @override
  Widget build(BuildContext context) {
    AppStateProvider appState = Provider.of<AppStateProvider>(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        drawer: AppDrawer(),
        body: Stack(
          children: [
            MapScreen(scaffoldState),
            Visibility(
              visible: appState.show == Show.DRIVER_FOUND,
              child: Positioned(
                  top: 60,
                  left: 15,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: appState.driverArrived
                              ? Container(
                                  color: green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: CustomText(
                                      text:
                                          "Meet driver at the pick up location",
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Container(
                                  color: primary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: CustomText(
                                      text:
                                          "Meet driver at the pick up location",
                                      weight: FontWeight.w300,
                                      color: white,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  )),
            ),
            Visibility(
              visible: appState.show == Show.TRIP,
              child: Positioned(
                  top: 60,
                  left: MediaQuery.of(context).size.width / 7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: primary,
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                    text:
                                        "You\'ll reach your destination in \n",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300)),
                                // appState.routeModel!=null?  TextSpan(
                                //       text: appState.routeModel.timeNeeded.text,
                                //       style: const TextStyle(fontSize: 22)): TextSpan(
                                //           text: "unspecified",
                                //           style: const TextStyle(fontSize: 22)),
                              ]))),
                        ),
                      ],
                    ),
                  )),
            ),
            // ANCHOR Draggable
            Visibility(
                visible: appState.show == Show.DESTINATION_SELECTION,
                child: const DestinationSelectionWidget()),
            // ANCHOR PICK UP WIDGET
            Visibility(
              visible: appState.show == Show.PICKUP_SELECTION,
              child: PickupSelectionWidget(
                scaffoldState: scaffoldState,
              ),
            ),
            //  ANCHOR Draggable PAYMENT METHOD
            Visibility(
                visible: appState.show == Show.PAYMENT_METHOD_SELECTION,
                child: PaymentMethodSelectionWidget(
                  scaffoldState: scaffoldState,
                )),
            //  ANCHOR Draggable DRIVER
            Visibility(
                visible: appState.show == Show.DRIVER_FOUND,
                child: DriverFoundWidget()),

            //  ANCHOR Draggable DRIVER
            Visibility(
                visible: appState.show == Show.TRIP, child: TripWidget()),
          ],
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;

  MapScreen(this.scaffoldState);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapsPlaces googlePlaces;
  TextEditingController destinationController = TextEditingController();
  Color darkBlue = Colors.black;
  Color grey = Colors.grey;
  //GlobalKey<ScaffoldState> scaffoldSate = GlobalKey<ScaffoldState>();
//  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    super.initState();
    // scaffoldSate = widget.scaffoldState;
  }

  @override
  Widget build(BuildContext context) {
    AppStateProvider appState = Provider.of<AppStateProvider>(context);
    //appState.refreshData();

    UserProvider userProvider = Provider.of<UserProvider>(context);

    return SafeArea(
      child: Scaffold(
          body: appState.center == null
              ? Loading()
              : Stack(
                  children: <Widget>[
                    GoogleMap(
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
                    Positioned(
                        child: IconButton(
                            icon: Icon(
                              Icons.menu,
                              size: 40,
                            ),
                            onPressed: () {
                              widget.scaffoldState.currentState!.openDrawer();
                            }))
                  ],
                )),
    );
  }

  Future<Null> displayPrediction(Prediction p) async {
    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    var placeId = p.placeId;
    double lat = detail.result.geometry!.location.lat;
    double lng = detail.result.geometry!.location.lng;

    // var address = await Geocoder.local.findAddressesFromQuery(p.description);

    print(lat);
    print(lng);
  }
}
