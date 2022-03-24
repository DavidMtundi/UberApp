import 'package:flutter/material.dart';

class CustomLoadingContainer extends StatelessWidget {
  const CustomLoadingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white54,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text("Please Wait ..."),
          CircularProgressIndicator(
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
