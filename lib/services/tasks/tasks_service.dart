import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studize/constants/shared_prefs.dart';
import 'package:studize/services/tasks/tasks_classes.dart';
import 'package:studize/services/tasks/tasks_exceptions.dart';

class TasksService {
  // TODO: implement caching
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  /// returns a list of all subject objects currently stored
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

  /// Creates new task for the subject specified using [subjectName].
  /// Returns taskId of the created task
  static Future<int> createTask({
    required String subjectName,
    required String title,
    required String description,
    required DateTime timeStart,
    required DateTime timeEnd,
    required Color color,
  }) async {
    // inside this function, subject is accessed as `subjectList[subjectIndex]`
    final subjectList = await getSubjectList();
    final subjectIndex = await getSubjectIndex(name: subjectName);
    final Task task = Task(
      id: subjectList[subjectIndex].nextTaskId++,
      title: title,
      description: description,
      timeStart: timeStart,
      timeEnd: timeEnd,
      color: color,
      subjectName: subjectName,
    );
    subjectList[subjectIndex].taskList.add(task);
    subjectList[subjectIndex].numTasksLeft++;
    await _setSubjectList(subjectList: subjectList);
    return task.id;
  }

  static Future<List<Task>> getAllTasks({required String subjectName}) async {
    final subjectIndex = await getSubjectIndex(name: subjectName);
    final Subject subject = (await getSubjectList())[subjectIndex];
    return subject.taskList;
  }

  /// Returns task object that corresponds to the specified [taskId] inside the
  /// specified [subjectName].
  ///
  /// Throws exception `TaskNotFoundException` if specified `taskId` is not found
  /// and `SubjectNotFoundException` if specified `subjectName` is not found.
  static Future<Task> getTask(
      {required String subjectName, required int taskId}) async {
    // inside this function, subject is accessed as `subjectList[subjectIndex]`
    final subjectList = await getSubjectList();
    final subjectIndex = await getSubjectIndex(name: subjectName);
    for (int i = 0; i < subjectList[subjectIndex].taskList.length; i++) {
      if (subjectList[subjectIndex].taskList[i].id == taskId) {
        return subjectList[subjectIndex].taskList[i];
      }
    }

    // If the loop completes without finding the specified id, then throw
    // exception
    throw TaskNotFoundException();
  }

  /// Updates the task specified by [taskId] for subject specified by
  /// [subjectName]. `null` fields are left unchanged.
  ///
  /// Returns the updated task object
  ///
  /// Throws exception `TaskNotFoundException` if specified `taskId` is not found
  /// and `SubjectNotFoundException` if specified `subjectName` is not found.
  static Future<Task> updateTask({
    required String subjectName,
    required int taskId,
    String? newTitle,
    String? newDescription,
    DateTime? newTimeStart,
    DateTime? newTimeEnd,
    Color? newColor,
    bool? newIsCompleted,
  }) async {
    // inside this function, subject is accessed as `subjectList[subjectIndex]`
    final subjectList = await getSubjectList();
    final subjectIndex = await getSubjectIndex(name: subjectName);

    // loop to look for matching taskId
    final int taskListLength = subjectList[subjectIndex].taskList.length;
    for (int i = 0; i < taskListLength; i++) {
      if (subjectList[subjectIndex].taskList[i].id == taskId) {
        if (newTitle != null) {
          subjectList[subjectIndex].taskList[i].title = newTitle;
        }
        if (newDescription != null) {
          subjectList[subjectIndex].taskList[i].description = newDescription;
        }
        if (newTimeStart != null) {
          subjectList[subjectIndex].taskList[i].timeStart = newTimeStart;
        }
        if (newTimeEnd != null) {
          subjectList[subjectIndex].taskList[i].timeEnd = newTimeEnd;
        }
        if (newColor != null) {
          subjectList[subjectIndex].taskList[i].color = newColor;
        }
        if (newIsCompleted != null) {
          // If a task was not completed before and is now going to be marked
          // as completed, reduce count of remaining tasks. Conversely, if task
          // was completed before but now is marked as not-completed, increase
          // count of remaining tasks by 1
          if (subjectList[subjectIndex].taskList[i].isCompleted) {
            if (!newIsCompleted) subjectList[subjectIndex].numTasksLeft--;
          } else {
            if (newIsCompleted) subjectList[subjectIndex].numTasksLeft++;
          }
          subjectList[subjectIndex].taskList[i].isCompleted = newIsCompleted;
        }
        // set updated subjectlist
        await _setSubjectList(subjectList: subjectList);
        return subjectList[subjectIndex].taskList[i];
      }
    }

    // If the loop completes without finding the specified id, then throw
    // exception
    throw TaskNotFoundException();
  }

  /// Deltes the task specified by [taskId] for subject specified by
  /// [subjectName].
  ///
  /// Throws exception `TaskNotFoundException` if specified `taskId` is not found
  /// and `SubjectNotFoundException` if specified `subjectName` is not found
  static Future<void> deleteTask(
      {required String subjectName, required int taskId}) async {
    final subjectList = await getSubjectList();
    final subjectIndex = await getSubjectIndex(name: subjectName);
    for (int i = 0; i < subjectList[subjectIndex].taskList.length; i++) {
      if (subjectList[subjectIndex].taskList[i].id == taskId) {
        // if the task to be removed was not completed, then decrement the
        // number of tasks left
        if (!subjectList[subjectIndex].taskList[i].isCompleted) {
          subjectList[subjectIndex].numTasksLeft--;
        }
        // remove the task from list
        subjectList[subjectIndex].taskList.removeAt(i);
        // set updated subjectlist
        await _setSubjectList(subjectList: subjectList);
        return;
      }
    }

    // If the loop completes without finding the specified id, then throw
    // exception
    throw TaskNotFoundException();
  }

  /// returns a list of all tasks for the given time period, that are inside
  /// any of the given subjects. if an null (! and not an empty list) is given
  /// then tasks from all subjects are returned
  static Future<List<Task>> getFilteredTasks({
    required DateTimeRange dateTimeRange,
    List<String>? allowedSubjecstNameList,
  }) async {
    final List<Subject> subjectList = await getSubjectList();
    List<Task> filteredTaskList = [];
    for (final Subject subject in subjectList) {
      if (allowedSubjecstNameList == null ||
          allowedSubjecstNameList
              .any((subjectName) => (subjectName == subject.name))) {
        for (final Task task in subject.taskList) {
          if (task.timeEnd.isAfter(dateTimeRange.start) ||
              task.timeStart.isBefore(dateTimeRange.end)) {
            filteredTaskList.add(task);
          }
        }
      }
    }
    return filteredTaskList;
  }
}
