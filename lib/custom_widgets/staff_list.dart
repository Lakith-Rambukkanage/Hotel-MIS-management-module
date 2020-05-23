import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/employeecard.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StaffList extends StatefulWidget {
  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  @override
  Widget build(BuildContext context) {
    final staffList = Provider.of<List<Staff>>(context);
    if (staffList!=null) {
      return Expanded(
        child: ListView.builder(
          itemCount: staffList.length,
          itemBuilder: (context, index) {
            return EmployeedCard(staffMember: staffList[index]);
          },
        ),
      );
    }else{
      //TODO: Loading
      print('Loading - staff list');
      return Container(color: Colors.red, height: 200.0,);
    }
  }
}
