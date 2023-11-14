import 'package:flutter/material.dart';
import 'package:studize/widgets/task.dart';

class MainTasksView extends StatelessWidget {
  const MainTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: const Text(
            'Tasks',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: SubjectsGrid(),
        )
      ],
    );
  }
}
