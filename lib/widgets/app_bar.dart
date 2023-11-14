import 'package:flutter/material.dart';
import 'package:studize/constants/Globals.dart';

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
        children: [
          SizedBox(
            height: 45,
            width: 45,
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
