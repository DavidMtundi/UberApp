import 'package:flutter/material.dart';
import 'package:taxiapp/OtherScreens/rides/widgets/ridecard.dart';

class RideCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RideCard(),
        RideCard(),
        RideCard(),
      ],
    );
  }
}
