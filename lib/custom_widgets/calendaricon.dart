import 'package:flutter/material.dart';

class CalendarIcon extends StatelessWidget {
  final String month;
  final String date;

  const CalendarIcon({
     @required this.month, 
     @required this.date
     });

  @override
  Widget build(BuildContext context) {
    return Container(
                        decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(month,
                              style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey[800]
                              ),
                              ),
                              Text('$date',
                              style: TextStyle(
                              fontSize: 70.0,
                              color: Colors.grey[800]
                              ),
                              ),
                            ],
                          ),
                        ),
                      );
  }
}