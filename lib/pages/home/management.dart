import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/employeecard.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/pages/home/staffprofile.dart';

class Management extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      appBarTitle: 'Management',
      jobtitle: 'Manager',
      propic: 'dummypropic.png',
      username: 'Thomas Shelby',
      content : <Widget>[
        EmployeedCard(
          name: 'Ken Adams',
          jobtitle: 'Junior Manager',
          assignment: 'Bar',
          propic: 'dummypropic.png', 
          status: 'active',
        ),
        EmployeedCard(
          name: 'Peter Parker',
          jobtitle: 'Kitchen Head',
          assignment: 'Kitchen',
          propic: 'chefpropic.png', 
          status: 'active',
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new StaffProfile())
                    );
          },
            child: EmployeedCard(
            name: 'Arthur Shelby',
            jobtitle: 'Assistant Manager',
            assignment: 'Restaurant',
            propic: 'dummypropic.png', 
            status: 'leave',
          ),
        ),
        EmployeedCard(
          name: 'Joey Tribbiani',
          jobtitle: 'Maintenance Offcer',
          assignment: 'Rooms',
          propic: 'dummypropic.png', 
          status: 'active',
        ),
        EmployeedCard(
          name: 'Lakith Ransika Rambukkanage',
          jobtitle: 'Assistant Manager',
          assignment: 'Halls',
          propic: 'dummypropic.png', 
          status: 'off',
        ),
      ]
      );
  }
}