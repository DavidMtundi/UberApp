import 'package:flutter/material.dart';
import 'package:taxiapp/helpers/style.dart';
import 'package:taxiapp/providers/app_state.dart';
import 'package:taxiapp/widgets/loading.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reloadData();
  }

  Future reloadData() async {
    var stateprovider = AppStateProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        body: Expanded(
          child: Image.asset(
            "assets/icon/Hadriel.jpg",
            width: 200,
          ),
        ));
  }
}
