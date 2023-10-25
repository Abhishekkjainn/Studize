import 'package:flutter/material.dart';
import 'package:studize/constants/colors.dart';
import 'package:studize/screens/detail/detail.dart';

class Task {
  String? iconAsset;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool isLast;

  Task({
    this.iconAsset,
    this.title,
    this.bgColor,
    this.iconColor,
    this.btnColor,
    this.left,
    this.done,
    this.desc,
    this.isLast = false,
  });

  static List<Task> generateTasks() {
    const commonIconAsset = 'assets/icon/physics.png';
    const List<String> categories = ['Physics', 'Chemistry', 'Maths'];
    return List.generate(
      categories.length,
          (index) => Task(
        title: categories[index],
        iconAsset: commonIconAsset,
        bgColor: taskColorsBG[index],
        btnColor: taskColorsBtn[index],
        left: 3,
        done: 1,
        desc: [
          {
            'time': '9:00 am',
            'title': 'Chemical Bonding Note Making',
            'slot': '9:00 - 11:00 am',
            'tlColor': kRedDark,
            'bgColor': kRedLight,
          },
          {
            'time': '11:00 am',
            'title': '',
            'slot': '',
            'tl': Colors.grey.withOpacity(0.3),
          },
          {
            'time': '12 pm',
            'title': 'Complex Number Question Solving',
            'slot': '12:00 - 2:00 pm',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,
          },
          {
            'time': '2:00 pm',
            'title': '',
            'slot': '',
            'tlColor': Colors.grey.withOpacity(0.3),
          },
          {
            'time': '3:00 pm',
            'title': 'Physics Class Revision',
            'slot': '3:00 - 4:00 pm',
            'tlColor': kYellowDark,
            'bgColor': kYellowLight,
          },
          {
            'time': '4:00 pm',
            'title': 'Allen Chemistry Class',
            'slot': '4:00 - 6:00 pm',
            'tlColor': kRedDark,
            'bgColor': kRedLight,
          },
          {
            'time': '6:00 pm',
            'title': 'Allen Physics Class',
            'slot': '6:00 - 8:00 apm',
            'tlColor': kRedDark,
            'bgColor': kRedLight,
          },
        ],
      ),
    );
  }
}

class Tasks extends StatelessWidget {
  final tasksList = Task.generateTasks();

  Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: tasksList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth > 650 ? 3 : 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => tasksList[index].isLast
                ? _buildAddTask()
                : _buildTask(context, tasksList[index]),
          ),
        ),
      ],
    );
  }

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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(task),
          ),
        );
      },
      child: Container(
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
            const SizedBox(height: 5),
            Text(
              task.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildTaskStatus(
                  task.btnColor!,
                  task.bgColor!,
                  '${task.done} done',
                  Colors.black,
                ),
                const SizedBox(width: 15),
                _buildTaskStatus(
                  Colors.black,
                  task.bgColor!,
                  '${task.left} left',
                  Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskStatus(
      Color bgColor,
      Color txColor,
      String text,
      Color textColor,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
