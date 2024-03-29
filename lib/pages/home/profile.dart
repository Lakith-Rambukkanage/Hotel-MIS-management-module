import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/edit_profile_form.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _showEditPanel(){
      showDialog(context: context, builder: (context){
        return Center(
          child: Container(
            height: 400.0,
            //padding: EdgeInsets.all(30.0),
            child:EditProfile(),
          ),
        );
      });
    }

    final user = Provider.of<UserData>(context);
    if (user!=null){
      String username = user.name??'';
      String jobtitle = user.jobTitle??'';
      bool activeStatus = user.activeStatus??false;
      String email = user.email??'';
      String section = user.section??'';
      String mobileNo = user.mobileNo??'';
    return ReusableScreen(
          appBarTitle: 'My Profile',
          propic: 'dummypropic.png',
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children :<Widget>[
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
                                Text(username, style: TextStyle(color: Colors.black, fontSize: 25.0)),
                                Text(jobtitle, style: TextStyle(color: Colors.cyan, fontSize: 20.0)),
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
                                      Text('Status :', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                                      Switch(
                                        value: activeStatus,
                                        onChanged: (value) async{
                                          await DatabaseService(uid: user.uid).updateUserActiveStatus(value);
                                        },
                                        activeTrackColor: Colors.green[400],
                                        activeColor: Colors.green,
                                      ),
                                    ],
                                  ),
                                  Text('Assigned section : $section', style: TextStyle(color: Colors.black, fontSize: 17.0)),
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
                              child: Text('Mobile No. :$mobileNo', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                            ),
                            Center(
                              child: FlatButton.icon(
                                onPressed: ()=>_showEditPanel(),
                                icon: Icon(Icons.edit,color: Colors.blue,),
                                label: Text('Edit details'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
          ],
          )
        );
    }else{
      return LoadingScreen();
    }
  }
}