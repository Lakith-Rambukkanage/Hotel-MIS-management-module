import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/section.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/login.dart';
import 'pages/test.dart';

void main() => runApp(MaterialApp(
  //home: Home(),
  home: Section(),
  routes: {
    //'/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/loading' : (context) => Loading(),
    '/login' : (context) => Login(),
    //'/home' : (context) => Home(),
    //front end done : Loading, Login, 
    //add section, staff, event, calendar, profile, settings, notification etc.
  },
));