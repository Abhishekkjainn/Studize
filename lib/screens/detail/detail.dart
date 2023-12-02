import 'package:flutter/material.dart';
import 'package:studize/screens/detail/new_task_view.dart';
import 'package:studize/screens/detail/widgets/date_picker.dart'; // Make sure this import is correct.
import 'package:studize/screens/detail/widgets/task_timeline.dart';
import 'package:studize/screens/detail/widgets/task_title.dart';
import 'package:studize/services/tasks/tasks_classes.dart';
import 'package:studize/services/tasks/tasks_service.dart';
import 'package:studize/widgets/app_bar.dart';

class DetailPage extends StatefulWidget {
  final String subjectName;

  const DetailPage(this.subjectName, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DateTime selectedDay;

  @override
  void initState() {
    final now = DateTime.now();
    selectedDay = DateTime(
      now.year,
      now.month,
      now.day,
    );
    super.initState();
  }

  List<Task?> getSelectedDayTaskList(Subject subject) {
    final DateTime dateNextDay = selectedDay.add(const Duration(days: 1));
    final List<Task?> selectedDayTaskList = subject.taskList
        .where((task) =>
            task.timeStart.isAfter(selectedDay) &&
            task.timeStart.isBefore(dateNextDay))
        .toList();
    selectedDayTaskList
        .sort((task1, task2) => task1!.timeStart.compareTo(task2!.timeStart));

    // // inserting blank space
    // int endIndex = selectedDayTaskList.length - 1;
    // for (int i = 0; i < endIndex; i++) {
    //   if (selectedDayTaskList[i]!
    //       .timeEnd
    //       .add(const Duration(minutes: 30))
    //       .isBefore(selectedDayTaskList[i + 1]!.timeStart)) {
    //     selectedDayTaskList.insert(
    //       i + 1,
    //       null,
    //     );
    //     i += 2;
    //     endIndex++;
    //   }
    // }
    return selectedDayTaskList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TasksService.getSubject(name: widget.subjectName),
      builder: (context, snapshot) {
        final Subject subject = snapshot.data!;
        final List<Task?> selectedDayTaskList = getSelectedDayTaskList(subject);
        return Scaffold(
          appBar: MainAppBar(
            titleText: '${subject.name} Tasks',
            iconAssetPath: subject.iconAssetPath,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewTaskView(
                  subjectName: subject.name,
                  refreshCallback: () {
                    setState(
                      () {},
                    ); // to refresh this page when the new screen is exited
                  },
                ),
              ),
            ),
            label: const Text('New Task'),
            icon: const Icon(Icons.edit),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DatePicker(
                        callback: (selectedDay) =>
                            setState(() => this.selectedDay = selectedDay),
                      ),
                      TaskTitle(),
                    ],
                  ),
                ),
              ),
              selectedDayTaskList.isEmpty
                  ? const NoTasksWidget()
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) => TaskTimeline(
                          task: selectedDayTaskList[index],
                          subjectName: widget.subjectName,
                          subjectColor: subject.color,
                          isFirst: index == 0,
                          isLast: index == selectedDayTaskList.length - 1,
                          refreshCallback: () {
                            setState(() {});
                          },
                        ),
                        childCount: selectedDayTaskList.length,
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Text(
          'No Tasks Pending',
          style: TextStyle(
            color:
                Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
