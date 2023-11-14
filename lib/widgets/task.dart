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
    final screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: _subjectListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Subject>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              List<Subject> subjectList = snapshot.data!;
              print(subjectList);
              return ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: subjectList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenWidth > 650 ? 3 : 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) =>
                          _buildSubject(context, subjectList[index]),
                    ),
                  ),
                ],
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

  Widget _buildAddSubject() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Add task logic
        },
        child: const Text('Add Task'),
      ),
    );
  }

  Widget _buildSubject(BuildContext context, Subject subject) {
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
            Image.asset(
              subject.iconAssetPath,
              width: 35,
              height: 35,
            ),
            const SizedBox(height: 5),
            Text(
              subject.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
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
                // const SizedBox(width: 15),
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
