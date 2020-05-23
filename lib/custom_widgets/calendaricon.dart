import 'package:flutter/material.dart';

class CalendarIcon extends StatelessWidget {
  final int month;
  final String date;

  const CalendarIcon({
     @required this.month, 
     @required this.date
     });

  @override
  Widget build(BuildContext context) {
    List<String> monthList = ['Jan','Feb','Mar','Apr','May','June','July','Aug','Sep','Oct','Nov','Dec'];
    return Container(
                        decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(monthList[this.month-1],
                              style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey[800]
                              ),
                              ),
                              Text(date,
                              style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.grey[800]
                              ),
                              ),
                            ],
                          ),
                        ),
                      );
  }
}