import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

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
              'JEE Specific AI Powered Chatbot',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Lottie.asset('assets/images/screen4.json',
              width: 180, repeat: false, reverse: true),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 70),
            child: Text(
              'AI JEE assistant for smart preparation and better advices.',
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
