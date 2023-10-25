import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final weekList = ['Mon', 'Tue', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'];
  final dayList = ['8', '9', '10', '11', '12', '13', '14', '15'];
  var selected = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView( // Wrap the ListView in a SingleChildScrollView
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(weekList.length, (index) {
            return GestureDetector(
              onTap: () => setState(() => selected = index),
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selected == index ? Colors.grey.withOpacity(0.1) : null,
                ),
                child: Column(
                  children: [
                    Text(
                      weekList[index],
                      style: TextStyle(
                        color: selected == index ? Colors.black : Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      dayList[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: selected == index ? Colors.black : Colors.grey,
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
