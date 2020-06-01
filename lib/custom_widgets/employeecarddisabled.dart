import 'package:flutter/material.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:provider/provider.dart';

class EmployeeCardDisabled extends StatelessWidget {

  final Staff staffMember;


  EmployeeCardDisabled({
    @required this.staffMember,
  });



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    String name = this.staffMember.name;
    String uid = this.staffMember.uid;
    bool click = true;
    if (uid==user.uid){
      name = 'You';
      click=false;
    }
    if(user.jobTitle!='Manager'){
      click=false;
    }
    String jobTitle = this.staffMember.jobTitle;
    String section = this.staffMember.section;
    String email = this.staffMember.email;
    String mobileNo = this.staffMember.mobileNo;
    bool activeStatus = this.staffMember.activeStatus;
    String propic = 'dummypropic.png';
    Color stat = Colors.amber;


    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        enabled: click,
        onTap: (){
          showSectionsDialog(context, uid);
          },
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: stat,
          //foregroundColor: stat,
          child: CircleAvatar(
            radius: 24.0,
            backgroundImage: AssetImage('assets/$propic'),),
        ),
        title: Text('$name'),
        subtitle: Text ('$jobTitle \n$email\n$mobileNo'),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.rate_review),
        ),
      ),
    );
  }

  showSectionsDialog(BuildContext context,String uid) {

    // set up the buttons
    Widget restaurantButton = FlatButton(
      child: Text("Restaurant"),
      onPressed:  () async{
        try {
          Navigator.pop(context);
          await DatabaseService().staffSectionChange(uid:uid,section:'Restaurant',userEnabled: true);
        } catch (e) {
          print('e.toString()');
          print(e.toString());
        }
      },
    );
    Widget roomsButton = FlatButton(
      child: Text("Rooms"),
      onPressed:  () async{
        try {
          Navigator.pop(context);
          await DatabaseService().staffSectionChange(uid:uid,section:'Rooms',userEnabled: true);
        } catch (e) {
          print('e.toString()');
          print(e.toString());
        }
      },
    );
    Widget hallsButton = FlatButton(
      child: Text("Halls"),
      onPressed:  () async{
        try {
          Navigator.pop(context);
          await DatabaseService().staffSectionChange(uid:uid,section:'Halls',userEnabled: true);
        } catch (e) {
          print('e.toString()');
          print(e.toString());
        }
      },
    );
    Widget hotelButton = FlatButton(
      child: Text("Hotel"),
      onPressed:  () async{
        try {
          Navigator.pop(context);
          await DatabaseService().staffSectionChange(uid:uid,section:'Hotel',userEnabled: true);
        } catch (e) {
          print('e.toString()');
          print(e.toString());
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text("Respond to Notification"),
      title: Center(child: Text("Select Section")),
      actions: [
        Center(child: restaurantButton),
        Center(child: roomsButton),
        Center(child: hallsButton),
        Center(child: hotelButton),//Todo: delete button
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}