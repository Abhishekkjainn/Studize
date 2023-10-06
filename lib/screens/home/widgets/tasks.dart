import 'package:flutter/material.dart';

import '../../../models/task.dart';

class Tasks extends StatelessWidget {
  final tasksList = Task.generateTasks();

  Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: tasksList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth > 600
              ? 4
              : 2, // Adjust the number of columns based on screen width
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => tasksList[index].isLast
            ? _buildAddTask()
            : _buildTask(context, tasksList[index]),
      ),
    );
  }

// problem
  Widget _buildAddTask() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Add task logic
        },
        child: const Text('Add Task'),
      ),
    );
  }

  Widget _buildTask(BuildContext context, Task task) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: task.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            task.iconAsset!,
            width: 35,
            height: 35,
          ),
          const SizedBox(height: 5), // Adjusted the height
          Text(
            task.title!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10), // Adjusted the height
          Row(
            children: [
              _buildTaskStatus(task.btnColor!, task.bgColor!,
                  '${task.done} done', Colors.black),
              const SizedBox(width: 15),
              _buildTaskStatus(Colors.black, task.bgColor!, '${task.left} left',
                  Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTaskStatus(
      Color bgColor, Color txColor, String text, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Adjusted vertical padding
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor, // Set the text color for visibility
        ),
      ),
    );
  }
}
