import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime selectedDay) callback;
  const DatePicker({super.key, required this.callback});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final weekList = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final DateTime now = DateTime.now();
  late int selectedIndex;
  // final dayList = ['8', '9', '10', '11', '12', '13', '14', '15'];

  @override
  void initState() {
    selectedIndex = now.weekday - 1;
    // weekList = weekList.sort()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime thisWeekMonday =
        DateTime(now.year, now.month, now.day + 1 - now.weekday);
    // now.subtract(Duration(days: now.weekday - 1));
    final List<String> dayList = [
      for (int i = 0; i < 7; i++)
        thisWeekMonday.add(Duration(days: i)).day.toString()
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        // Wrap the ListView in a SingleChildScrollView
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(weekList.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
                final selectedDay =
                    thisWeekMonday.add(Duration(days: selectedIndex));
                widget.callback(selectedDay);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selectedIndex == index
                      ? Colors.grey.withOpacity(0.7)
                      : null,
                ),
                child: Column(
                  children: [
                    Text(
                      weekList[index],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      dayList[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        // color: selected == index ? Colors.black : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
