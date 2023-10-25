import 'package:flutter/material.dart';
import 'package:studize/screens/info/main_info_view.dart';

class SyllabusView extends StatelessWidget {
  final String subject;

  const SyllabusView({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final List chapters = syllabusGetListOfChapters(subject: subject);

    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: chapters.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(4),
            child: ChapterCard(
              chapterName: chapters[index],
              sectionsList: syllabus[subject]![chapters[index]]!,
            ),
          ),
        ),
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final String chapterName;
  final List<String> sectionsList;
  const ChapterCard(
      {super.key, required this.chapterName, required this.sectionsList});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: Text(chapterName),
            children: [
              for (final section in sectionsList)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(section),
                )
            ],
          ),
        ),
      ),
    );
  }
}
