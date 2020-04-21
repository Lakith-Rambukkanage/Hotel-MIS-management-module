import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/authenticate/signin.dart';
import 'package:flutter_learn/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    //authservice instance
    final AuthService _authService = AuthService();

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
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 60.0,),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0,),
                  Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/pearl_logo.png'),
                          //radius: 200.0,
                          backgroundColor: Colors.transparent,
                          maxRadius: 60.0,
                          minRadius: 50.0,
                        ),
                  ),
              Text('Register as an Employee', style: TextStyle(color: Colors.white,fontSize: 20.0),),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30.0),
                child: Form(
                    child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val){
                          setState( () => email = val );
                          //print(email);
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        onChanged: (val){
                          setState( () => email = val );
                          //print(email);
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Last Name',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        onChanged: (val){
                          setState( () => email = val );
                          //print(email);
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      DropdownButtonFormField(
                        isDense: true,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Job title',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                        onChanged: (value) {}, 
                        items: <String>['Assistant Manager', 'Head Chef', 'Waiter', 'Chef'].map<DropdownMenuItem<String>>((String value) {return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),);}).toList(),
                        ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        onChanged: (val){
                          setState( () => email = val );
                          //print(email);
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        onChanged: (val){
                          setState( () => password = val);
                          //print(password);
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      RaisedButton(
                        child: Text('Register', style: TextStyle(color: Colors.white),),
                        color: Colors.cyan.withOpacity(0.7),
                        onPressed: () async {
                          print ('sign in clicked');
                          // print(email);
                          // print(password);
                          //dynamic result = await _authService.signInAnon();
                        }
                        ),
                    ],
                  ),
                ),
              ),
              FlatButton(onPressed: () {
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new SignIn())
                    );
              }, 
              child:Text('Already Have an Account?', 
              style: TextStyle(color: Colors.grey[200],),
              ),
              )
            ],
          ),
        ),
        ),
      );
  }
}