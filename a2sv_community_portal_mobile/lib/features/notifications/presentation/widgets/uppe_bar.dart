import 'package:flutter/material.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 50,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 17),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_sharp),
                  onPressed: () {
                    // Add your menu button functionality here
                  },
                ),
              )),
          Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ))
        ],
      ),
    );
  }
}
