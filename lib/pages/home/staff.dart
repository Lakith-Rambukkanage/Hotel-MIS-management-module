import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/hometile.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/staffpanel.dart';
import 'package:flutter_learn/pages/home/management.dart';

class Staff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      propic: 'dummypropic.png',
      username: 'Thomas Shelby',
      jobtitle: 'Manager',
      appBarTitle: 'Staff',
      content: [
        GestureDetector(
          onTap: (){
            Navigator.push(context,new MaterialPageRoute(
              builder: (context)=>
              new Management())
              );
          },
          child: Container(
            child: StaffPanel(active: 10, leave: 2, awol: 1, staff: 'Management'),
          ),
        ),
        SizedBox(height: 10.0,),
        Container(
          child: StaffPanel(active: 100, leave: 20, awol: 15, staff: 'Employees'),
        ),
        SizedBox(height: 10.0,),
        HomeTile(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Leave Requests', style: TextStyle(color: Colors.white, fontSize: 25.0)),
                SizedBox(width:40.0),
                Container(
                  child: Center(child: Text('30',style: TextStyle(color: Colors.grey[800], fontSize: 25.0))),
                  decoration : BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30))), 
                  height: 50.0, 
                  width: 70.0,),
              ],
            ),
          )
        ]),
        SizedBox(height: 10.0,),
        HomeTile(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Send Broadcast', style: TextStyle(color: Colors.white, fontSize: 25.0)),
                SizedBox(width:40.0),
                Container(
                  child: Center(child: Icon(Icons.notifications)),
                  decoration : BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30))), 
                  height: 50.0, 
                  width: 70.0,),
              ],
            ),
          )
        ],),
        SizedBox(height: 10.0),
      ]
      );
  }
}