import 'package:flutter/material.dart';

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
                      Text(
                        'Syllabus',
                        style: theme.textTheme.headlineMedium,
                      ),
                      ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: const ListTile(
                              title: Card(
                                child: Text('hello'),
                              ),
                            ),
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

// String getRemainingDays() {
// Duration remainingTime =
//     DateTime.now().difference(DateTime.parse('20241010'));
// return remainingTime.toString();
// }
