import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        resizeToAvoidBottomPadding: false,
        body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pearl_logo.png'),
                //radius: 200.0,
                backgroundColor: Colors.transparent,
                maxRadius: 100.0,
                minRadius: 90.0,
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(100.0) ) ,
              width: 300.0,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.grey,),
                ),
              ),
            ),
            Divider(height: 10.0,),
            Container(
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(100.0) ) ,
              width: 300.0,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey,),
                ),
              ),
            ),
            Divider(height: 15.0,),
            RaisedButton(
              child: Text('Login', style: TextStyle(color: Colors.white),),
              color: Colors.cyan.withOpacity(0.7),
              onPressed: () {}
              ),
            Divider(height: 20.0,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(onPressed: () {}, 
                  child:Text('        Sign Up       ', 
                  style: TextStyle(color: Colors.grey[200],),
                  ),
                  ),
                  Text('|', style: TextStyle(color: Colors.grey[200], ),),
                  FlatButton(onPressed: () {}, 
                  child:Text('Forgot Password', 
                  style: TextStyle(color: Colors.grey[200],),
                  ),
                  ),
                ],
              )
          ],
        ),
        ),
      );
  }
}