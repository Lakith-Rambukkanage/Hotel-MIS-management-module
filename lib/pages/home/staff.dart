import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/pages/home/employees.dart';
import 'package:flutter_learn/pages/home/management.dart';

class ViewStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int activeManagement = 10;
    int leaveManagement = 2;
    int activeEmployees = 100;
    int leaveEmployees = 10;
    return ReusableScreen(
      propic: 'dummypropic.png',
      appBarTitle: 'Staff',
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              onTap: (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new Management())
                );
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.business_center),
              ),
              title: Text('Management'),
              subtitle:Text('Active : $activeManagement \nLeave : $leaveManagement'),
            ),
          ),
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              onTap: (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new Employees())
                );
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.business_center),
              ),
              title: Text('Employees'),
              subtitle:Text('Active : $activeEmployees \nLeave : $leaveEmployees'),
            ),
          ),
        SizedBox(height: 20.0,),
        //TODO: On tap do the following
        Card(
            child: ListTile(
              leading:Icon(Icons.notifications,size: 50.0,),
              title: Text('Send Broadcast'),
              subtitle: Text('Notify to all employees')
            ),
        ),
          SizedBox(height: 10.0,),
          Card(
          child: ListTile(
              leading:Icon(Icons.spellcheck,size: 50.0,),
              title: Text('Review Account Requests'),
              subtitle: Text('Pending Reviews : '),
          ),
        ),
      ]
      ));
  }
}