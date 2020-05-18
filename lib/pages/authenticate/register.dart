import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/authenticate/signin.dart';
import 'package:flutter_learn/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //text field state TODO: change input fields
  String name = '';
  String email = '';
  String jobtitle = '';
  String password = '';
  String confirmpassword = '';

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
                          maxRadius: 50.0,
                          minRadius: 40.0,
                        ),
                  ),
              Text('Register as an Employee', style: TextStyle(color: Colors.white,fontSize: 20.0),),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30.0),
                child: Form(
                    key: _formkey,
                    child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val) =>val.isEmpty? 'Enter Your Name':null,
                        onChanged: (val){
                          setState( () => name = val );
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        validator: (val) => val.isEmpty? 'Enter Your Email':null,
                        onChanged: (val){
                          setState( () => email = val );
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
                        validator: (val) =>val==null? 'Enter Your Job Title':null,
                        isDense: true,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Job title',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                        onChanged: (value) {
                          print(value);
                          setState(()=> jobtitle=value );
                        },
                        items: <String>['Senior Manager','Assistant Manager', 'Head Chef']
                            .map<DropdownMenuItem<String>>((String value) {return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),);}).toList(),
                        ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        validator: (val) =>val.isEmpty? 'Enter a Password For Your Account':null,
                        onChanged: (val){
                          print(val);
                          setState( () => password = val );
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
                        child: Text('Register', style: TextStyle(color: Colors.white),),
                        color: Colors.cyan.withOpacity(0.7),
                        onPressed: () async {
                          print ('Register clicked');
                          if (_formkey.currentState.validate()){
                            dynamic result = await _authService.registerNewUser(email, password);
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
              FlatButton(onPressed: () {
                widget.toggleView();
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