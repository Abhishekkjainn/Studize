import 'package:flutter/material.dart';
import 'package:studize/constants/icons.dart';
import 'package:studize/services/tasks/tasks_service.dart';

Future<void> initializeSujbects({required String targetCourse}) async {
  print('DELETING ALL SUBJECTS!!');
  await deleteAllSubjects();

  switch (targetCourse) {
    case 'JEE':
      print('Initialising Subjects for JEE');

      final subjectNameList = await TasksService.getSubjectNameList();
      final List<String> requiredSubjectNameList = [
        'Physics',
        'Chemistry',
        'Mathematics',
      ];
      final List<Color> requiredSubjectColorList = [
        Colors.red,
        Colors.yellow,
        Colors.blue,
      ];
      print('initialised subjectNameList: $subjectNameList');
      for (int i = 0; i < requiredSubjectNameList.length; i++) {
        final String name = requiredSubjectNameList[i];
        if (!subjectNameList.contains(name)) {
          await TasksService.createSubject(
            name: name,
            color: requiredSubjectColorList[i],
            iconAssetPath: defaultSubjectIconPath,
          );
        }
      }

      await addTaskstoSubject('Physics');
      await addTaskstoSubject('Chemistry');
      await addTaskstoSubject('Mathematics');
      break;
    default:
  }
}

Future<void> deleteAllSubjects() async {
  final subjectNameList = await TasksService.getSubjectNameList();
  for (final name in subjectNameList) {
    await TasksService.deleteSubject(name: name);
  }
}

Future<void> addTaskstoSubject(String subjectName) async {
  print('Adding task to $subjectName');
  await TasksService.createTask(
    subjectName: subjectName,
    title: 'Chapter One',
    description: 'A longer description of this task',
    timeStart: DateTime.now().add(const Duration(hours: 1)),
    timeEnd: DateTime.now().add(const Duration(hours: 2)),
    color: Colors.purple,
  );
  await TasksService.createTask(
    subjectName: subjectName,
    title: 'Chapter One point two',
    description: 'A longer description of this task',
    timeStart: DateTime.now().add(const Duration(hours: -4)),
    timeEnd: DateTime.now().add(const Duration(hours: -3)),
    color: Colors.purple,
  );
  await TasksService.createTask(
    subjectName: subjectName,
    title: 'Chapter Two',
    description: 'A longer description of this task',
    timeStart: DateTime.now().add(const Duration(hours: 3)),
    timeEnd: DateTime.now().add(const Duration(hours: 4)),
    color: Colors.orange,
  );
  await TasksService.createTask(
    subjectName: subjectName,
    title: 'Chapter Three',
    description: 'A longer description of this task',
    timeStart: DateTime.now().add(const Duration(hours: 5, days: 2)),
    timeEnd: DateTime.now().add(const Duration(hours: 6, days: 2)),
    color: Colors.blue,
  );
}
