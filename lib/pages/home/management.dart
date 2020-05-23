import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/staff_list.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:flutter_learn/pages/home/staffprofile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_learn/services/database.dart';
class Management extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      appBarTitle: 'Management',
      propic: 'dummypropic.png',
        child:
        StreamProvider<List<Staff>>.value(
          value: DatabaseService().staffList,
          child:  Container(
            color: Colors.white.withOpacity(0.5),
            height: 450.0,child: Column(
            children: <Widget>[
              StaffList(),
            ],
          ),),
        )
    );
  }
}