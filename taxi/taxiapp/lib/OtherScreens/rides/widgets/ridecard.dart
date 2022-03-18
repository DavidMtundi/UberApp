import 'package:flutter/material.dart';

class RideCard extends StatelessWidget {
  const RideCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(
        top: 10.0,
      ),
      child: Card(
        elevation: 0.0,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Today, 10:30 AM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                height: 170.0,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Image.asset(
                  "assets/images/car.png",
                  fit: BoxFit.fitWidth,
                ),
                color: Colors.white12,
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 0.0,
                ),
                title: const Text(
                  "TOYOTA CAMRY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.pin_drop,
                      color: _theme.primaryColor,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text(
                      "Home - Awolowo Rd.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      "Price",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "\$45.00",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: _theme.primaryColor,
                        fontWeight: FontWeight.bold,
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
