import 'package:flutter/material.dart';
import 'package:studize/constants/globals.dart';
import 'package:studize/main.dart';
import 'package:studize/screens/authorisation/sign_in.dart';

class MainAppBar extends AppBar {
  final String? titleText;
  final String iconAssetPath;
  MainAppBar({
    super.key,
    this.titleText,
    this.iconAssetPath = 'assets/icon/icon.png',
  });

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(widget.iconAssetPath),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            widget.titleText ?? 'Hi, $username',
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StartingPage()));
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
              isLogin = false;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
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
