import 'package:flutter/material.dart';

class ActionContainerExtraLarge extends StatelessWidget {
  final String title;
  final String img;

  const ActionContainerExtraLarge(
      {Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Ready to ride?",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Text("Tap to ride",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                    Icon(
                      Icons.forward,
                      size: 12,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30),),
              height: 149,
              width: 150,
              child: Image.asset(
                img,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
