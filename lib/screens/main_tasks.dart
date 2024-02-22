import 'package:flutter/material.dart';
import 'package:studize/screens/detail/detail.dart';
import 'package:studize/widgets/app_bar.dart';
import 'package:studize/widgets/task.dart';

class MainTasksView extends StatelessWidget {
  const MainTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubjectsGrid(),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              'Upcoming Tasks',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TodayTasksView(),
            ),
          )
        ],
      ),
    );
  }
}
