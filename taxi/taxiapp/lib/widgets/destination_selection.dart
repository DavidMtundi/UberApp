import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxiapp/helpers/constants.dart';
import 'package:taxiapp/helpers/style.dart';
import 'package:google_place/google_place.dart' as gp;

import 'package:taxiapp/providers/app_state.dart';

class DestinationSelectionWidget extends StatefulWidget {
  const DestinationSelectionWidget({Key? key}) : super(key: key);

  @override
  State<DestinationSelectionWidget> createState() =>
      _DestinationSelectionWidgetState();
}

class _DestinationSelectionWidgetState
    extends State<DestinationSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    AppStateProvider appState = Provider.of<AppStateProvider>(context);

    //  print("in this widget we are");
    return DraggableScrollableSheet(
      initialChildSize: 0.28,
      minChildSize: 0.28,
      builder: (BuildContext context, myscrollController) {
        return Container(
          decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(.8),
                    offset: const Offset(3, 2),
                    blurRadius: 7)
              ]),
          child: ListView(
            controller: myscrollController,
            children: [
              const Icon(
                Icons.remove,
                size: 40,
                color: grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Container(
                  color: grey.withOpacity(.3),
                  child: TextField(
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      Prediction? p = await PlacesAutocomplete.show(
                          context: context,
                          apiKey: GOOGLE_MAPS_API_KEY,
                          radius: 10000000,
                          types: [],
                          strictbounds: false,
                          mode: Mode.overlay, // Mode.fullscreen
                          language: "ke",
                          components: [Component(Component.country, "ke")]);
                      if (p != null) {
                        print(
                            "the selected location is ${p.description.toString()}");
                        // try {
                        setState(() {
                          appState.destinationController.text =
                              p.description.toString();
                        });
                        var googlePlace = gp.GooglePlace(GOOGLE_MAPS_API_KEY);
                        gp.DetailsResponse? vresult =
                            await googlePlace.details.get(
                          p.placeId!,
                          language: 'ke',
                          region: 'ke',
                        );
                        print(p.placeId.toString());
                        print(vresult!.result!.geometry!.location!.lat);
                        // print(vresult!['lat']);
                        //double latitude = vresult![""];

                        PlacesDetailsResponse detail =
                            await places.getDetailsByPlaceId(p.placeId!,
                                language: 'ke', region: 'ke');
                        print("test two done");

                        double lat = detail.result.geometry!.location.lat;
                        double lng = detail.result.geometry!.location.lng;
                        appState.changeRequestedDestination(
                            reqDestination: p.description!, lat: lat, lng: lng);
                        appState.updateDestination(destination: p.description!);
                        LatLng coordinates = LatLng(lat, lng);
                        appState.setDestination(coordinates: coordinates);
                        appState.addPickupMarker(appState.center);
                        appState.changeWidgetShowed(
                            showWidget: Show.PICKUP_SELECTION);
                        // } catch (e) {
                        //   print(e.toString());
                        // }
                      } else {
                        print("P is null");
                      }

                      // appState.sendRequest(coordinates: coordinates);
                    },
                    textInputAction: TextInputAction.go,
                    controller: appState.destinationController,
                    cursorColor: Colors.blue.shade900,
                    decoration: InputDecoration(
                      icon: Container(
                        margin: const EdgeInsets.only(left: 20, bottom: 15),
                        width: 10,
                        height: 10,
                        child: const Icon(
                          Icons.location_on,
                          color: primary,
                        ),
                      ),
                      hintText: "Where to go?",
                      hintStyle: const TextStyle(
                          color: black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepOrange[300],
                  child: const Icon(
                    Icons.home,
                    color: white,
                  ),
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(color: Colors.black87),
                ),
                subtitle: const Text(
                  "25th avenue, 23 street",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepOrange[300],
                  child: const Icon(
                    Icons.work,
                    color: white,
                  ),
                ),
                title: const Text(
                  "Work",
                  style: TextStyle(color: Colors.black87),
                ),
                subtitle: const Text(
                  "25th avenue, 23 street",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.18),
                  child: const Icon(
                    Icons.history,
                    color: primary,
                  ),
                ),
                title: const Text(
                  "Recent location",
                  style: TextStyle(color: Colors.black87),
                ),
                subtitle: const Text(
                  "25th avenue, 23 street",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(.18),
                  child: const Icon(
                    Icons.history,
                    color: primary,
                  ),
                ),
                title: const Text(
                  "Recent location",
                  style: TextStyle(color: Colors.black87),
                ),
                subtitle: const Text(
                  "25th avenue, 23 street",
                  style: TextStyle(color: Colors.black26),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
