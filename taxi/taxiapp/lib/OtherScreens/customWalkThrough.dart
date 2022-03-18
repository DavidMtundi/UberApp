import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/unauthpage.dart';
import 'package:taxiapp/OtherScreens/otherwidgets/walkthroughstepper.dart';
import 'package:taxiapp/OtherScreens/otherwidgets/walkthroughtemplate.dart';
import 'package:taxiapp/providers/user.dart';

class WalkThrough extends StatelessWidget {
  final PageController _pageViewController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final UserProvider _walkthroughProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                      title: "Pay with your mobile",
                      subtitle:
                          "I know this is crazy, buy i tried something fresh, I hope you love it.",
                      image: Image.asset("assets/images/walkthrough1.png"),
                    ),
                    WalkThroughTemplate(
                      title: "Get bonuses on each ride",
                      subtitle:
                          "I know this is crazy, buy i tried something fresh, I hope you love it.",
                      image: Image.asset("assets/images/walkthrough2.png"),
                    ),
                    WalkThroughTemplate(
                      title: "Invite friends and get paid.",
                      subtitle:
                          "I know this is crazy, buy i tried something fresh, I hope you love it.",
                      image: Image.asset("assets/images/walkthrough3.png"),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(24.0),
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
                          icon: Icon(
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
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          padding: EdgeInsets.all(13.0),
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
