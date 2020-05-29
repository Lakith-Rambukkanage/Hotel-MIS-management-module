import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/home/calendar_and_events.dart';

import 'calendaricon.dart';


class TodayPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(10.0),
            onTap: (){
            Navigator.push(context,new MaterialPageRoute(
            builder: (context)=>
            new Calendar())
            );
            },
            leading: CalendarIcon(
         month : dateTime.month.toInt(),
          date :dateTime.day.toString()
            ),
                    title: Text('Today'),
                    subtitle:Text('view Calendar and Events'),
              ),
        ],
      ),
    );
  }
}