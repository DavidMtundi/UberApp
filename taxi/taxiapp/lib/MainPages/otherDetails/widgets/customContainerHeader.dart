import 'package:flutter/material.dart';

class CustomContainerHeader extends StatelessWidget {
  final String title;
  final String img;
  final String email;
  final String phone;

  const CustomContainerHeader(
      {Key? key,
      required this.title,
      required this.img,
      required this.email,
      required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        //width: MediaQuery.of(context).size.width * 0.9,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(email,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(phone,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              CircleAvatar(
                child: Image.asset(
                  img,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
