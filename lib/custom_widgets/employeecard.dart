import 'package:flutter/material.dart';

class EmployeedCard extends StatelessWidget {

  final String name;
  final String jobtitle;
  final String assignment;
  final String propic;
  final String status;

  const EmployeedCard({
     @required this.name, 
     @required this.jobtitle, 
     @required this.assignment, 
     @required this.propic,
     @required this.status
     });



  @override
  Widget build(BuildContext context) {
    Color stat;
    switch (status) {
      case 'active':
        stat = Colors.green;
        break;
      case 'leave':
        stat = Colors.red;
        break;
      default:
        stat = Colors.amber;
    }
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
                  margin: EdgeInsets.all(1.0),
                  width: 450.0,
                  color: Colors.white.withOpacity(0.9),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(height: 100.0, width: 10.0, color: stat),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(backgroundImage: AssetImage('assets/$propic'),radius: 35.0,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('$name', style: TextStyle(color: Colors.black, fontSize: 22.0)),
                            Text('$jobtitle', style: TextStyle(color: Colors.cyan, fontSize: 17.0)),
                            Text('$assignment', style: TextStyle(color: Colors.black, fontSize: 15.0)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}