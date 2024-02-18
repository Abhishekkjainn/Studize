import 'package:flutter/material.dart';
import 'package:studize/screens/info/syllabus_view.dart';
import 'package:studize/services/syllabus/syllabus_service.dart';

class MainInfoView extends StatelessWidget {
  const MainInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: ListView(
        children: [
          const SizedBox(height: 50),
          const Center(child: _TimeRemainingCard()),
          const SizedBox(height: 50),
          const Center(child: _SyllabusProgressIndicator()),
          const SizedBox(height: 50),
          Text(
            'Syllabus',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const SyllabusSubjectsList(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _SyllabusProgressIndicator extends StatelessWidget {
  const _SyllabusProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final int tasksDone = SyllabusService.totalTasksDone;
    final int totalTasks = SyllabusService.totalTasks;
    final double completedFractionOfSyllabus =
        tasksDone.toDouble() / totalTasks;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Completed Syllabus: ${(completedFractionOfSyllabus * 100).toStringAsFixed(1)}%\n($tasksDone/$totalTasks)',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              value: completedFractionOfSyllabus,
              strokeWidth: 20,
              color: Colors.green.withOpacity(0.7),
              backgroundColor: Colors.green.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeRemainingCard extends StatelessWidget {
  const _TimeRemainingCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displayMedium;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Column(
            children: [
              const Text('Time befire JEE'),
              Text(
                getRemainingDays(),
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getRemainingDays() {
  var finalDay = DateTime(2024, 04, 01);
  var remainingDays = finalDay.difference(DateTime.now()).inDays.toString();
  return '$remainingDays days';
}

class SyllabusSubjectsList extends StatelessWidget {
  const SyllabusSubjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List subjects = syllabusGetListOfSubjects();
    return Column(
      children: [
        for (final subject in subjects)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SyllabusView(
                              subject: subject,
                            )));
              },
              child: SizedBox(
                width: 200,
                child: ListTile(
                  title: Text(
                    subject,
                    textAlign: TextAlign.center,
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                ),
              ),
            ),
          )
      ],
    );
  }
}

// TODO: move these functions to SyllabusService
List syllabusGetListOfSubjects() {
  var subjects = [];
  final syllabus = SyllabusService.getSyllabus();
  for (final subject in syllabus.keys) {
    subjects.add(subject);
  }
  return subjects;
}

List syllabusGetListOfChapters({required String subject}) {
  final syllabus = SyllabusService.getSyllabus();
  if (!syllabus.containsKey(subject)) {
    return [];
  }
  List<String> chapters = [];
  for (final chapter in syllabus[subject]!.keys) {
    chapters.add(chapter);
  }
  return chapters;
}
