import 'package:flutter/material.dart';
import 'package:studize/constants/colors.dart';

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
    final commonIconAsset = 'assets/icon/physics.png';

    return [
      Task(
        title: 'Physics',
        iconAsset: commonIconAsset,
        bgColor: kYellowLight,
        btnColor: kYellow,
        left: 3,
        done: 1,
      ),
      Task(
        title: 'Chemistry',
        iconAsset: commonIconAsset,
        bgColor: kRedLight,
        btnColor: kRed,
        left: 0,
        done: 0,
      ),
      Task(
        title: 'Maths',
        iconAsset: commonIconAsset,
        bgColor: kBlueLight,
        btnColor: kBlue,
        left: 0,
        done: 0,
      ),
      Task(isLast: true),
    ];
  }
}
