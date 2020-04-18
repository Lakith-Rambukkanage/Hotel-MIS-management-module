import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/sectiontile.dart';
import 'package:flutter_learn/pages/home/restaurant.dart';
import 'package:flutter_learn/pages/home/rooms.dart';

class Section extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      propic: 'dummypropic.png',
      username: 'Thomas Shelby',
      jobtitle: 'Manager',
      appBarTitle: 'Sections',
      content: <Widget>[
                  GestureDetector(
                    child: SectionTile(
                      image : 'room.png',
                      name : 'Rooms'
                    ),
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(
                      builder: (context)=>
                      new Rooms())
                      );
                    },
                  ),
                  GestureDetector(
                    child: SectionTile(
                      image : 'Rest.png',
                      name : 'Restaurant'
                    ),
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(
                      builder: (context)=>
                      new Restaurant())
                      );
                    },
                  ),
                  // TODO : in each section show updates from manager etc. 
                  // TODO : allow broadcast to all employees within section
                ],
    );
  }
}