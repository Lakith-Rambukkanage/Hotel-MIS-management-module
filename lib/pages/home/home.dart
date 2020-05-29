import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/todaypanel.dart';
import 'package:flutter_learn/pages/home/calendar_and_events.dart';
import 'package:flutter_learn/pages/home/event_shedule.dart';
import 'package:flutter_learn/pages/home/viewevent.dart';
import 'viewsections.dart';
import 'staff.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    child: Icon(Icons.business_center,),
                  ),
                  title: Text('Staff'),
                  subtitle:Text('view staff available'),
                ),
              ),
//              Card(
//                child: ListTile(
//                  contentPadding: EdgeInsets.all(10.0),
//                  onTap: (){
//                    Navigator.push(context,new MaterialPageRoute(
//                        builder: (context)=>
//                        new ViewStaff())
//                    );
//                  },
//                  leading: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Icon(Icons.people),
//                  ),
//                  title: Text('Employees'),
//                  subtitle:Text('Active : $activeEmployees \nLeave : $leaveEmployees'),
//                ),
//              ),
            ],
          )),
          SizedBox(height: 20.0,),
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              onTap:  (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new Sections())
                );
              },
              leading:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.map,),
              ),
              title: Text('View Sections'),
              subtitle: Text('Rooms, Restaurant and Halls'),
            ),
          ),
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              onTap:  (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new SheduleEvent())
                );
              },
              leading:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.event,),
              ),
              title: Text('Schedule Event'),
              subtitle: Text('Add new event to calendar'),
            ),
          ),
                ]
      )
    );
  }
}