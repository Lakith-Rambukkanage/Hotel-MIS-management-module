import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/mapicon.dart';
import 'package:flutter_learn/custom_widgets/roompanel.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/staffpanel.dart';
import 'package:flutter_learn/custom_widgets/todaypanel.dart';
import 'rooms.dart';
import 'section.dart';
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
                TodayPanel(),
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
                        new Section())
                        );
                      },
                      child: MapIcon()),
                  ],
                ),
                SizedBox(height: 20.0,),
                ]
      );
  }
}