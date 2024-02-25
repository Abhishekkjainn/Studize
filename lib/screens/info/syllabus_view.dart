// import 'package:flutter/material.dart';
// import 'package:studize/screens/info/main_info_view.dart';
// import 'package:studize/screens/info/modelcontroller/SyllabusServiceController.dart';
// import 'package:studize/services/syllabus/syllabus_service.dart';

// class SyllabusView extends StatelessWidget {
//   final String subject;

//   const SyllabusView({super.key, required this.subject});

//   @override
//   Widget build(BuildContext context) {
//     final syllabus = SyllabusService.getSyllabus();
//     final List chapters = syllabusGetListOfChapters(subject: subject);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(subject),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: chapters.length,
//           itemBuilder: (context, index) => Padding(
//             padding: const EdgeInsets.all(4),
//             child: ChapterCard(
//               chapterName: chapters[index],
//               topicsList: syllabus[subject]![chapters[index]]!,
//               subjectName: subject,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChapterCard extends StatefulWidget {
//   final String subjectName;
//   final String chapterName;
//   final List<SyllabusTopic> topicsList;
//   const ChapterCard({
//     super.key,
//     required this.subjectName,
//     required this.chapterName,
//     required this.topicsList,
//   });

//   @override
//   State<ChapterCard> createState() => _ChapterCardState();
// }

// class _ChapterCardState extends State<ChapterCard> {
//   late bool isTestDone;
//   late bool isRevisionDone;

//   @override
//   void initState() {
//     isTestDone = SyllabusService.getIfAllDoneForAllTopics(
//       subjectName: widget.subjectName,
//       unitName: widget.chapterName,
//       category: SyllabusTopicTaskCategory.test,
//     );
//     isRevisionDone = SyllabusService.getIfAllDoneForAllTopics(
//       subjectName: widget.subjectName,
//       unitName: widget.chapterName,
//       category: SyllabusTopicTaskCategory.revision,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Theme(
//           data: Theme.of(context).copyWith(
//             dividerColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: ExpansionTile(
//             title: Text(widget.chapterName),
//             children: [
//               SyllabusTaskCategoryTile(
//                 title: 'Test',
//                 isDone: isTestDone,
//                 newValueCallback: (final bool value) {
//                   setState(() {
//                     isTestDone = value;
//                   });
//                   SyllabusService.setForAllTopics(
//                     subjectName: widget.subjectName,
//                     unitName: widget.chapterName,
//                     category: SyllabusTopicTaskCategory.test,
//                     value: value,
//                   );
//                 },
//               ),
//               SyllabusTaskCategoryTile(
//                 title: 'Revision',
//                 isDone: isRevisionDone,
//                 newValueCallback: (final bool value) {
//                   setState(() {
//                     isRevisionDone = value;
//                   });
//                   SyllabusService.setForAllTopics(
//                     subjectName: widget.subjectName,
//                     unitName: widget.chapterName,
//                     category: SyllabusTopicTaskCategory.revision,
//                     value: value,
//                   );
//                 },
//               ),
//               for (final section in widget.topicsList)
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SyllabusTopicCard(topic: section),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SyllabusTopicCard extends StatefulWidget {
//   final SyllabusTopic initTopic;
//   const SyllabusTopicCard({super.key, required SyllabusTopic topic})
//       : initTopic = topic;

//   @override
//   State<SyllabusTopicCard> createState() => _SyllabusTopicCardState();
// }

// class _SyllabusTopicCardState extends State<SyllabusTopicCard> {
//   late SyllabusTopic topic;

//   @override
//   void initState() {
//     // we are creating a deep copy. we cannot use a reference here because if
//     // we update local values to manipulate state, it will also change values
//     // in the original internal database which must not be done without
//     // doing it through the helper functions
//     topic = SyllabusTopic.from(widget.initTopic);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       child: ExpansionTile(
//         title: Text(topic.name),
//         children: [
//           SyllabusTaskCategoryTile(
//             title: 'Concepts',
//             isDone: topic.conceptsDone,
//             newValueCallback: (final bool value) {
//               setState(() {
//                 // final updatedTopic = SyllabusTopic.from(topic);
//                 // updatedTopic.conceptsDone = value;
//                 // print('Concepts $topic');
//                 topic.conceptsDone = value;
//                 // print('Concepts $topic');
//                 SyllabusService.setSyllabusTopic(topic);
//                 // print('Concepts $topic');
//               });
//             },
//           ),
//           SyllabusTaskCategoryTile(
//             title: 'Notes',
//             isDone: topic.notesDone,
//             newValueCallback: (final bool value) {
//               setState(() {
//                 topic.notesDone = value;
//                 SyllabusService.setSyllabusTopic(topic);
//               });
//             },
//           ),
//           SyllabusTaskCategoryTile(
//             title: 'Solve Questions',
//             isDone: topic.solveQuestionsDone,
//             newValueCallback: (final bool value) {
//               setState(() {
//                 topic.solveQuestionsDone = value;
//                 SyllabusService.setSyllabusTopic(topic);
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// #### Example Usage:
// ///
// /// 1) For a single topic:
// /// ```dart
// /// SyllabusTaskCategoryTile(
// ///   title: 'Concepts',
// ///   isDone: topic.conceptsDone,
// ///   newValueCallback: (final bool value) {
// ///     setState(() {
// ///       topic.conceptsDone = value;
// ///     });
// ///     SyllabusService.setSyllabusTopic(topic);
// ///   },
// /// ),
// /// ```
// ///
// /// 2) For a whole chapter:
// /// ```dart
// /// SyllabusTaskCategoryTile(
// ///   title: 'Test',
// ///   isDone: isTestDone,
// ///   newValueCallback: (final bool value) {
// ///     setState(() {
// ///       isTestDone = value;
// ///     });
// ///     SyllabusService.setForAllTopics(
// ///       subjectName: widget.subjectName,
// ///       unitName: widget.chapterName,
// ///       category: SyllabusTopicTaskCategory.test,
// ///       value: value,
// ///     );
// ///   },
// /// )
// /// ```
// /// where inside `initState()`,
// /// ```dart
// /// isTestDone = SyllabusService.getIfAllDoneForAllTopics(
// ///   subjectName: widget.subjectName,
// ///   unitName: widget.chapterName,
// ///   category: SyllabusTopicTaskCategory.test,
// /// );
// /// ```
// class SyllabusTaskCategoryTile extends StatelessWidget {
//   final String title;
//   final bool isDone;
//   final Function(bool value) newValueCallback;
//   const SyllabusTaskCategoryTile({
//     super.key,
//     required this.title,
//     required this.isDone,
//     required this.newValueCallback,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title),
//           const Spacer(),
//           Switch(
//             value: isDone,
//             onChanged: (final bool value) => newValueCallback(value),
//           )
//         ],
//       ),
//     );
//   }
// }
