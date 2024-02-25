// import 'package:flutter/material.dart';
// import 'package:studize/screens/info/syllabus_view.dart';
// import 'package:studize/services/syllabus/syllabus_service.dart';

// class MainInfoView extends StatelessWidget {
//   const MainInfoView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Center(
//       child: ListView(
//         children: [
//           const SizedBox(height: 50),
//           const Center(child: _TimeRemainingCard()),
//           const SizedBox(height: 50),
//           const Center(child: _SyllabusProgressIndicator()),
//           const SizedBox(height: 50),
//           Text(
//             'Syllabus',
//             style: theme.textTheme.headlineMedium,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 10),
//           const SyllabusSubjectsList(),
//           const SizedBox(height: 50),
//         ],
//       ),
//     );
//   }
// }

// class _SyllabusProgressIndicator extends StatelessWidget {
//   const _SyllabusProgressIndicator({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final int tasksDone = SyllabusService.totalTasksDone;
//     final int totalTasks = SyllabusService.totalTasks;
//     final double completedFractionOfSyllabus =
//         tasksDone.toDouble() / totalTasks;
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           Text(
//             'Completed Syllabus: ${(completedFractionOfSyllabus * 100).toStringAsFixed(1)}%\n($tasksDone/$totalTasks)',
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 100,
//             width: 100,
//             child: CircularProgressIndicator(
//               value: completedFractionOfSyllabus,
//               strokeWidth: 20,
//               color: Colors.green.withOpacity(0.7),
//               backgroundColor: Colors.green.withOpacity(0.1),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TimeRemainingCard extends StatelessWidget {
//   const _TimeRemainingCard();

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final textStyle = theme.textTheme.displayMedium;

//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: AnimatedSize(
//           duration: const Duration(milliseconds: 300),
//           child: Column(
//             children: [
//               const Text('Time befire JEE'),
//               Text(
//                 getRemainingDays(),
//                 style: textStyle,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// String getRemainingDays() {
//   var finalDay = DateTime(2024, 04, 01);
//   var remainingDays = finalDay.difference(DateTime.now()).inDays.toString();
//   return '$remainingDays days';
// }

// class SyllabusSubjectsList extends StatelessWidget {
//   const SyllabusSubjectsList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List subjects = syllabusGetListOfSubjects();
//     return Column(
//       children: [
//         for (final subject in subjects)
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => SyllabusView(
//                               subject: subject,
//                             )));
//               },
//               child: SizedBox(
//                 width: 200,
//                 child: ListTile(
//                   title: Text(
//                     subject,
//                     textAlign: TextAlign.center,
//                   ),
//                   titleAlignment: ListTileTitleAlignment.center,
//                 ),
//               ),
//             ),
//           )
//       ],
//     );
//   }
// }

// // TODO: move these functions to SyllabusService
// List syllabusGetListOfSubjects() {
//   var subjects = [];
//   final syllabus = SyllabusService.getSyllabus();
//   for (final subject in syllabus.keys) {
//     subjects.add(subject);
//   }
//   return subjects;
// }

// List syllabusGetListOfChapters({required String subject}) {
//   final syllabus = SyllabusService.getSyllabus();
//   if (!syllabus.containsKey(subject)) {
//     return [];
//   }
//   List<String> chapters = [];
//   for (final chapter in syllabus[subject]!.keys) {
//     chapters.add(chapter);
//   }
//   return chapters;
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:studize/screens/info/AddRevisionModal.dart';
import 'package:studize/screens/info/modelcontroller/ChapterView.dart';
import 'package:studize/screens/info/modelcontroller/SyllabusServiceController.dart';
import 'package:studize/screens/info/searchPage.dart';

class HomeSyllabus extends StatefulWidget {
  const HomeSyllabus({super.key});

  @override
  State<HomeSyllabus> createState() => _HomeSyllabusState();
}

class _HomeSyllabusState extends State<HomeSyllabus> {
  SyllabusService controller = Get.put(SyllabusService());
  @override
  void initState() {
    super.initState();
    controller.getSeperatedList();
    controller.getTotalCount();
    controller.getTotalSubjectsCount();
  }

  TextEditingController SubjectRevisionName = TextEditingController();
  TextEditingController ChapterRevisionName = TextEditingController();
  TextEditingController SubtopicsRevisionName = TextEditingController();
  TextEditingController NoteRevision = TextEditingController();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      appBar: AppBarSyllabus(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DaysLeftCard(),
                GetBuilder<SyllabusService>(
                  builder: (controller) {
                    return TotalProgressCard();
                  },
                )
              ],
            ),
            RevisionLogCard(context),
            SubjectHeading(),
            GetBuilder<SyllabusService>(
              builder: (controller) {
                return MathematicsCard();
              },
            ),
            GetBuilder<SyllabusService>(
              builder: (controller) {
                return PhysicsCard();
              },
            ),
            GetBuilder<SyllabusService>(
              builder: (controller) {
                return ChemistryCard();
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding RevisionLogCard(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 0, bottom: 20),
        child: GetBuilder<SyllabusService>(
          builder: (controller) {
            return Container(
              height: 160,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 23, 23, 23),
                        Color.fromARGB(255, 64, 64, 64)
                      ]),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 0, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Revision Log',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(() => RevisionLog(),
                                  transition: Transition.rightToLeft);
                            },
                            icon: Icon(
                              CupertinoIcons.time_solid,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Last Revised',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      (controller.RevisionList.isEmpty)
                          ? 'No Revision Added'
                          : controller.RevisionList[0].SubjectName +
                              ' - ' +
                              controller.RevisionList[0].ChapterName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: (controller.RevisionList.isEmpty)
                              ? Colors.redAccent
                              : Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      (controller.RevisionList.isEmpty)
                          ? ' '
                          : 'Subtopic - ${controller.RevisionList[0].Subtopic}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 40,
                    alignment: Alignment.centerRight,
                    // color: Colors.amber,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            enableDrag: true,
                            isDismissible: true,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            barrierColor: Colors.black.withOpacity(0.7),
                            backgroundColor:
                                const Color.fromARGB(255, 43, 43, 43),
                            showDragHandle: true,
                            elevation: 20,
                            context: context,
                            builder: (context) {
                              return BottomSheetRevision();
                            },
                          );
                        },
                        icon: Icon(
                          CupertinoIcons.add_circled_solid,
                          color: Colors.white,
                          size: 26,
                        )),
                  )
                ],
              ),
            );
          },
        ));
  }

  Container BottomSheetRevision() {
    return Container(
      height: 500,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Add Revision',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: SubjectRevisionName,
              autocorrect: true,
              autofocus: true,
              cursorColor: Colors.blue,
              cursorRadius: Radius.circular(40),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  labelText: 'Subject Name',
                  labelStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(
                    CupertinoIcons.book_circle_fill,
                    color: Colors.white,
                  ),
                  enabled: true,
                  focusColor: Colors.white,
                  hintText: 'Mathematics',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.white,
                      )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: ChapterRevisionName,
              autocorrect: true,
              autofocus: true,
              cursorColor: Colors.blue,
              cursorRadius: Radius.circular(40),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  labelText: 'Chapter Name',
                  labelStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(
                    CupertinoIcons.book_circle_fill,
                    color: Colors.white,
                  ),
                  enabled: true,
                  focusColor: Colors.white,
                  hintText: 'Integral Calculus',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.white,
                      )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: SubtopicsRevisionName,
              autocorrect: true,
              autofocus: true,
              cursorColor: Colors.blue,
              cursorRadius: Radius.circular(40),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  labelText: 'Subtopic Name',
                  labelStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(
                    CupertinoIcons.book_circle_fill,
                    color: Colors.white,
                  ),
                  enabled: true,
                  focusColor: Colors.white,
                  hintText: 'Sequence and Series',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.white,
                      )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: NoteRevision,
              autocorrect: true,
              autofocus: true,
              cursorColor: Colors.blue,
              cursorRadius: Radius.circular(40),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  labelText: 'Note',
                  labelStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(
                    CupertinoIcons.book_circle_fill,
                    color: Colors.white,
                  ),
                  enabled: true,
                  focusColor: Colors.white,
                  hintText: 'Studied Till Last Portion',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.white,
                      )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  controller.addRevision(
                      SubjectRevisionName.text,
                      ChapterRevisionName.text,
                      SubtopicsRevisionName.text,
                      now.hour.toString() + ':' + now.minute.toString(),
                      now.day.toString() +
                          '/' +
                          now.month.toString() +
                          '/' +
                          now.year.toString(),
                      NoteRevision.text);
                  SubjectRevisionName.text = '';
                  ChapterRevisionName.text = '';
                  SubtopicsRevisionName.text = '';
                  NoteRevision.text = '';
                  Navigator.pop(context);
                },
                child: Container(
                  width: 200,
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Add Revision Log',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding PhysicsCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Container(
        height: 160,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SubjectHeadingCardPhy(), ProgressBarandButtonPhy()],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/phybackground.jpg')),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Padding ChemistryCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 30),
      child: Container(
        height: 160,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SubjectHeadingCardChem(), ProgressBarandButtonChem()],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/chembackground.jpg')),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Padding MathematicsCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Container(
        height: 160,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SubjectHeadingCardMath(), ProgressBarandButtonMath()],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/mathbackground.jpg')),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Padding ProgressBarandButtonMath() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  alignment: Alignment.topLeft,
                  width: double.maxFinite,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black.withOpacity(0.3)),
                  child: FractionallySizedBox(
                    widthFactor:
                        (controller.TotalCompletedMath / controller.TotalMath),
                    heightFactor: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: (controller.TotalCompletedMath ==
                                    controller.TotalMath)
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      Get.to(
                          () => ChapterView(
                              Subject: controller.Mathematics,
                              SubjectName: 'Mathematics'),
                          transition: Transition.rightToLeft);
                    },
                    icon: const Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      color: Colors.white,
                      size: 40,
                    )),
              ))
        ],
      ),
    );
  }

  Padding ProgressBarandButtonChem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  alignment: Alignment.topLeft,
                  width: double.maxFinite,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black.withOpacity(0.3)),
                  child: FractionallySizedBox(
                    widthFactor:
                        (controller.TotalCompletedChem / controller.TotalChem),
                    heightFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      Get.to(
                          () => ChapterView(
                              Subject: controller.Chemistry,
                              SubjectName: 'Chemistry'),
                          transition: Transition.rightToLeft);
                    },
                    icon: const Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      color: Colors.white,
                      size: 40,
                    )),
              ))
        ],
      ),
    );
  }

  Padding ProgressBarandButtonPhy() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  alignment: Alignment.topLeft,
                  width: double.maxFinite,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black.withOpacity(0.3)),
                  child: FractionallySizedBox(
                    widthFactor:
                        (controller.TotalCompletedPhy / controller.TotalPhy),
                    heightFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      Get.to(
                          () => ChapterView(
                              Subject: controller.Physics,
                              SubjectName: 'Physics'),
                          transition: Transition.rightToLeft);
                    },
                    icon: const Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      color: Colors.white,
                      size: 40,
                    )),
              ))
        ],
      ),
    );
  }

  Padding SubjectHeadingCardMath() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Mathematics',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                      color: !(controller.TotalCompletedMath ==
                              controller.TotalMath)
                          ? Colors.white
                          : const Color.fromARGB(255, 101, 186, 255),
                      width: 2)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(
                  (controller.TotalCompletedMath == controller.TotalMath)
                      ? 'Done'
                      : 'Pending',
                  style: TextStyle(
                      color: !(controller.TotalCompletedMath ==
                              controller.TotalMath)
                          ? Colors.white
                          : const Color.fromARGB(255, 101, 186, 255),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding SubjectHeadingCardChem() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Chemistry',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                      color: !(controller.TotalCompletedChem ==
                              controller.TotalChem)
                          ? Colors.white
                          : const Color.fromARGB(255, 204, 254, 151),
                      width: 2)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(
                  (controller.TotalCompletedChem == controller.TotalChem)
                      ? 'Done'
                      : 'Pending',
                  style: TextStyle(
                      color: !(controller.TotalCompletedChem ==
                              controller.TotalChem)
                          ? Colors.white
                          : const Color.fromARGB(255, 204, 254, 151),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding SubjectHeadingCardPhy() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Physics',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                      color:
                          !(controller.TotalCompletedPhy == controller.TotalPhy)
                              ? Colors.white
                              : const Color.fromARGB(255, 255, 202, 149),
                      width: 2)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(
                  (controller.TotalCompletedPhy == controller.TotalPhy)
                      ? 'Done'
                      : 'Pending',
                  style: TextStyle(
                      color:
                          !(controller.TotalCompletedPhy == controller.TotalPhy)
                              ? Colors.white
                              : const Color.fromARGB(255, 255, 202, 149),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding SubjectHeading() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        'Subjects',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Flexible TotalProgressCard() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 20),
        child: Container(
          width: double.maxFinite,
          height: 150,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromARGB(255, 23, 23, 23),
                    Color.fromARGB(255, 64, 64, 64)
                  ]),
              borderRadius: BorderRadius.circular(20)),
          child: CircularPercentIndicator(
            radius: 40,
            lineWidth: 8.0,
            percent: controller.TotalCompletedFullSyllabus /
                controller.TotalCountofFullSyllabus,
            center: Text(
              ((controller.TotalCompletedFullSyllabus /
                              controller.TotalCountofFullSyllabus) *
                          100)
                      .toStringAsPrecision(3) +
                  ' %',
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // progressColor: Colors.blue,
            animateFromLastPercent: true,
            animation: true,
            animationDuration: 3,
            rotateLinearGradient: true,
            curve: Curves.decelerate,
            addAutomaticKeepAlive: true,
            maskFilter: const MaskFilter.blur(BlurStyle.solid, 0),

            footer: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Syllabus Completed',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            // arcBackgroundColor: Colors.black,
            backgroundColor: const Color.fromARGB(255, 56, 56, 56),
            circularStrokeCap: CircularStrokeCap.round,
            startAngle: 0,
            linearGradient: const LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.blue]),
          ),
        ),
      ),
    );
  }

  Flexible DaysLeftCard() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 10),
        child: Container(
          width: double.maxFinite,
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.blue.withOpacity(0.1),
                    Colors.blue.withOpacity(0.35)
                  ]),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller
                          .getRemainingDays(
                              controller.today, controller.JEEDate)
                          .toString(),
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Days',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Text(
                  'Left For Your Next Exam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 193, 214, 255),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar AppBarSyllabus() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      title: const Text(
        'Syllabus',
        style: TextStyle(
            color: const Color.fromARGB(255, 207, 207, 207),
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.deepPurpleAccent])),
            child: const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Text(
                'JEE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {
                Get.to(() => SearchPage(), transition: Transition.upToDown);
              },
              icon: Icon(
                CupertinoIcons.search_circle_fill,
                color: Colors.white,
                size: 34,
              )),
        )
      ],
    );
  }
}
