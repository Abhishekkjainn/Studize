import 'package:flutter/material.dart';
import 'package:studize/constants/colors.dart';
import 'package:studize/constants/icons.dart';

class Task {
  final int id;
  String title;
  String description;
  DateTime timeStart;
  DateTime timeEnd;
  Color color;
  bool isCompleted;
  String subjectName; // unique identifier for the parent subject

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.timeStart,
    required this.timeEnd,
    required this.color,
    required this.subjectName,
  }) : isCompleted = false;

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        description = json['description'] as String,
        timeStart =
            DateTime.fromMillisecondsSinceEpoch(json['timeStart'] as int),
        timeEnd = DateTime.fromMillisecondsSinceEpoch(json['timeEnd'] as int),
        color = Color(json['color_value'] as int),
        isCompleted = (json['isCompleted_int'] as int) == 1,
        subjectName = json['subjectName'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'timeStart': timeStart.millisecondsSinceEpoch,
        'timeEnd': timeEnd.millisecondsSinceEpoch,
        'color_value': color.value,
        'isCompleted_int': (isCompleted ? 1 : 0),
        'subjectName': subjectName,
      };
}

class Subject {
  String name;
  String iconAssetPath;
  Color color;
  int numTasksLeft;
  int nextTaskId;
  List<Task> taskList;

  Subject({required this.name, String? iconAssetPath, Color? color})
      : iconAssetPath = iconAssetPath ?? defaultSubjectIconPath,
        color = color ?? defaultSubjectColor,
        numTasksLeft = 0,
        nextTaskId = 0,
        taskList = [];

  Subject.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        iconAssetPath = json['iconAssetPath'] as String,
        color = Color(json['color_val'] as int),
        numTasksLeft = json['numTasksLeft'] as int,
        nextTaskId = json['nextTaskId'] as int,
        taskList = List<Task>.from(
            json['taskList'].map((jsonObj) => Task.fromJson(jsonObj)));

  Map<String, dynamic> toJson() => {
        'name': name,
        'iconAssetPath': iconAssetPath,
        'color_val': color.value,
        'numTasksLeft': numTasksLeft,
        'nextTaskId': nextTaskId,
        'taskList': taskList,
      };
}
