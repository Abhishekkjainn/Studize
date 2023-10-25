import 'package:flutter/material.dart';
import 'package:studize/screens/aiMentor/services/assets_manager.dart';
import 'package:studize/styles.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AssetsManager.openaiLogo),
      ),
    );
  }
}
