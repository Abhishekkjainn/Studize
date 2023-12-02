import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studize/screens/detail/new_task_view.dart';
import 'package:studize/services/tasks/tasks_classes.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeline extends StatelessWidget {
  final Task? task; // null task indicates blank space
  final String subjectName;
  final Color subjectColor;
  final bool isFirst;
  final bool isLast;
  final VoidCallback refreshCallback;
  const TaskTimeline({
    super.key,
    required this.task,
    required this.subjectName,
    required this.subjectColor,
    required this.isFirst,
    required this.isLast,
    required this.refreshCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.white,
        height: 120,
        width: 10,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTimeline(subjectColor.withOpacity(0.8), isFirst, isLast),
            (task == null)
                ? const SizedBox(
                    height: 30,
                  )
                : Expanded(
                    child: GestureDetector(
                      onLongPress: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Tap and hold to modify')));
                      },
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ModifyTaskView(
                                    subjectName: subjectName,
                                    taskId: task!.id,
                                    refreshCallback: refreshCallback)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Text(timeString),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateFormat.jm().format(task!.timeStart)),
                              const Text('to'),
                              Text(DateFormat.jm().format(task!.timeEnd)),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          _buildCard(
                            bgColor: task!.color,
                            description: task!.description,
                            title: task!.title,
                          )
                        ],
                      ),
                    ),
                  )
          ],
        ));
  }

  Widget _buildTimeline(Color color, bool isFirst, bool isLast) {
    return SizedBox(
        height: 120,
        width: 20,
        child: TimelineTile(
          // alignment: TimelineAlign.manual,
          lineXY: 0,
          isFirst: isFirst,
          isLast: isLast,
          indicatorStyle: IndicatorStyle(
              // indicatorXY: 0,
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
          beforeLineStyle: LineStyle(
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
          borderRadius: const BorderRadius.all(Radius.circular(10))),
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
