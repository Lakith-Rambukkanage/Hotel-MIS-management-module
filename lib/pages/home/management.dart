import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/employeecard.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';

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
          name: 'Arthur Shelby',
          jobtitle: 'Junior Manager',
          assignment: 'Kitchen',
          propic: 'dummypropic.png', 
          status: 'active',
        ),
        EmployeedCard(
          name: 'Arthur Shelby',
          jobtitle: 'Kitchen Head',
          assignment: 'Kitchen',
          propic: 'chefpropic.png', 
          status: 'active',
        ),
        EmployeedCard(
          name: 'Arthur Shelby',
          jobtitle: 'Assistant Manager',
          assignment: 'Kitchen',
          propic: 'dummypropic.png', 
          status: 'leave',
        ),
        EmployeedCard(
          name: 'Arthur Shelby',
          jobtitle: 'Assistant Manager',
          assignment: 'Kitchen',
          propic: 'dummypropic.png', 
          status: 'active',
        ),
        EmployeedCard(
          name: 'Lakith Ransika Rambukkanage',
          jobtitle: 'Assistant Manager',
          assignment: 'Kitchen',
          propic: 'dummypropic.png', 
          status: 'off',
        ),
      ]
      );
  }
}