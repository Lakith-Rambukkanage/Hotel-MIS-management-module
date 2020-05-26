import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/todaypanel.dart';
import 'package:flutter_learn/pages/home/viewevent.dart';
import 'viewsections.dart';
import 'staff.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int activeManagement = 10;
    int leaveManagement = 2;
    int activeEmployees = 100;
    int leaveEmployees = 10;
    return ReusableScreen(
      propic: 'dummypropic.png',
      appBarTitle: 'Dashboard',
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children :<Widget>[
          TodayPanel(),
          SizedBox(height: 20.0,),
          Container(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
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
                        new ViewStaff())
                    );
                  },
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.people),
                  ),
                  title: Text('Employees'),
                  subtitle:Text('Active : $activeEmployees \nLeave : $leaveEmployees'),
                ),
              ),
            ],
          )),
          SizedBox(height: 20.0,),
          Card(
            child: ListTile(
              onTap:  (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new Sections())
                );
              },
              leading:Icon(Icons.map,size: 50.0,),
              title: Text('View Sections'),
              subtitle: Text('Rooms,Restaurent,etc.'),
            ),
          ),
          Card(
            child: ListTile(
              onTap:  (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new ViewEvent())
                );
              },
              leading:Icon(Icons.event,size: 50.0,),
              title: Text('View Events'),
              subtitle: Text('Pending'),
            ),
          ),
                ]
      )
    );
  }
}