import 'package:flutter/material.dart';
import 'package:taxiapp/OtherScreens/rides/ridescards.dart';
import 'package:taxiapp/OtherScreens/rides/widgets/ridecard.dart';

class MyRides extends StatelessWidget {
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
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "My rides",
              style: _theme.textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: _theme.primaryColor,
                      labelStyle: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      indicatorColor: _theme.primaryColor,
                      tabs: const <Widget>[
                        Tab(
                          text: "UPCOMING",
                        ),
                        Tab(
                          text: "COMPLETED",
                        ),
                        Tab(
                          text: "CANCELED",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: RideCards(),
                          ),
                          Container(
                            child: RideCard(),
                          ),
                          Container(
                            child: RideCard(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
