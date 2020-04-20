import 'package:flutter/material.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/authenticate/loading.dart';
import 'package:flutter_learn/pages/authenticate/login.dart';
import 'package:flutter_learn/pages/authenticate/test.dart';
import 'package:flutter_learn/pages/home/calendar.dart';
import 'package:flutter_learn/pages/home/home.dart';
import 'package:flutter_learn/pages/home/management.dart';
import 'package:flutter_learn/pages/home/restaurant.dart';
import 'package:flutter_learn/pages/home/section.dart';
import 'package:flutter_learn/pages/home/staff.dart';
import 'package:flutter_learn/pages/wrapper.dart';
import 'package:flutter_learn/services/auth.dart';
import 'package:provider/provider.dart';


void main() => runApp(RootApp());

class RootApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return StreamProvider<User>.value(

        value: AuthService().user,
        child:   MaterialApp(
      
        home: Wrapper(),
        // initialRoute: '/home',

        routes: {
          //'/' : (context) => Loading(),
          '/home' : (context) => Home(),
          '/loading' : (context) => Loading(),
          '/login' : (context) => Login(),
          '/sections' : (context) => Section(),
          '/staff' : (context) => Staff(),
          '/calendar' : (context) => Calendar(),
          '/restaurant' : (context) => Restaurant(),
          '/staff/management' : (context) => Management(),
          '/test' : (context) => Test(),
          //'/home' : (context) => Home(),
          //front end done : Loading, Login, 
          //add section, staff, event, calendar, profile, settings, notification etc.
        },
      ),
    );
  }

}