import 'package:flutter/material.dart';
import 'package:studize/screens/detail/widgets/date_picker.dart'; // Make sure this import is correct.
import 'package:studize/screens/detail/widgets/task_timeline.dart';
import 'package:studize/screens/detail/widgets/task_title.dart';
import 'package:studize/widgets/task.dart';

class DetailPage extends StatelessWidget {
  final Task task;

  DetailPage(this.task);

  @override
  Widget build(BuildContext context) {
    final detailList = task.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter( // Corrected the typo here
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DatePicker(),
                  TaskTitle(),
                ],
              ),
            ),
          ),
          detailList == null ?
          SliverFillRemaining(
              child: Container(
                  color: Colors.white,
                  child: Center(child: Text('No Tasks Pending',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 18
                      )))))
              : SliverList(
            delegate: SliverChildBuilderDelegate((_, index) => TaskTimeline(detailList[index]),
                childCount: detailList.length
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
      actions: [
        Icon(
          Icons.more_vert,
          size: 40,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${task.title} Tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'You have ${task.left} tasks for the day',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
