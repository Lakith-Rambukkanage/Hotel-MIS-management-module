import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/todaypanel.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/home/event_shedule.dart';
import 'package:provider/provider.dart';
import 'viewsections.dart';
import 'staff.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    bool enabled=false;
    if(userData!=null){
      if (userData.jobTitle=='Manager'){
        enabled=true;
      }
      if(userData.jobTitle=='Senior Manager' && (userData.section=='Halls'||userData.section=='Hotel' )){
        enabled=true;
      }
    }
      return ReusableScreen(
      propic: 'dummypropic.png',
      appBarTitle: 'Dashboard',
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children :<Widget>[
          TodayPanel(),
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              enabled: enabled,
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
              title: Text('Sections'),
              subtitle: Text('Rooms, Restaurant and Halls'),
            ),
          ),
          SizedBox(height: 20.0,),
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
        ]
      )
    );
  }
}