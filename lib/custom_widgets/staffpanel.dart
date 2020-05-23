import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/home/staff.dart';

class StaffPanel extends StatelessWidget {
  final int active;
  final int leave;
  final String staffType;

  const StaffPanel({
    @required this.active,
    @required this.leave,
    @required this.staffType,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        onTap: (){
          Navigator.push(context,new MaterialPageRoute(
              builder: (context)=>
              new ViewStaff())
          );
        },
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.business_center),
        ),
        title: Text(staffType),
        subtitle:Text('Active : $active \nLeave : $leave'),
      ),
    );
  }
}