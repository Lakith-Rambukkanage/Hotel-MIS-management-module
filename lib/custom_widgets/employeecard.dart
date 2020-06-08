import 'package:flutter/material.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/home/staffprofile.dart';
import 'package:provider/provider.dart';

class EmployeeCard extends StatelessWidget {

  final Staff staffMember;


  EmployeeCard({
     @required this.staffMember,
     });



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    String name = this.staffMember.name;
    String uid = this.staffMember.uid;
    bool click = true;
    if (user!=null){
        if (uid==user.uid){
        name = 'You';
        click=false;
      }
    }
    String jobTitle = this.staffMember.jobTitle;
    String section = this.staffMember.section;
    bool activeStatus = this.staffMember.activeStatus;
    String propic = 'dummypropic.png';
    Color stat;

    switch (activeStatus) {
    case true:
    stat = Colors.green;
    break;
    case false:
    stat = Colors.red;
    break;
    default:
    stat = Colors.amber;
    }
    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        enabled: click,
        onTap: (){
          Navigator.push(context,new MaterialPageRoute(
            builder: (context)=>
            new StaffProfile(uid: this.staffMember.uid,))
        );},
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: stat,
          //foregroundColor: stat,
          child: CircleAvatar(
            radius: 24.0,
            backgroundImage: AssetImage('assets/$propic'),),
        ),
        title: Text('$name'),
        subtitle: Text ('$jobTitle - $section'),
      ),
    );
  }
}