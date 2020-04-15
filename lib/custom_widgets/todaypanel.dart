import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/hometile.dart';

import 'calendaricon.dart';


class TodayPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeTile(
              children : <Widget>[
                  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text('Today',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white
                    ),
                  ),
                  Divider(
                    height: 20.0,
                    thickness: 10.0,
                    color: Colors.white,
                  ),        
                  Text('- Wedding hall-1 @3.00 pm', style: TextStyle(fontSize: 15.0, color: Colors.white),),
                ],
                ),
                ),
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CalendarIcon(
                  month: 'Mar',
                  date: '04',
                  ),
              )
          ]
        );
  }
}