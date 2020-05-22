import 'package:flutter/material.dart';
import 'package:flutter_learn/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //text field state
  String email = '';
  String password = '';

  //error
  String error = '';

  //form key
  final _formkey = GlobalKey<FormState>();
  
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
              padding: EdgeInsets.all(30.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) =>val.isEmpty? 'Enter Your Email':null,
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
                    TextFormField(
                      validator: (val) =>val.isEmpty? 'Enter Your Password':null,
                      onChanged: (val){
                        setState( () => password = val);
                        //print(password);
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
                    SizedBox(height: 15.0,),
                    RaisedButton(
                      child: Text('Login', style: TextStyle(color: Colors.white),),
                      color: Colors.cyan.withOpacity(0.7),
                      onPressed: () async {
                        print ('sign in clicked');
                        if (_formkey.currentState.validate()){
                          print(email);
                          print(password);
                          dynamic result = await _authService.signInWithEmailAndPassword(email, password);
                          if (result==null){
                            setState(() {error = 'Please Enter Valid Details and Check Connectivity';});
                          }
                        }
                      }
                      ),
                    SizedBox(height: 5.0,),
                    Text(error,textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(onPressed: () {
                  widget.toggleView();
                }, 
                child:Text('        Register       ', 
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