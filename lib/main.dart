import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/calendar.dart';
import 'package:flutter_learn/pages/management.dart';
import 'package:flutter_learn/pages/restaurant.dart';
import 'package:flutter_learn/pages/section.dart';
import 'package:flutter_learn/pages/staff.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/login.dart';
import 'pages/test.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  initialRoute: '/home',
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
));