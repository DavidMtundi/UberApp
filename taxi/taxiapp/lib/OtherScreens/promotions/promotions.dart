import 'package:flutter/material.dart';
import 'package:taxiapp/OtherScreens/promotions/widgets/promotionscard.dart';

class Promotions extends StatelessWidget {
  const Promotions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30.0,
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 120.0,
                      margin: const EdgeInsets.only(right: 10.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 2.0),
                      decoration: BoxDecoration(
                          color: _theme.primaryColor,
                          borderRadius: BorderRadius.circular(18.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            width: 20.0,
                            height: 20.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.star_border,
                              size: 16.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "4,625",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          const Text(
                            " points",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "My Promotions",
                      style: _theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffF1F1F1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(""),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: const <Widget>[
                    PromotionCard(),
                    PromotionCard(),
                    PromotionCard(),
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
