import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/staff_list.dart';
import 'package:flutter_learn/custom_widgets/staff_list_account_requests.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:provider/provider.dart';
import 'package:flutter_learn/services/database.dart';
class AccountRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
        appBarTitle: 'Management',
        propic: 'dummypropic.png',
        child:
        StreamProvider<List<Staff>>.value(
          value: DatabaseService().staffList,
          child:  Container(
            //color: Colors.white.withOpacity(0.5),
            height: 450.0,child: Column(
            children: <Widget>[
              StaffListAccountRequest(),
            ],
          ),
          ),
        )
    );
  }
}