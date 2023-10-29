import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studize/constants/Globals.dart';
import 'package:studize/main.dart';
import 'package:studize/screens/authorisation/sign_in.dart';

class MainAppBar extends AppBar {
  MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/icon/icon.png'),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Hi, $username',
            style: Theme.of(context).textTheme.titleLarge,
            // style: TextStyle(
            //   color: Colors.black,
            //   fontSize: 26,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
        ],
      ),
      // actions: const [
      //   Icon(
      //     Icons.more_vert,
      //     // color: Colors.black,
      //     size: 40,
      //   )
      // ],
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            if (value == 'Edit Profile') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StartingPage()));
              // Perform logout logic here
            }
          },
          icon: const Icon(
            Icons.edit,
            size: 40,
          ), // Three dots icon
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 'Edit Profile',
                child: Text('Edit Profile'),
              ),
              // You can add more items to the menu if needed
            ];
          },
        ),
        PopupMenuButton(
          onSelected: (value) {
            if (value == 'logout') {
              auth.signOut();
              isLogin=false;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()));
              // Perform logout logic here
            }
          },
          icon: const Icon(
            Icons.more_vert,
            size: 40,
          ), // Three dots icon
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
              // You can add more items to the menu if needed
            ];
          },
        ),
      ],
    );
  }
}
