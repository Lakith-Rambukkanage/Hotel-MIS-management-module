import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/pearl_logo.png'),
              //radius: 200.0,
              backgroundColor: Colors.transparent,
              maxRadius: 210.0,
              minRadius: 200.0,
            ),
            Text('Loading...',style: TextStyle(color: Colors.grey,fontSize: 15.0),),
          ],
        ),
        ),
      );
  }
}