import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studize/screens/info/modelcontroller/SyllabusServiceController.dart';

class RevisionLog extends StatelessWidget {
  RevisionLog({super.key});
  SyllabusService controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
        title: Text(
          'Revision Log',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              itemCount: controller.RevisionList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(controller.RevisionList[index].Time),
                  onDismissed: (direction) {
                    controller.removeRevision(index);
                  },
                  child: IntrinsicHeight(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 40, 40, 40)),
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 15),
                                  child: Text(
                                    (index + 1).toString() +
                                        '. ' +
                                        controller
                                            .RevisionList[index].SubjectName,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 15, top: 15),
                                  child: Text(
                                    'Time - ' +
                                        controller.RevisionList[index].Time,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 10, right: 15),
                              child: IntrinsicHeight(
                                child: Container(
                                  width: double.maxFinite,
                                  child: Text(
                                    'Chapter Name - ${controller.RevisionList[index].ChapterName}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 3, right: 15),
                              child: IntrinsicHeight(
                                child: Container(
                                  width: double.maxFinite,
                                  child: Text(
                                    'Subtopic - ${controller.RevisionList[index].Subtopic}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 3, right: 15),
                              child: IntrinsicHeight(
                                child: Container(
                                  width: double.maxFinite,
                                  child: Text(
                                    'Note - ${controller.RevisionList[index].Note}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 3, right: 15, bottom: 20),
                              child: IntrinsicHeight(
                                child: Container(
                                  width: double.maxFinite,
                                  child: Text(
                                    'Date Revised - ${controller.RevisionList[index].Date}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
