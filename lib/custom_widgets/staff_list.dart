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
      return Expanded(
        child: ListView.builder(
          itemCount: staffList.length,
          itemBuilder: (context, index) {
          if (staffList[index].jobTitle!='Employee') {
            return EmployeeCard(staffMember: staffList[index]);
          }else{
            return Container();
          }
          },
        ),
      );
    }else{
      print('Loading - staff list');
      return Loading();
    }
  }
}
