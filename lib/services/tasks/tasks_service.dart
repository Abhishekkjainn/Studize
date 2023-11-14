import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studize/constants/shared_prefs.dart';
import 'package:studize/services/tasks/tasks_classes.dart';
import 'package:studize/services/tasks/tasks_exceptions.dart';

class TasksService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<List<Subject>> getSubjectList() async {
    final prefs = await _prefs;
    List<String> subjectJsonList =
        prefs.getStringList(sharedPrefKeySubjectJsonList) ?? [];

    List<Subject> subjectList = [];
    for (String subjectJson in subjectJsonList) {
      subjectList.add(Subject.fromJson(json.decode(subjectJson)));
    }
    return subjectList;
  }

  /// this returns a list containing only this (String) names of subjects and
  /// not the entire Subject objects. Use this when you need to, for example,
  /// check if a subject exists.
  ///
  /// Example:
  /// ```dart
  /// final subjectNameList = TasksService.getSubjectNameList();
  /// if (subjectNameList.contains('physics') {
  ///   // do something
  /// }
  /// ```
  static Future<List<String>> getSubjectNameList() async {
    final prefs = await _prefs;
    return prefs.getStringList(sharedPrefKeySubjectsNameList) ?? [];
  }

  /// Private Function. DO NOT CALL THIS from external functions directly or
  /// service will break
  /// Stores the list of subjects in shared preferences by encoding them as json
  static Future<void> _setSubjectList(
      {required List<Subject> subjectList}) async {
    final prefs = await _prefs;
    List<String> subjectJsonList = [];
    for (Subject subject in subjectList) {
      subjectJsonList.add(json.encode(subject));
    }
    await prefs.setStringList(sharedPrefKeySubjectJsonList, subjectJsonList);
  }

  /// Private Function. DO NOT CALL THIS from external functions directly or
  /// service will break
  /// Stores the list of subject's names in shared preferences
  static Future<void> _setSubjectNameList(
      {required List<String> subjectNameList}) async {
    final prefs = await _prefs;
    await prefs.setStringList(sharedPrefKeySubjectsNameList, subjectNameList);
  }

  static Future<Subject> createSubject(
      {required String name, String? iconAssetPath, Color? color}) async {
    List<String>? subjectNameList = await getSubjectNameList();
    if (subjectNameList.contains(name)) {
      throw SubjectAlreadyExistsException();
    }
    subjectNameList.add(name);
    await _setSubjectNameList(subjectNameList: subjectNameList);
    Subject newSubject =
        Subject(name: name, iconAssetPath: iconAssetPath, color: color);
    List<Subject> subjectList = await getSubjectList();
    subjectList.add(newSubject);
    await _setSubjectList(subjectList: subjectList);
    return newSubject;
  }

  static Future<Subject> getSubject({required String name}) async {
    final List<Subject> subjectList = await getSubjectList();
    for (final Subject subject in subjectList) {
      if (subject.name == name) return subject;
    }
    throw SubjectNotFoundException();
  }

  static Future<Subject> updateSubject({
    required String originalName,
    String? newName,
    String? newIconAssetPath,
    Color? newColor,
  }) async {
    List<String> subjectNameList = await getSubjectNameList();
    if (newName != null) {
      for (int i = 0; i < subjectNameList.length; i++) {
        if (subjectNameList[i] == originalName) {
          subjectNameList[i] = newName;
          await _setSubjectNameList(subjectNameList: subjectNameList);
          break;
        }
      }
    }

    List<Subject> subjectList = await getSubjectList();
    for (int i = 0; i < subjectList.length; i++) {
      if (subjectList[i].name == originalName) {
        if (newName != null) {
          subjectList[i].name = newName;
        }
        if (newIconAssetPath != null) {
          subjectList[i].iconAssetPath = newIconAssetPath;
        }
        if (newColor != null) {
          subjectList[i].color = newColor;
        }
        await _setSubjectList(subjectList: subjectList);
        return subjectList[i];
      }
    }
    throw SubjectNotFoundException();
  }

  static Future<void> deleteSubject({required String name}) async {
    final List<String> subjectNameList = await getSubjectNameList();
    final bool wasRemoved = subjectNameList.remove(name);
    if (!wasRemoved) {
      throw SubjectNotFoundException();
    }
    await _setSubjectNameList(subjectNameList: subjectNameList);

    final List<Subject> subjectList = await getSubjectList();
    for (int i = 0; i < subjectList.length; i++) {
      if (subjectList[i].name == name) {
        subjectList.removeAt(i);
        await _setSubjectList(subjectList: subjectList);
        return;
      }
    }
    throw SubjectNotFoundException();
  }

  static Future<int> getSubjectIndex({required String name}) async {
    final List<String> subjectNameList = await getSubjectNameList();
    for (int i = 0; i < subjectNameList.length; i++) {
      if (subjectNameList[i] == name) return i;
    }
    throw SubjectNotFoundException();
  }

  static Future<void> createTask({
    required String subjectName,
    required String title,
    required String description,
    required DateTime timeStart,
    required DateTime timeEnd,
    required Color color,
  }) async {
    final Task task = Task(
      title: title,
      description: description,
      timeStart: timeStart,
      timeEnd: timeEnd,
      color: color,
    );
    final subjectList = await getSubjectList();
    final subjectIndex = await getSubjectIndex(name: subjectName);

    subjectList[subjectIndex].taskList.add(task);
    subjectList[subjectIndex].numTasksLeft++;
    await _setSubjectList(subjectList: subjectList);
  }

  static Future<List<Task>> getAllTasks({required String subjectName}) async {
    final subjectIndex = await getSubjectIndex(name: subjectName);
    final Subject subject = (await getSubjectList())[subjectIndex];
    return subject.taskList;
  }

  static Future<Task> getTask(
      {required String subjectName, required int taskIndex}) async {
    throw UnimplementedError();
  }

  static Future<Task> updateTask(
      {required String subjectName, required int taskIndex}) async {
    throw UnimplementedError();
  }

  static Future<void> deleteTask(
      {required String subjectName, required int taskIndex}) async {
    throw UnimplementedError();
  }
}
