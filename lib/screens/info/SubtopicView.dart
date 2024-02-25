import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studize/screens/info/modelcontroller/SyllabusModel.dart';

class SubTopicView extends StatefulWidget {
  SyllabusModel SubTopics;
  SubTopicView({super.key, required this.SubTopics});

  @override
  State<SubTopicView> createState() => _SubTopicViewState();
}

class _SubTopicViewState extends State<SubTopicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
        iconTheme: IconThemeData(color: Colors.grey, fill: 0.5),
        title: Text(
          widget.SubTopics.ChapterName,
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              itemCount: widget.SubTopics.Subtpics.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 34, 34),
                        borderRadius: BorderRadius.circular(20)),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              (index + 1).toString(),
                              maxLines: 5,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: null,
                            child: Text(
                              widget.SubTopics.Subtpics[index],
                              maxLines: 5,
                              style: TextStyle(
                                  decorationThickness: 2,
                                  decorationColor: Colors.greenAccent,
                                  decoration:
                                      widget.SubTopics.SubtopicsDone[index]
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                  color: widget.SubTopics.SubtopicsDone[index]
                                      ? Colors.greenAccent
                                      : Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: CupertinoSwitch(
                                value: widget.SubTopics.SubtopicsDone[index],
                                onChanged: (value) {
                                  setState(() {
                                    widget.SubTopics.SubtopicsDone[index] =
                                        !widget.SubTopics.SubtopicsDone[index];
                                  });
                                }),
                          )
                        ],
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
