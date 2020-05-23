import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _selectedDay = DateTime.now();
    return ReusableScreen(
      appBarTitle: 'Calendar & Events', 
      propic: 'dummypropic.png',
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children :  [
        Container(
          color: Colors.white,
          child: TableCalendar(
            calendarStyle: CalendarStyle(
              todayColor: Colors.cyan[300],
              selectedColor: Colors.cyan,
            ),
            events: {
                    _selectedDay.subtract(Duration(days: 30)): ['Event A0', 'Event B0', 'Event C0'],
                    _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
                    _selectedDay.subtract(Duration(days: 20)): ['Event A2','Event D2'],
                    _selectedDay.subtract(Duration(days: 5)): [ 'Event B6'],
                    _selectedDay.add(Duration(days: 7)): ['Event A10'],
                    _selectedDay.add(Duration(days: 26)): ['Event A14', 'Event B14', ],
                  },
            calendarController: new CalendarController()
            // TODO : implement events, last task, refer tutorial
            )
          ),
        ],
      )
    );
  }
}