import 'package:flutter/material.dart';
import 'package:studize/services/tasks/tasks_service.dart';
import 'package:studize/widgets/app_bar.dart';

class NewTaskView extends StatefulWidget {
  final String subjectName;
  final VoidCallback refreshCallback;
  const NewTaskView({
    super.key,
    required this.subjectName,
    required this.refreshCallback,
  });

  @override
  State<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {
  // TODO: make colorpicker functional
  late final TextEditingController _title;
  late final TextEditingController _description;
  late final TextEditingController _startTime;
  late final TextEditingController _numOfHours;

  @override
  void initState() {
    _title = TextEditingController();
    _description = TextEditingController();
    _startTime = TextEditingController();
    _numOfHours = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _startTime.dispose();
    _numOfHours.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(titleText: 'New Task'),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Done'),
        icon: const Icon(Icons.done),
        onPressed: () async {
          final String title = _title.text;
          final String description = _description.text;
          final DateTime startTime = DateTime.parse(_startTime.text);
          final DateTime endTime =
              startTime.add(Duration(hours: int.parse(_numOfHours.text)));
          const Color color = Colors.amber;
          await TasksService.createTask(
            subjectName: widget.subjectName,
            title: title,
            description: description,
            timeStart: startTime,
            timeEnd: endTime,
            color: color,
          );
          widget.refreshCallback();
          if (!context.mounted) return;
          Navigator.pop(context);
        },
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _title,
              decoration: const InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
              validator: (String? value) => (value == null || value.isEmpty)
                  ? 'Please enter a title first'
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _description,
              decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'A longer description',
                  border: OutlineInputBorder()),
              minLines: 2,
              maxLines: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StartTimeInputWidget(startTime: _startTime),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _numOfHours,
              decoration: const InputDecoration(
                labelText: 'Duration',
                hintText: 'Number of hours',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 60,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    // foregroundDecoration: BoxDecoration(color: Colors.amber),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.color_lens),
                  label: const Text('Pick Color'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StartTimeInputWidget extends StatelessWidget {
  const StartTimeInputWidget({
    super.key,
    required TextEditingController startTime,
  }) : _startTime = startTime;

  final TextEditingController _startTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _startTime,
            decoration: const InputDecoration(
              labelText: 'Start Date & Time',
              hintText: 'YYYY-MM-DD HH:MM',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.datetime,
          ),
        ),
        IconButton(
          onPressed: () async {
            if (!context.mounted) return;
            DateTime startDate = (await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 500)),
                )) ??
                DateTime.now();
            if (!context.mounted) return;
            final TimeOfDay? startTimeOfDay = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (startTimeOfDay != null) {
              startDate = startDate.add(
                Duration(
                    hours: startTimeOfDay!.hour,
                    minutes: startTimeOfDay!.minute),
              );
            }
            _startTime.text = startDate.toString();
          },
          icon: const Icon(Icons.edit_calendar),
        ),
      ],
    );
  }
}
