import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/employeecard.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class StaffList extends StatefulWidget {
  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  @override
  Widget build(BuildContext context) {
    final staffList = Provider.of<List<Staff>>(context);
    if (staffList!=null) {
      List<Staff> enabledList = staffList.where((s)=>(s.userEnabled)).toList();
      if(enabledList.isNotEmpty){
      return Expanded(
        child: ListView.builder(
          itemCount: enabledList.length,
          itemBuilder: (context, index) {
            return EmployeeCard(staffMember: enabledList[index]);
          },
        ),
      );
      }else{
        return Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: Icon(Icons.warning),
            title: Text('No Accounts to show'),
            subtitle: Text('Please check Account Requests'),
          ),
        );
      }
    }else{
      print('Loading - staff list');
      return Loading();
    }
  }
}
