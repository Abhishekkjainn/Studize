import 'package:flutter/material.dart';
import 'package:studize/services/tasks/tasks_service.dart';
import 'package:studize/widgets/app_bar.dart';

class TaskCategory {
  final String title;
  final String description;
  const TaskCategory({
    required this.title,
    required this.description,
  });
}

// TODO: edit the descriptions
const List<TaskCategory> newTaskCategories = [
  TaskCategory(
    title: 'Concept 💡',
    description: 'Study and understand core concepts and theory',
  ),
  TaskCategory(
    title: 'Notes 📖',
    description: 'Prepare notes to make revision easier',
  ),
  TaskCategory(
    title: 'Solve Questions ✍️',
    description: 'Practice makes perfect.',
  ),
  TaskCategory(
    title: 'Test 🧪',
    description: 'Test your learning, find out your strengths and weaknesses',
  ),
  TaskCategory(
    title: 'Revision 🔁',
    description: 'Spaced Repitition - best for long term memory',
  ),
];

class NewTaskCategoryPicker extends StatelessWidget {
  const NewTaskCategoryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Widget> columnChildren = [
      Expanded(
        child: Center(
          child: Text(
            "What's on your mind today?",
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Expanded(
        flex: 4,
        child: ListView.builder(
          itemBuilder: (context, index) => _NewTaskCategoryPickerCard(
            taskCategory: newTaskCategories[index],
          ),
          itemCount: newTaskCategories.length,
        ),
      )
    ];
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: columnChildren,
          ),
        ),
      ),
    );
  }
}

class _NewTaskCategoryPickerCard extends StatelessWidget {
  final TaskCategory taskCategory;
  const _NewTaskCategoryPickerCard({required this.taskCategory});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const _NewTaskSubjectPicker(),
        ));
      },
      child: Center(
        child: Card(
          child: Container(
            width: 300,
            // height: 150,
            constraints: const BoxConstraints(maxWidth: 300, minHeight: 150),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      taskCategory.title,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      taskCategory.description,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NewTaskSubjectPicker extends StatelessWidget {
  const _NewTaskSubjectPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MainAppBar(),
      body: FutureBuilder(
        future: TasksService.getSubjectNameList(),
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
              final List<String> subjectNameList = snapshot.data!;
              final List<Widget> columnChildren = [
                Expanded(
                  child: Center(
                    child: Text(
                      "Pick a subject",
                      style: theme.textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemBuilder: (context, index) => _NewTaskSubjectPickerCard(
                      subjectName: subjectNameList[index],
                    ),
                    itemCount: subjectNameList.length,
                  ),
                )
              ];
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: columnChildren,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}

class _NewTaskSubjectPickerCard extends StatelessWidget {
  final String subjectName;
  const _NewTaskSubjectPickerCard({required this.subjectName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Placeholder(),
        ));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              width: 200,
              // height: 150,
              constraints: const BoxConstraints(maxWidth: 300, minHeight: 100),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    subjectName,
                    style: textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
