import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:uberdriver/otherauthscreens/unauthpage.dart';
import 'package:uberdriver/otherwidgets/walkthroughstepper.dart';
import 'package:uberdriver/otherwidgets/walkthroughtemplate.dart';
import 'package:uberdriver/providers/user.dart';

class WalkThrough extends StatefulWidget {
  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));

    FlutterNativeSplash.remove();
  }

  final PageController _pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final UserProvider _walkthroughProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white70,
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: _pageViewController,
                  onPageChanged: (int index) {
                    _walkthroughProvider.onPageChange(index);
                  },
                  children: <Widget>[
                    WalkThroughTemplate(
                      title: "Accept a Job",
                      subtitle:
                          "Work with your convenience. take the job whenever you need it.",
                      image: Image.asset(
                        "assets/icon/image1.jpeg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    WalkThroughTemplate(
                      title: "Tracking Realtime",
                      subtitle:
                          "Know exactly where your customer is located with the real time tracking",
                      image: Image.asset(
                        "assets/icon/image2.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    WalkThroughTemplate(
                      title: "Earn Money.",
                      subtitle:
                          "Take up a number of jobs and increase your earnings.",
                      image: Image.asset("assets/icon/image3.jpeg"),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:
                          WalkthroughStepper(controller: _pageViewController),
                    ),
                    ClipOval(
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: IconButton(
                          icon: const Icon(
                            Icons.trending_flat,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (_pageViewController.page! >= 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contxt) => UnAuth()));
                              return;
                            }
                            _pageViewController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          padding: const EdgeInsets.all(13.0),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
