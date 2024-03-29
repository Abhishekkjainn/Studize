import 'package:flutter/material.dart';
import 'package:studize/screens/detail/detail.dart';
import 'package:studize/services/tasks/tasks_classes.dart';
import 'package:studize/services/tasks/tasks_service.dart';

class SubjectsGrid extends StatelessWidget {
  final Future<List<Subject>> _subjectListFuture =
      TasksService.getSubjectList();
  SubjectsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _subjectListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Subject>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              List<Subject> subjectList = snapshot.data!;
              print('Building SubjectsGrid, given subjectList:$subjectList');
              return Container(
                padding: const EdgeInsets.all(15),
                height: 150,
                width: 600,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: subjectList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // crossAxisCount: screenWidth > 650 ? 3 : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) =>
                      _buildSubjectCard(context, subjectList[index]),
                ),
              );
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(
                child: Text('Fetching subjects from storage....'),
              );

            case ConnectionState.none:
              return const Center(
                child: Text("Error: Could not get subjects from storage"),
              );
          }
        });
  }

  Widget _buildSubjectCard(BuildContext context, Subject subject) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(subject.name),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: subject.color.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Row(
              children: [
                Image.asset(
                  subject.iconAssetPath,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  subject.name.substring(0, 4),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                // _buildTaskStatus(
                //   subject.btnColor!,
                //   subject.bgColor!,
                //   '${subject.getNumTasksDone()} done',
                //   Colors.black,
                // ),
                // const SizedBox(width: 5),
                _buildTaskStatus(
                  Colors.black,
                  subject.color,
                  '${subject.numTasksLeft} left',
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
