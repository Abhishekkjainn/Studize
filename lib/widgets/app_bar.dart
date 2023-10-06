import 'package:flutter/material.dart';

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
            'Hi, Username',
            style: Theme.of(context).textTheme.titleLarge,
            // style: TextStyle(
            //   color: Colors.black,
            //   fontSize: 26,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
        ],
      ),
      actions: const [
        Icon(
          Icons.more_vert,
          // color: Colors.black,
          size: 40,
        )
      ],
    );
  }
}
