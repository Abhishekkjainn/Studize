// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SyllabusModel {
  String ChapterCode;
  String ChapterName;
  String SubjectTag;
  bool chapterStatus;
  int SubtopicCount;
  List Subtpics;
  List SubtopicsDone;
  bool isNotesDone;
  bool isQuestionsDone;
  bool isLecturesDone;
  bool isTested;
  int RevisionCount;
  SyllabusModel({
    required this.ChapterCode,
    required this.ChapterName,
    required this.SubjectTag,
    required this.chapterStatus,
    required this.SubtopicCount,
    required this.Subtpics,
    required this.SubtopicsDone,
    required this.isNotesDone,
    required this.isQuestionsDone,
    required this.isLecturesDone,
    required this.isTested,
    required this.RevisionCount,
  });
}

class RevisionData {
  String SubjectName;
  String ChapterName;
  String Subtopic;
  String Time;
  String Date;
  String Note;
  RevisionData({
    required this.SubjectName,
    required this.ChapterName,
    required this.Subtopic,
    required this.Time,
    required this.Date,
    required this.Note,
  });
}
