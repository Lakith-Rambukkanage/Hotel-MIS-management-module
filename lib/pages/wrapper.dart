import 'package:flutter/material.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/authenticate/authenticate.dart';
import 'package:flutter_learn/pages/home/home.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print('printing user from provider ie. listening for changes');
    print(user);
    //return home or authenticate
    //return Home();
//    final AuthService _auth = AuthService();
//    _auth.signOut();
    if (user==null) {
      print('logged out');
      return Authenticate();
    }
    else{
      print('Retrieving Staff user for auth uid before logging in');
      return StreamProvider<UserData>.value(
        value: DatabaseService(uid: user.uid??'').userData,
        child: WrapperStaffCheck()
      );
    }
  }
}

class WrapperStaffCheck extends StatefulWidget {
  @override
  _WrapperStaffCheckState createState() => _WrapperStaffCheckState();
}

class _WrapperStaffCheckState extends State<WrapperStaffCheck> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    if (userData!=null){
      if (userData.userEnabled){
      return Home();
      }else if(userData.name==''){
        return Landing();
      }else{
        return LandingDisabled();
      }
    }else{
      return LoadingScreen();
    }
  }
}
