import 'dart:convert';
import 'package:studize/services/syllabus/hardcoded_syllabus.dart';

typedef SyllabusMap = Map<String, Map<String, List<SyllabusTopic>>>;

class SyllabusServiceNotInitializedException implements Exception {}

/// thrown when the SyllabusService recieves a SyllabusTopic object with either
/// a chapterName, a unitName or a list index which is not present in the
/// internal syllabusMap
class SyllabusServiceInvalidTopicException implements Exception {}

class SyllabusServiceInvalidUnitException implements Exception {}

class SyllabusService {
  // TODO: store this to disk
  static SyllabusMap? _syllabusMap;
  static int? _totalSyllabusTasks;
  static int? _totalTasksDone;

  static void init() {
    final (syllabus, numOfTopics) = readStyllabusFromHardcoding();
    print('numOfTopics = $numOfTopics');
    _syllabusMap = syllabus;
    _totalSyllabusTasks = numOfTopics;
    print('totalTasks $totalTasks');
    _totalTasksDone = 0;
  }

  static int get totalTasks {
    if (_totalSyllabusTasks == null)
      throw SyllabusServiceNotInitializedException();
    return _totalSyllabusTasks!;
  }

  static int get totalTasksDone {
    if (_totalTasksDone == null) throw SyllabusServiceNotInitializedException();
    return _totalTasksDone!;
  }

  static (SyllabusMap, int) readStyllabusFromHardcoding() {
    final data = json.decode(hardcodedSyllabusJson);
    SyllabusMap syllabus = {};
    int numOfTopics = 0;
    for (final String subjectName in data.keys) {
      syllabus[subjectName] = {};
      for (final String unitName in data[subjectName].keys) {
        List<SyllabusTopic> topicsList = [];
        int index = 0;
        for (final String topicName in data[subjectName][unitName]) {
          topicsList.add(SyllabusTopic(
            name: topicName,
            index: index,
            subjectName: subjectName,
            unitName: unitName,
          ));
          index++;
          numOfTopics++;
        }
        syllabus[subjectName]![unitName] = topicsList;
      }
    }
    return (syllabus, numOfTopics);
  }

  /// returns a Map that contains the syllabus according to the following spec:
  ///
  /// ```
  /// Syllabus Map[subjectName] -> Map of A particular Subject
  /// Subject Map[unitName] -> List of topic names of a particular Unit
  /// ```
  /// A reference to the original internal map is passed! Do not make changes
  /// directly to this reference. Use helper functions provided by
  ///  SyllabusService
  static SyllabusMap getSyllabus() {
    if (_syllabusMap == null) throw SyllabusServiceNotInitializedException();
    return _syllabusMap!;
  }

  /// sets the internal syllabus map to store updated properties from the given
  /// SyllabusTopic object. If an invalid subjectName or unitName is found on
  /// the SyllabusTopic object, an `SyllabusServiceInvalidTopicException` is
  /// thrown
  static void setSyllabusTopic(SyllabusTopic topic) {
    SyllabusMap syllabusMap = getSyllabus();

    try {
      final oldTopic =
          syllabusMap[topic.subjectName]![topic.unitName]![topic.index];
      print(oldTopic);
      print(topic);

      // to count how many new tasks were done
      final int countNewTasksDone = (topic.conceptsDone ? 1 : 0) -
          (oldTopic.conceptsDone ? 1 : 0) +
          (topic.notesDone ? 1 : 0) -
          (oldTopic.notesDone ? 1 : 0) +
          (topic.solveQuestionsDone ? 1 : 0) -
          (oldTopic.solveQuestionsDone ? 1 : 0) +
          (topic.testDone ? 1 : 0) -
          (oldTopic.testDone ? 1 : 0) +
          (topic.revisionDone ? 1 : 0) -
          (oldTopic.revisionDone ? 1 : 0);
      _totalTasksDone = _totalTasksDone! + countNewTasksDone;
      print(
          'countNewTasksDone = $countNewTasksDone, _totalTasksDone = $_totalTasksDone, _totalTasks = $_totalSyllabusTasks');
      syllabusMap[topic.subjectName]![topic.unitName]![topic.index] =
          SyllabusTopic.from(topic);
    } on TypeError {
      // TypeError is thrown when we forcibly try to extract a key from a
      // map which does not contain the key. This implies here that one of
      // `topic.subjectName`, `topic.unitName` or `topic.index` is invalid
      throw SyllabusServiceInvalidTopicException();
    }
  }

  /// #### Example Usage:
  /// ```dart
  /// SyllabusService.setForAllTopics(
  ///   subjectName: widget.subjectName,
  ///   unitName: widget.chapterName,
  ///   category: SyllabusTopicTaskCategory.revision,
  ///   value: value,
  /// );
  /// ```
  static void setForAllTopics({
    required String subjectName,
    required String unitName,
    required SyllabusTopicTaskCategory category,
    required bool value,
  }) {
    final syllabus = getSyllabus();
    List<SyllabusTopic> topicList;
    try {
      topicList = syllabus[subjectName]![unitName]!;
    } on TypeError {
      throw SyllabusServiceInvalidUnitException();
    }
    for (final topicReference in topicList) {
      final topic = SyllabusTopic.from(topicReference);
      // bool oldValue;
      switch (category) {
        case SyllabusTopicTaskCategory.concepts:
          // oldValue = topic.conceptsDone;
          topic.conceptsDone = value;
          break;
        case SyllabusTopicTaskCategory.notes:
          // oldValue = topic.notesDone;
          topic.notesDone = value;
          break;
        case SyllabusTopicTaskCategory.solveQuestions:
          // oldValue = topic.solveQuestionsDone;
          topic.solveQuestionsDone = value;
          break;
        case SyllabusTopicTaskCategory.test:
          // oldValue = topic.testDone;
          topic.testDone = value;
          break;
        case SyllabusTopicTaskCategory.revision:
          // oldValue = topic.revisionDone;
          topic.revisionDone = value;
          break;
      }
      setSyllabusTopic(topic);
    }
  }

  /// #### Example Usage:
  /// ```dart
  /// isTestDone = SyllabusService.getIfAllDoneForAllTopics(
  ///   subjectName: widget.subjectName,
  ///   unitName: widget.chapterName,
  ///   category: SyllabusTopicTaskCategory.test,
  /// );
  /// ```
  static bool getIfAllDoneForAllTopics({
    required String subjectName,
    required String unitName,
    required SyllabusTopicTaskCategory category,
  }) {
    final syllabus = getSyllabus();
    List<SyllabusTopic> topicList;
    try {
      topicList = syllabus[subjectName]![unitName]!;
    } on TypeError {
      throw SyllabusServiceInvalidUnitException();
    }
    bool value;
    for (final topic in topicList) {
      switch (category) {
        case SyllabusTopicTaskCategory.concepts:
          value = topic.conceptsDone;
          break;
        case SyllabusTopicTaskCategory.notes:
          value = topic.notesDone;
          break;
        case SyllabusTopicTaskCategory.solveQuestions:
          value = topic.solveQuestionsDone;
          break;
        case SyllabusTopicTaskCategory.test:
          value = topic.testDone;
          break;
        case SyllabusTopicTaskCategory.revision:
          value = topic.revisionDone;
          break;
      }
      if (!value) return false;
    }
    return true;
  }
}

class SyllabusTopic {
  final String name;
  final String subjectName;
  final String unitName;
  final int index; // this is the index in the unit's topic list
  bool conceptsDone;
  bool notesDone;
  bool solveQuestionsDone;
  bool testDone;
  bool revisionDone;

  SyllabusTopic({
    required this.name,
    required this.subjectName,
    required this.unitName,
    required this.index,
  })  : conceptsDone = false,
        notesDone = false,
        solveQuestionsDone = false,
        testDone = false,
        revisionDone = false;

  SyllabusTopic.from(SyllabusTopic topic)
      : name = topic.name,
        subjectName = topic.subjectName,
        unitName = topic.unitName,
        index = topic.index,
        conceptsDone = topic.conceptsDone,
        notesDone = topic.notesDone,
        solveQuestionsDone = topic.solveQuestionsDone,
        testDone = topic.testDone,
        revisionDone = topic.revisionDone;

  @override
  String toString() {
    return 'SyllabusTopic(name=$name, subjectName=$subjectName, unitName=$unitName, index=$index, Tasks: concep $conceptsDone, notes $notesDone, solve $solveQuestionsDone, test $testDone, rev $revisionDone)';
  }
}

enum SyllabusTopicTaskCategory {
  concepts,
  notes,
  solveQuestions,
  test,
  revision,
}
