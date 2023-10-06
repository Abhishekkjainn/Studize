import 'package:flutter/material.dart';
import 'package:studize/constants/colors.dart';
import 'package:studize/styles.dart';

class Task {
  String? iconAsset; // Asset path for the custom icon
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  bool isLast;

  Task({
    this.iconAsset,
    this.title,
    this.bgColor,
    this.iconColor,
    this.btnColor,
    this.left,
    this.done,
    this.isLast = false,
  });

  static List<Task> generateTasks() {
    const commonIconAsset = 'assets/icon/physics.png';
    const List<String> categories = ['Physics', 'Chemistry', 'Maths'];
    return List.generate(
      categories.length,
      (index) => Task(
        title: categories[index],
        iconAsset: commonIconAsset,
        bgColor: taskColorsBG[index],
        btnColor: taskColorsBtn[index],
        left: 3,
        done: 1,
      ),
    );

    // return [
    //   Task(
    //     title: 'Physics',
    //     iconAsset: commonIconAsset,
    //     bgColor: isDarkMode ? kYellowDark : kYellowLight,
    //     btnColor: kYellow,
    //     left: 3,
    //     done: 1,
    //   ),
    //   Task(
    //     title: 'Chemistry',
    //     iconAsset: commonIconAsset,
    //     bgColor: isDarkMode ? kRedDark : kRedLight,
    //     btnColor: kRed,
    //     left: 0,
    //     done: 0,
    //   ),
    //   Task(
    //     title: 'Maths',
    //     iconAsset: commonIconAsset,
    //     bgColor: isDarkMode ? kBlueDark : kBlueLight,
    //     btnColor: kBlue,
    //     left: 0,
    //     done: 0,
    //   ),
    //   Task(isLast: true),
    // ];
  }
}
