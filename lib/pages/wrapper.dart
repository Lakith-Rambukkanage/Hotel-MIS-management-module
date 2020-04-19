import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/authenticate/authenticate.dart';
import 'package:flutter_learn/pages/home/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //return home or authenticate
    //return Home();
    return Authenticate();
  }
}