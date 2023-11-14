import 'package:flutter/material.dart';
import 'package:studize/constants/colors.dart';
import 'package:studize/constants/icons.dart';

class Task {
  // TODO: add unique int id, which is unique accross each subject.
  // Add functions getTask, editTask, deleteTask using which take subjectName
  // and this id as input
  String title;
  String description;
  DateTime timeStart;
  DateTime timeEnd;
  Color color;

  Task({
    required this.title,
    required this.description,
    required this.timeStart,
    required this.timeEnd,
    required this.color,
  });

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        description = json['description'] as String,
        timeStart =
            DateTime.fromMillisecondsSinceEpoch(json['timeStart'] as int),
        timeEnd = DateTime.fromMillisecondsSinceEpoch(json['timeEnd'] as int),
        color = Color(json['color_value'] as int);

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'timeStart': timeStart.millisecondsSinceEpoch,
        'timeEnd': timeEnd.millisecondsSinceEpoch,
        'color_value': color.value,
      };
}

class Subject {
  String name;
  String iconAssetPath;
  Color color;
  int numTasksLeft;
  List<Task> taskList;

  Subject({required this.name, String? iconAssetPath, Color? color})
      : iconAssetPath = iconAssetPath ?? defaultSubjectIconPath,
        color = color ?? defaultSubjectColor,
        numTasksLeft = 0,
        taskList = [];

  Subject.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        iconAssetPath = json['iconAssetPath'] as String,
        color = Color(json['color_val'] as int),
        numTasksLeft = json['numTasksLeft'] as int,
        taskList = List<Task>.from(
            json['taskList'].map((jsonObj) => Task.fromJson(jsonObj)));

  Map<String, dynamic> toJson() => {
        'name': name,
        'iconAssetPath': iconAssetPath,
        'color_val': color.value,
        'numTasksLeft': numTasksLeft,
        'taskList': taskList,
      };
}

//   static List<Subject> generateSubjects() {
//     const List<String> categories = ['Physics', 'Chemistry', 'Maths'];
//     return List.generate(
//       categories.length,
//       (index) => Subject(
//         name: categories[index],

//         color: taskColorsBG[index],
//         // numTasksLeft: 3,
//         // done: 1,
//         // desc: [
//         //   {
//         //     'time': '9:00 am',
//         //     'title': 'Chemical Bonding Note Making',
//         //     'slot': '9:00 - 11:00 am',
//         //     'tlColor': boldColors[0],
//         //     'bgColor': Colors.red,
//         //   },
//         //   {
//         //     'time': '11:00 am',
//         //     'title': '',
//         //     'slot': '',
//         //     'tl': Colors.grey.withOpacity(0.3),
//         //   },
//         //   {
//         //     'time': '12 pm',
//         //     'title': 'Complex Number Question Solving',
//         //     'slot': '12:00 - 2:00 pm',
//         //     'tlColor': kBlueDark,
//         //     'bgColor': kBlueLight,
//         //   },
//         //   {
//         //     'time': '2:00 pm',
//         //     'title': '',
//         //     'slot': '',
//         //     'tlColor': Colors.grey.withOpacity(0.3),
//         //   },
//         //   {
//         //     'time': '3:00 pm',
//         //     'title': 'Physics Class Revision',
//         //     'slot': '3:00 - 4:00 pm',
//         //     'tlColor': kYellowDark,
//         //     'bgColor': kYellowLight,
//         //   },
//         //   {
//         //     'time': '4:00 pm',
//         //     'title': 'Allen Chemistry Class',
//         //     'slot': '4:00 - 6:00 pm',
//         //     'tlColor': kRedDark,
//         //     'bgColor': kRedLight,
//         //   },
//         //   {
//         //     'time': '6:00 pm',
//         //     'title': 'Allen Physics Class',
//         //     'slot': '6:00 - 8:00 apm',
//         //     'tlColor': kRedDark,
//         //     'bgColor': kRedLight,
//         //   },
//         // ],
//       ),
//     );
//   }
// }
