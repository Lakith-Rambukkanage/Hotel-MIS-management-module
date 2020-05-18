import 'package:flutter/material.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/authenticate/authenticate.dart';
import 'package:flutter_learn/pages/home/home.dart';
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
    if (user==null) {
      print('logged out');
      return Authenticate();
    }
    else{
      print('logged in');
      return Home();
    }
  }
}