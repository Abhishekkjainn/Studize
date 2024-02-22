import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120, right: 20, left: 20),
            child: Text(
              'Peer Mentorship',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Lottie.asset('assets/images/screen5a.json',
              width: 280, repeat: true, reverse: true),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 70),
            child: Text(
              'Collaborate by interacting with students who have been in your shoes.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
