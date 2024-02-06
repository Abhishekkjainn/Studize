import 'package:flutter/material.dart';
import 'package:studize/constants/colors.dart';
import 'package:studize/screens/detail/new_task_view.dart';
import 'package:studize/screens/detail/widgets/date_picker.dart'; // Make sure this import is correct.
import 'package:studize/screens/detail/widgets/task_timeline.dart';
import 'package:studize/screens/detail/widgets/task_title.dart';
import 'package:studize/services/tasks/tasks_classes.dart';
import 'package:studize/services/tasks/tasks_service.dart';
import 'package:studize/widgets/app_bar.dart';

/// Build a detailed view of the tasks for a particular subject. Contains a
/// timeline, a list of tasks
///
/// Arguments:
/// - `subjectName` : To build the page, filtered for a particular subject and
///   show a date picker for the week
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

    return selectedDayTaskList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TasksService.getSubject(name: widget.subjectName),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            // TODO: show error screen.
            return const Placeholder();
          case ConnectionState.waiting:
            // TODO: show loading screen
            return const Placeholder();
          case ConnectionState.active:
            // TODO: show loading screen
            return const Placeholder();
          case ConnectionState.done:
            final Subject subject = snapshot.data!;
            final List<Task?> selectedDayTaskList =
                getSelectedDayTaskList(subject);
            return Scaffold(
              appBar: MainAppBar(
                titleText: '${subject.name} Tasks',
                iconAssetPath: subject.iconAssetPath,
              ),
              floatingActionButton:
                  _buildDetailPageFloatingActionButton(context, subject),
              body: _buildDetailPageBody(selectedDayTaskList, subject),
            );
        }
      },
    );
  }

  FloatingActionButton _buildDetailPageFloatingActionButton(
      BuildContext context, Subject subject) {
    return FloatingActionButton.extended(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (context) => NewTaskView(
          //   subjectName: subject.name,
          //   refreshCallback: () {
          //     setState(
          //       () {},
          //     ); // to refresh this page when the new screen is exited
          //   },
          // ),
          builder: (context) => const NewTaskCategoryPicker(),
        ),
      ),
      label: const Text('New Task'),
      icon: const Icon(Icons.edit),
    );
  }

  CustomScrollView _buildDetailPageBody(List<Task?> taskList, Subject subject) {
    return CustomScrollView(
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
                const TaskTitle(),
              ],
            ),
          ),
        ),
        taskList.isEmpty
            ? const NoTasksWidget()
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) => TaskTimeline(
                    task: taskList[index],
                    color: taskList[index]?.isCompleted ?? false
                        ? completedTaskColor
                        : subject.color,
                    isFirst: index == 0,
                    isLast: index == taskList.length - 1,
                    refreshCallback: () {
                      setState(() {});
                    },
                  ),
                  childCount: taskList.length,
                ),
              )
      ],
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

class TodayTasksView extends StatefulWidget {
  const TodayTasksView({super.key});

  @override
  State<TodayTasksView> createState() => _TodayTasksViewState();
}

class _TodayTasksViewState extends State<TodayTasksView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TasksService.getFilteredTasks(
          dateTimeRange: DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now().add(const Duration(days: 1)))),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            // TODO: show error screen
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            // TODO: show loading screen
            return const Placeholder();
          case ConnectionState.done:
            final List<Task> taskList = snapshot.data!;
            return taskList.isEmpty
                ? const NoTasksWidget()
                : ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return TaskTimeline(
                        task: taskList[index],
                        color: taskList[index].isCompleted
                            ? completedTaskColor
                            : taskList[index].color,
                        isFirst: index == 0,
                        isLast: index == taskList.length - 1,
                        refreshCallback: () {
                          setState(() {});
                        },
                      );
                    },
                    itemCount: taskList.length,
                  );
        }
      },
    );
  }
}
