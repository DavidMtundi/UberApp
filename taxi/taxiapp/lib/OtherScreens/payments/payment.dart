import 'package:flutter/material.dart';
import 'package:taxiapp/OtherScreens/DrawerScreens/customAppDrawer.dart';
import 'package:taxiapp/OtherScreens/payments/DebitCard.dart';
import 'package:taxiapp/OtherScreens/payments/cardcontainer.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final List<DebitCard> _cards = [
      DebitCard(
        expiry: "09/25",
        lastDigits: "5697",
        logo: Image.asset(
          "assets/images/mastercard.png",
        ),
      ),
      DebitCard(
        expiry: "10/27",
        lastDigits: "3802",
        logo: Image.asset("assets/images/visa.png"),
      ),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Payment methods",
                style: _theme.textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Card(
                margin: const EdgeInsets.all(0.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  leading: Icon(
                    Icons.credit_card,
                    size: 50.0,
                    color: _theme.accentColor,
                  ),
                  title: const Text(
                    "Cash payment",
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    "Default method",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: true,
                      activeColor: _theme.primaryColor,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "Choose a different payment method from a list of already setup payment methods.",
                style: _theme.textTheme.titleSmall!.merge(
                  const TextStyle(fontSize: 14.0),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: Column(
                  children: _cards.map(
                    (card) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: CardContainer(cardDetail: card),
                      );
                    },
                  ).toList(),
                ),
              ),
              Container(
                height: 45.0,
                child: FlatButton(
                  color: _theme.primaryColor,
                  onPressed: () {},
                  child: const Text(
                    "ADD PAYMENT METHOD",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
