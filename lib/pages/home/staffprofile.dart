import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/send_notification_form.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class StaffProfile extends StatelessWidget {
  final String uid;

  StaffProfile({
   @required this.uid
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);


    void _showSendPanel(String senderID,String recID,){
      showDialog(context: context, builder: (context){
        return Center(
          child: Container(
            height: 450.0,
            padding: EdgeInsets.all(30.0),
            child:SendNotificationForm(senderID:senderID ,recID:recID ,),
          ),
        );
      });
    }
    return ReusableScreen(
      appBarTitle: 'Staff Profile', 
      propic: 'dummypropic.png',
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : <Widget>[
        StreamBuilder<UserData>(
          stream: DatabaseService(uid: this.uid).userData,
          builder: (context, snapshot) {
            if(snapshot.hasData){

              UserData userData = snapshot.data;
              String uid = this.uid;
              String status;
              Color c;
              if(userData.activeStatus){
                status = 'Active';
                c = Colors.green;
              }else{
                status = 'Inactive';
                c = Colors.red;
              }
              String name = userData.name;
              String jobTitle = userData.jobTitle;
              String email = userData.email;
              String section = userData.section;
              String mobileNo = userData.mobileNo;
              return Container(
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
                            onPressed: ()=>_showSendPanel(user.uid,userData.uid,),
                            icon: Icon(Icons.message,color: Colors.green,),
                            label: Text('Send Message'),
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
              );
            }else{
              print ('loading staff profile');
              return Loading();
            }
          }
        ),
      ], 
      )
    );
  }
}