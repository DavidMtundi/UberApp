import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 35.0, horizontal: 25.0),
            child: CircleAvatar(
              backgroundColor: const Color.fromRGBO(238, 75, 69, 0.18),
              radius: 30.0,
              child: Icon(
                Icons.card_giftcard,
                color: _theme.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 130.0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: Colors.grey[100]!,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    "10% Off your next ride within Nakuru",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Expanded(
                    child: Text(
                      "Valid up-to 12/12/2021",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Use now",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: _theme.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
