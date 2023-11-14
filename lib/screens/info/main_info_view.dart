import 'package:flutter/material.dart';
import 'package:studize/screens/info/syllabus_view.dart';

class MainInfoView extends StatelessWidget {
  const MainInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const BigCard(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                        child: Text(
                          'Syllabus',
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                      ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: const SyllabusSubjectsList(),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
  });

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
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SyllabusView(
                          subject: subjects[index],
                        )));
          },
          child: ListTile(
            title: Text(subjects[index]),
          ),
        ),
      ),
      itemCount: subjects.length,
    );
  }
}

List syllabusGetListOfSubjects() {
  var subjects = [];
  for (final subject in syllabus.keys) {
    subjects.add(subject);
  }
  return subjects;
}

List syllabusGetListOfChapters({required String subject}) {
  if (!syllabus.containsKey(subject)) {
    return [];
  }
  var chapters = [];
  for (final chapter in syllabus[subject]!.keys) {
    chapters.add(chapter);
  }
  return chapters;
}

const syllabus = {
  'Mathematics': {
    'Sets, Relations and Functions': [
      'Sets and their representation',
      'Union',
      'Power Set',
      'Intersection and Complements of Sets',
    ],
    'Complex Numbers and Quadratic Equations': [
      'Complex Numbers as ordered pairs of reals',
      'Representation in the form a+ib',
      'Argand Plane',
    ],
  },
  'Physics': {
    'Physics and Measurement': [
      'Physics Technology and Society',
      'SI Units',
    ],
    'Kinematics': [
      'Frame of reference',
      'Motion in a straight line',
      'Uniform and Non Uniform Motion',
    ],
  },
  'Chemistry': {
    'Some basic concepts in chemistry': [
      'Matter and it\'s nature',
      'Dalton\'s Atomic Theory',
      'Concept of atom',
    ],
    'States of Matter': [
      'Gas Laws',
      'Boyle\'s Law',
      'Avogadro\'s Law',
    ],
  }
};
