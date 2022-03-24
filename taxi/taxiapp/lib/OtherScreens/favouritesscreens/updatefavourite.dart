import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/OtherScreens/otherconstants/constants.dart';
import 'package:taxiapp/OtherScreens/otherwidgets/customtextformfield.dart';
import 'package:taxiapp/helpers/constants.dart';
import 'package:taxiapp/providers/user.dart';
import "package:google_maps_webservice/geocoding.dart";

class UpdateFavorite extends StatefulWidget {
  @override
  State<UpdateFavorite> createState() => _UpdateFavoriteState();
}

class _UpdateFavoriteState extends State<UpdateFavorite> {
  bool homeselected = false, workselected = false, otherselected = false;

  Future HandleSelection(int number) async {
    print("performed the operation");
    switch (number) {
      case 0:
        if (homeselected == false) {
          setState(() {
            homeselected = true;
            workselected = false;
            print(homeselected.toString());
            otherselected = false;
          });
        } else {
          setState(() {
            homeselected = true;
          });
        }
        break;
      case 1:
        if (workselected == false) {
          setState(() {
            homeselected = false;
            workselected = true;
            otherselected = false;
          });
        } else {
          setState(() {
            workselected = false;
          });
        }
        break;
      case 2:
        if (otherselected == false) {
          setState(() {
            homeselected = false;
            workselected = false;
            otherselected = true;
          });
        } else {
          setState(() {
            otherselected = false;
          });
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider authProvider = Provider.of<UserProvider>(context);

    final ThemeData _theme = Theme.of(context);
    late LocationResult allresults;
    late GeocodingResponse responseprovided;

    void showPlacePicker() async {
      LocationResult result = await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => PlacePicker(GOOGLE_MAPS_API_KEY)));
      setState(() {
        allresults = result;
      });
      print("here is the location got from the map");
      print(allresults.placeId.toString());
      final geocoding = await GoogleMapsGeocoding(apiKey: GOOGLE_MAPS_API_KEY);
      final response = await geocoding.searchByPlaceId(allresults.placeId!);
      setState(() {
        responseprovided = response;
        authProvider.placeaddress.text = response.results[0].formattedAddress!;
      });
      final values = response.results[0].formattedAddress;
      // Handle the result in your way
      print(values.toString());
    }

    final GlobalKey<FormState> key = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Update Profile",
          style: TextStyle(color: dbasicDarkColor),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: homeselected
                        ? _theme.primaryColor
                        : Color.fromARGB(200, 223, 162, 162),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: FlatButton.icon(
                    onPressed: () async {
                      await HandleSelection(0);
                    },
                    icon: const Icon(Icons.home),
                    label: const Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: workselected
                        ? _theme.primaryColor
                        : Color.fromARGB(200, 223, 162, 162),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: FlatButton.icon(
                    onPressed: () async {
                      await HandleSelection(1);
                    },
                    icon: const Icon(Icons.work),
                    label: const Text(
                      "Work",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: otherselected
                        ? _theme.primaryColor
                        : Color.fromARGB(200, 223, 162, 162),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: FlatButton.icon(
                    onPressed: () async {
                      await HandleSelection(2);
                    },
                    icon: const Icon(Icons.pin_drop),
                    label: const Text(
                      "Other",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 70.0,
            ),
            Form(
                key: key,
                child: Column(
                  children: [
                    CustomTextFormField(
                      givencontroller: authProvider.placename,
                      hintText: "Place name",
                      // value: "McDonald's",
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    CustomTextFormField(
                      givencontroller: authProvider.placeaddress,
                      hintText: "Place address",
                      //value: "13424 NE 20th St. Bellevue, WA, 98005",
                    ),
                  ],
                )),
            const SizedBox(
              height: 25.0,
            ),
            FlatButton.icon(
              onPressed: () async {
                showPlacePicker();
              },
              icon: const Icon(
                Icons.map,
                color: Colors.white,
              ),
              label: const Text(
                "PICK ON MAP",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: _theme.primaryColor,
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Container(
              color: Colors.yellow,
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    //save the location to the database
                    if (homeselected == false &&
                        workselected == false &&
                        otherselected == false) {
                      Fluttertoast.showToast(
                          msg:
                              "Your required to Select The Type i.e Work, Home and Other");
                    } else {
                      //save the data to the database
                    }
                  }
                },
                child: const Text(
                  "SAVE LOCATION",
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
    );
  }
}
