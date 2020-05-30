import 'package:flutter/material.dart';
import 'models/user.dart';
import 'pages/authenticate/loading.dart';
import 'pages/authenticate/login.dart';
import 'pages/home/calendar_and_events.dart';
import 'pages/home/home.dart';
import 'pages/home/management.dart';
import 'pages/home/viewsections.dart';
import 'pages/home/staff.dart';
import 'pages/wrapper.dart';
import 'services/auth.dart';
import 'package:provider/provider.dart';
import 'pages/home/viewrestaurant.dart';


void main() => runApp(RootApp());

class RootApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return Container(
          child: StreamProvider<User>.value(

          value: AuthService().user,
          child:   MaterialApp(
      
          home: Wrapper(),
          // initialRoute: '/home',

          routes: {
            //'/' : (context) => Loading(),
            '/home' : (context) => Home(),
            '/loading' : (context) => LoadingScreen(),
            '/login' : (context) => Login(),
            '/sections' : (context) => Sections(),
            '/staff' : (context) => ViewStaff(),
            '/calendar' : (context) => Calendar(),
            '/restaurant' : (context) => ViewRestaurant(),
            '/staff/management' : (context) => Management(),
            //'/home' : (context) => Home(),
            //front end done : Loading, Login, section, staff, calendar, profile,
            //add  event, settings, notification etc.
          },
      ),
    ),
        );
  }

}