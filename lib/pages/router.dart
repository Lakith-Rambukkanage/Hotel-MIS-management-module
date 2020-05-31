import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/home/calendar_and_events.dart';
import 'package:flutter_learn/pages/home/home.dart';


class Router extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {

  String currentRoute = 'Home';
  void routeToView(String newRoute) {
    setState(() {
      currentRoute = newRoute;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (currentRoute){
      case 'Home':
        return Home();
        break;
      case 'Calendar':
        return Calendar();
        break;
    }
  }
}
