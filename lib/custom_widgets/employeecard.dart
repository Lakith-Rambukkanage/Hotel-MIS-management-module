import 'package:flutter/material.dart';
import 'package:flutter_learn/models/staff.dart';

class EmployeedCard extends StatelessWidget {

  final Staff staffMember;


  EmployeedCard({
     @required this.staffMember,
     });



  @override
  Widget build(BuildContext context) {
    String name = this.staffMember.name;
    String jobTitle = this.staffMember.jobTitle;
    String section = this.staffMember.section;
    bool activeStatus = this.staffMember.activeStatus;
    String propic = 'dummypropic.png';
    Color stat;

    switch (activeStatus) {
    case true:
    stat = Colors.green;
    break;
    case false:
    stat = Colors.red;
    break;
    default:
    stat = Colors.amber;
    }
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Card(
        margin: EdgeInsets.all(5.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: stat,
            //foregroundColor: stat,
            child: CircleAvatar(
              radius: 24.0,
              backgroundImage: AssetImage('assets/$propic'),),
          ),
          title: Text(name),
          subtitle: Text (jobTitle),
        ),
      ),
    );
  }
}