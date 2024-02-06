import 'package:flutter/material.dart';
import 'package:studize/constants/globals.dart';

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
      scrolledUnderElevation: 0,
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
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.more_vert,
            // color: Colors.black,
            size: 30,
          ),
        )
      ],
    );
  }
}
