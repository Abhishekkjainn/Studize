import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studize/services/tasks/tasks_classes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeline extends StatelessWidget {
  final Task task;
  final Color subjectColor;
  const TaskTimeline(
      {super.key, required this.task, required this.subjectColor});

  @override
  Widget build(BuildContext context) {
    final timeString = DateFormat.jm().format(task.timeStart);
    return Container(
        // color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            _buildTimeline(subjectColor.withOpacity(0.8)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(timeString),
                  task.title.isNotEmpty
                      ? _buildCard(
                          bgColor: task.color,
                          description: task.description,
                          title: task.title,
                        )
                      : _buildCard(bgColor: null, title: '', description: '')
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildTimeline(Color color) {
    return SizedBox(
        height: 80,
        width: 20,
        child: TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0,
          isFirst: true,
          indicatorStyle: IndicatorStyle(
              indicatorXY: 0,
              width: 15,
              indicator: Container(
                  decoration: BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: color),
              ))),
          afterLineStyle: LineStyle(
            thickness: 2,
            color: color,
          ),
        ));
  }

  Widget _buildCard({
    required Color? bgColor,
    required String title,
    required String description,
  }) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          color: bgColor?.withOpacity(0.5) ?? Colors.transparent,
          // color: Colors.amber.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          )),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            // style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
