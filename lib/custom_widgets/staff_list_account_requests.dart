import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/employeecarddisabled.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class StaffListAccountRequest extends StatefulWidget {
  @override
  _StaffListAccountRequestState createState() => _StaffListAccountRequestState();
}

class _StaffListAccountRequestState extends State<StaffListAccountRequest> {
  @override
  Widget build(BuildContext context) {
    final staffList = Provider.of<List<Staff>>(context);
    if (staffList!=null) {
      List<Staff> enabledList = staffList.where((s)=>(!s.userEnabled)).toList();
      if(enabledList.isNotEmpty){
        return Expanded(
          child: ListView.builder(
            itemCount: enabledList.length,
            itemBuilder: (context, index) {
              return EmployeeCardDisabled(staffMember: enabledList[index]);
            },
          ),
        );
      }else{
        return Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: Icon(Icons.rate_review),
            title: Text('No Pending Request'),
          ),
        );
      }
    }else{
      print('Loading - staff list');
      return Loading();
    }
  }
}
