import 'package:flutter/material.dart';
import 'package:studize/screens/aiMentor/screens/chat_screen.dart';
import 'package:studize/styles.dart';

void main() {
  runApp(const GptMain());
}

class GptMain extends StatelessWidget {
  const GptMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AI Mentor',
        debugShowCheckedModeBanner: false,
        theme: mainAppTheme,
        home: const ChatScreen());
  }
}
