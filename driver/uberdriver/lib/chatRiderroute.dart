
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberdriver/otherconstants/constants.dart';
import 'package:uberdriver/otherwidgets/customtextformfield.dart';
import 'package:uberdriver/providers/user.dart';

class ChatRider extends StatelessWidget {
  const ChatRider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);

    final ThemeData _theme = Theme.of(context);
    BubbleStyle styleSomebody = const BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      padding: BubbleEdges.all(15.0),
      margin: BubbleEdges.only(top: 8.0, bottom: 12.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: _theme.primaryColor,
      padding: const BubbleEdges.all(15.0),
      margin: const BubbleEdges.only(top: 8.0, bottom: 12.0, left: 50.0),
      alignment: Alignment.topRight,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 100.0,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.only(right: 10.0),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                title: Container(
                  padding: const EdgeInsets.only(
                    bottom: 2.0,
                  ),
                  child: Text(
                    "Cristiano Ronaldo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: dbasicDarkColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                subtitle: const Text(
                  "CX219A34A - Toyoto Corolla",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                trailing: const CircleAvatar(
                  radius: 25.0,
                  // backgroundImage: NetworkImage(
                  //     "https://pbs.twimg.com/profile_images/1214214436283568128/KyumFmOO.jpg"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(
                  15.0,
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Today at 5:03 PM",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Bubble(
                      style: styleMe,
                      child: const Text(
                        "Hello, are you nearby?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Bubble(
                      style: styleSomebody,
                      child: const Text(
                        "I'll be there in a few minutes.",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Bubble(
                      style: styleMe,
                      child: const Text(
                        "Ok, I'm in front of the bus stop",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Bubble(
                      style: styleSomebody,
                      child: const Text(
                        "Sorry, I'm stuck in traffic. \n Please give me a moment",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 120.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CustomTextFormField(
                      givencontroller: authProvider.message,
                      hintText: "Enter a message...",
                      showLabel: false,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.send,
                    color: _theme.primaryColor,
                    size: 35.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
