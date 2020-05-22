import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/hometile.dart';
import 'package:flutter_learn/custom_widgets/mapicon.dart';
import 'package:flutter_learn/custom_widgets/roompanel.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/staffpanel.dart';
import 'package:flutter_learn/custom_widgets/todaypanel.dart';
import 'package:flutter_learn/pages/home/calendar.dart';
import 'package:flutter_learn/pages/home/viewevent.dart';
import 'rooms.dart';
import 'viewsections.dart';
import 'staff.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      propic: 'dummypropic.png',
      username: 'Thomas Shelby',
      jobtitle: 'Manager',
      appBarTitle: 'Dashboard',
      content: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new Calendar())
                    );
                  },
                  child: TodayPanel()),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new Staff())
                    );
                  },
                  child: StaffPanel(
                    staff: 'Staff',
                    active : 100,
                    leave : 40,
                    awol : 2,
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,new MaterialPageRoute(
                        builder: (context)=>
                        new Rooms())
                        );
                      },
                      child: RoomPanel(
                        available: 50, 
                        cleaning: 20,
                        checked: 150,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,new MaterialPageRoute(
                        builder: (context)=>
                        new Sections())
                        );
                      },
                      child: MapIcon()),
                  ],
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: (){
                        Navigator.push(context,new MaterialPageRoute(
                        builder: (context)=>
                        new ViewEvent())
                        );
                      },
                  child: HomeTile(
                    children: <Widget>[
                      SizedBox(height: 40.0, 
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('View Events',style: TextStyle( fontSize: 25.0,color: Colors.white),),
                            SizedBox(width: 20.0,),
                            Icon(Icons.event, size: 40.0,color: Colors.white,)
                          ],
                        )),)],)),
                ]
      );
  }
}