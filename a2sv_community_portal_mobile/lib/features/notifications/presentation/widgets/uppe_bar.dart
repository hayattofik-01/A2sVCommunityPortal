import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({Key? key, this.title = "Notification"}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 50,
      child: Stack(
        children: [
          if (title != "Announcemet")
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 17),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_sharp),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
