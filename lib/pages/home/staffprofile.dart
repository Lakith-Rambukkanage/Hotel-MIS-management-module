import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/staff.dart';

class StaffProfile extends StatelessWidget {
  final Staff staffMember;

  StaffProfile({
   @required this.staffMember
  });

  @override
  Widget build(BuildContext context) {
    String name = this.staffMember.name;
    String jobTitle = this.staffMember.jobTitle;
    bool activeStatus = this.staffMember.activeStatus;
    String status;
    Color c;
    if(activeStatus){
      status = 'Active';
      c = Colors.green;
    }else{
      status = 'Inactive';
      c = Colors.red;
    }
    String email = this.staffMember.email;
    String section = this.staffMember.section;
    String mobileNo = this.staffMember.mobileNo;
    return ReusableScreen(
      appBarTitle: 'Staff Profile', 
      propic: 'dummypropic.png',
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : <Widget>[
        Container(
                  margin: EdgeInsets.all(1.0),
                  width: 450.0,
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.9),borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(backgroundImage: AssetImage('assets/dummypropic.png'),radius: 40.0,),
                            Text(name, style: TextStyle(color: Colors.black, fontSize: 25.0)),
                            Text(jobTitle, style: TextStyle(color: Colors.cyan, fontSize: 20.0)),
                            Container(margin: EdgeInsets.all(10.0), color: Colors.grey[500], height: 2.0,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Status : $status', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 35.0,vertical:0.0 ),
                                    child: Icon(Icons.radio_button_checked,color: c,),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Assigned section :', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                                  FlatButton(onPressed: (){}, child: Text('$section'),textColor: Colors.blue,)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(margin: EdgeInsets.all(10.0), color: Colors.grey[500], height: 2.0,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('E-mail : $email', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Mobile No. : $mobileNo', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                        ),
                        Container(margin: EdgeInsets.all(10.0), color: Colors.grey[500], height: 2.0,),
                        Row(
                          children: <Widget>[
                            FlatButton.icon(
                              onPressed: (){}, 
                              icon: Icon(Icons.message,color: Colors.green,), 
                              label: Text('Send Instruction'),
                            ),
                            FlatButton.icon(
                              onPressed: (){}, 
                              icon: Icon(Icons.block,color: Colors.red,),
                              label: Text('Disable'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
      ], 
      )
    );
  }
}