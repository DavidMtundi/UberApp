import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomContainerSmall extends StatelessWidget {
  final String title;
  final String img;

  const CustomContainerSmall({Key? key, required this.title, required this.img})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        trailing: Icon(
          FontAwesomeIcons.arrowRight,
          size: 23,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 8),
          child: Image.asset(
            img,
            height: 24,
            width: 28,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
