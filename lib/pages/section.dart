import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/sectiontile.dart';

class Section extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      propic: 'dummypropic.png',
      username: 'Thomas Shelby',
      jobtitle: 'Manager',
      appBarTitle: 'Sections',
      content: <Widget>[
                  SectionTile(
                    image : 'room.png',
                    name : 'Rooms'
                  ),
                  SectionTile(
                    image : 'Rest.png',
                    name : 'Restaurant'
                  ),
                  Text('updates from all sections in a list and acknowledged')
                  // TODO : in each section show updates from manager etc. 
                  // TODO : allow broadcast to all employees within section
                ],
    );
  }
}