import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      appBarTitle: 'Calendar & Events', 
      propic: 'dummypropic.png', 
      username: 'Thomas Shelby', 
      jobtitle: 'Manager',
      content: [
        Container(
          color: Colors.white,
          child: TableCalendar(
            calendarStyle: CalendarStyle(
              todayColor: Colors.cyan[300],
              selectedColor: Colors.cyan,
            ),
            calendarController: new CalendarController()
            // TODO : implement events, last task, refer tutorial
            )
          )
        ],
      );
  }
}