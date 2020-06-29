import 'package:flutter/material.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/home/notificationpanel.dart';
import 'package:flutter_learn/pages/home/profile.dart';
import 'package:flutter_learn/services/auth.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_learn/services/database.dart';

class ReusableScreen extends StatelessWidget{

  final Widget child;
  final String appBarTitle;
  final String propic;

  ReusableScreen({
    @required this.child,
    @required this.appBarTitle,
    @required this.propic,
  });

  @override
  Widget build(BuildContext context) {

    //instance to access authservice
    final AuthService _auth = AuthService();
    //provider to access user
    final userData = Provider.of<UserData>(context);
    if (userData!=null){
      String username = userData.name??'';
      String jobtitle = userData.jobTitle??'';
      bool activestatus = userData.activeStatus??false;
    return Scaffold(
            appBar: AppBar(
                title: Text(appBarTitle),
                actions: <Widget>[
                  Switch(
                    value: activestatus,
                    onChanged: (value) async{
                      await DatabaseService(uid: userData.uid).updateUserActiveStatus(value);
                    },
                    activeTrackColor: Colors.green[400],
                    activeColor: Colors.green,
                  ),
                  IconButton(icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(context,new MaterialPageRoute(
                          builder: (context)=>
                          new NotificationPanel())
                      );
                    },),
                ],
                centerTitle: true,
                backgroundColor: Colors.grey[850]
            ),
            backgroundColor: Colors.grey[900],

            drawer: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: GestureDetector(
                      onTap: (){
                        //profile
                        Navigator.pop(context);
                        Navigator.push(context,new MaterialPageRoute(
                            builder: (context)=>
                            new Profile())
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/$propic'),
                              radius: 35.0,
                            ),
                          ),
                          Text('$username', style: TextStyle(color: Colors.white, fontSize: 18.0)),
                          Text('$jobtitle', style: TextStyle(color: Colors.cyan, fontSize: 18.0)),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                    ),
                  ),
                  ListTile(
                    title: Text('Home'),
                    trailing: Icon(Icons.home,color: Colors.cyan,),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                      Navigator.pushNamed(context,'/home');
                    },
                  ),
                  ListTile(
                    title: Text('Calendar & Events'),
                    trailing: Icon(Icons.calendar_today,color: Colors.cyan,),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                      Navigator.pushNamed(context,'/calendar');
                    },
                  ),
                  ListTile(
                    title: Text('Staff'),
                    trailing: Icon(Icons.people, color: Colors.cyan,),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                      Navigator.pushNamed(context,'/staff');
                    },
                  ),
                  ListTile(
                    title: Text('Sections'),
                    trailing: Icon(Icons.map, color: Colors.cyan,),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                      Navigator.pushNamed(context,'/sections');
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    subtitle: FlatButton.icon(
                        onPressed: ()async{
                          Navigator.pop(context);
                          Navigator.popUntil(context, ModalRoute.withName("/"));
                          await _auth.signOut();
                        },
                        icon: Icon(Icons.computer, color: Colors.cyan,),
                        label: Text('Log Out')),
                  ),
                ],
              ),
            ),

            body: Container(
              height: 800.0,
              width: 600.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background2.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: child,
                ),
              ),
            ),
          );
    }else{
      return LoadingScreen();
    }
  }

}