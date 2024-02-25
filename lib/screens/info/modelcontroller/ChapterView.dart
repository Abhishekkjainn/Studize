import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studize/screens/info/SubtopicView.dart';
import 'package:studize/screens/info/modelcontroller/SyllabusModel.dart';
import 'package:studize/screens/info/modelcontroller/SyllabusServiceController.dart';
// import 'package:studize/services/syllabus/syllabus_service.dart';

class ChapterView extends StatefulWidget {
  final List<SyllabusModel> Subject;
  String SubjectName;
  ChapterView({Key? key, required this.Subject, required this.SubjectName})
      : super(key: key);

  @override
  State<ChapterView> createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  SyllabusService controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
        title: Text(
          widget.SubjectName,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: widget.Subject.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: ExpansionTileCard(
                        baseColor: const Color.fromARGB(255, 34, 34, 34),
                        borderRadius: BorderRadius.circular(40),
                        expandedColor: const Color.fromARGB(255, 34, 34, 34),
                        animateTrailing: true,
                        shadowColor: Colors.blue,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Lectures',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: CupertinoSwitch(
                                      value:
                                          widget.Subject[index].isLecturesDone,
                                      applyTheme: true,
                                      activeColor: Colors.blue,
                                      thumbColor: Colors.white,
                                      trackColor:
                                          Color.fromARGB(255, 54, 54, 54),
                                      onChanged: (value) {
                                        setState(() {
                                          widget.Subject[index].isLecturesDone =
                                              !widget.Subject[index]
                                                  .isLecturesDone;
                                          if (widget.Subject[index]
                                                  .isLecturesDone ==
                                              true) {
                                            if (widget.SubjectName ==
                                                'Mathematics') {
                                              controller.getMathCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Physics') {
                                              controller.getPhyCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Chemistry') {
                                              controller.getChemCount(index);
                                            }
                                          }
                                          if (widget.Subject[index]
                                                  .isLecturesDone ==
                                              false) {
                                            if (widget.SubjectName ==
                                                'Mathematics') {
                                              controller.removeMathCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Physics') {
                                              controller.removePhyCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Chemistry') {
                                              controller.removeChemCount(index);
                                            }
                                          }
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Notes',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: CupertinoSwitch(
                                      value: widget.Subject[index].isNotesDone,
                                      applyTheme: true,
                                      activeColor: Colors.blue,
                                      thumbColor: Colors.white,
                                      trackColor:
                                          Color.fromARGB(255, 54, 54, 54),
                                      onChanged: (value) {
                                        setState(() {
                                          widget.Subject[index].isNotesDone =
                                              !widget
                                                  .Subject[index].isNotesDone;
                                          if (widget
                                                  .Subject[index].isNotesDone ==
                                              true) {
                                            if (widget.SubjectName ==
                                                'Mathematics') {
                                              controller.getMathCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Physics') {
                                              controller.getPhyCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Chemistry') {
                                              controller.getChemCount(index);
                                            }
                                          }
                                          if (widget
                                                  .Subject[index].isNotesDone ==
                                              false) {
                                            if (widget.SubjectName ==
                                                'Mathematics') {
                                              controller.removeMathCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Physics') {
                                              controller.removePhyCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Chemistry') {
                                              controller.removeChemCount(index);
                                            }
                                          }
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Questions',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: CupertinoSwitch(
                                      value:
                                          widget.Subject[index].isQuestionsDone,
                                      applyTheme: true,
                                      activeColor: Colors.blue,
                                      thumbColor: Colors.white,
                                      trackColor:
                                          Color.fromARGB(255, 54, 54, 54),
                                      onChanged: (value) {
                                        setState(() {
                                          widget.Subject[index]
                                                  .isQuestionsDone =
                                              !widget.Subject[index]
                                                  .isQuestionsDone;
                                          if (widget.Subject[index]
                                                  .isQuestionsDone ==
                                              true) {
                                            if (widget.SubjectName ==
                                                'Mathematics') {
                                              controller.getMathCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Physics') {
                                              controller.getPhyCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Chemistry') {
                                              controller.getChemCount(index);
                                            }
                                          }
                                          if (widget.Subject[index]
                                                  .isQuestionsDone ==
                                              false) {
                                            if (widget.SubjectName ==
                                                'Mathematics') {
                                              controller.removeMathCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Physics') {
                                              controller.removePhyCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Chemistry') {
                                              controller.removeChemCount(index);
                                            }
                                          }
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Test',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: CupertinoSwitch(
                                      value: widget.Subject[index].isTested,
                                      applyTheme: true,
                                      activeColor: Colors.blue,
                                      thumbColor: Colors.white,
                                      trackColor:
                                          Color.fromARGB(255, 54, 54, 54),
                                      onChanged: (value) {
                                        setState(() {
                                          widget.Subject[index].isTested =
                                              !widget.Subject[index].isTested;
                                          if (widget.Subject[index].isTested ==
                                              true) {
                                            if (widget.SubjectName ==
                                                'Mathematics') {
                                              controller.getMathCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Physics') {
                                              controller.getPhyCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Chemistry') {
                                              controller.getChemCount(index);
                                            }
                                          }
                                          if (widget.Subject[index].isTested ==
                                              false) {
                                            if (widget.SubjectName ==
                                                'Mathematics') {
                                              controller.removeMathCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Physics') {
                                              controller.removePhyCount(index);
                                            }
                                            if (widget.SubjectName ==
                                                'Chemistry') {
                                              controller.removeChemCount(index);
                                            }
                                          }
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 10),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.only(left: 30),
                          //         child: Text(
                          //           'Revisions',
                          //           style: TextStyle(
                          //               color: Colors.blue,
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.w600),
                          //         ),
                          //       ),
                          //       Padding(
                          //           padding: const EdgeInsets.only(right: 30),
                          //           child: IconButton(
                          //               onPressed: () {},
                          //               icon: Icon(
                          //                 CupertinoIcons.add_circled_solid,
                          //                 color: Colors.white,
                          //                 size: 36,
                          //               )))
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 20, top: 10),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                    () => SubTopicView(
                                        SubTopics: widget.Subject[index]),
                                    transition: Transition.rightToLeft);
                              },
                              child: Container(
                                height: 60,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Check Subtopics',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                        leading: Text(
                          (index + 1).toString() + '.',
                          style: TextStyle(
                              color: (widget.Subject[index].isLecturesDone &&
                                      widget.Subject[index].isNotesDone &&
                                      widget.Subject[index].isQuestionsDone &&
                                      widget.Subject[index].isTested)
                                  ? Colors.greenAccent
                                  : Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            widget.Subject[index].ChapterName,
                            style: TextStyle(
                                decoration: (widget
                                            .Subject[index].isLecturesDone &&
                                        widget.Subject[index].isNotesDone &&
                                        widget.Subject[index].isQuestionsDone &&
                                        widget.Subject[index].isTested)
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationColor: Colors.greenAccent,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationThickness: 2,
                                color: (widget.Subject[index].isLecturesDone &&
                                        widget.Subject[index].isNotesDone &&
                                        widget.Subject[index].isQuestionsDone &&
                                        widget.Subject[index].isTested)
                                    ? Colors.greenAccent
                                    : Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
