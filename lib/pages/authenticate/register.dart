import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/services/auth.dart';
import 'package:flutter_learn/shared/validators.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final List<String> jobTitleList = ['Senior Manager','Assistant Manager'];

  String name = '';
  String email = '';
  String mobileNo = '';
  String jobTitle ;
  String password = '';
  //String confirmpassword = '';

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
          height: double.infinity,
          width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 60.0,),
                SizedBox(width: 20.0,),
                Center(
                      child: Text('Register',style: TextStyle(color: Colors.white, fontSize: 30.0),),
                ),
                SizedBox(height: 30.0,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 30.0),
                  child: Form(
                      key: _formkey,
                      child: Column(
                      children: <Widget>[
                        TextFormField(
                          key: Key('name'),
                          validator: NameFieldValidator.validate,
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
                          key: Key('email'),
                          validator: EmailFieldValidator.validate,
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
                        TextFormField(
                            key: Key('contact'),
                            //controller: _controller,
                            onChanged:(val){
                              setState( () => mobileNo = val );
                            },
                            validator: ContactFieldValidator.validate,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Contact No',
                              labelStyle: TextStyle(color: Colors.grey,),
                            )
                        ),
                        SizedBox(height: 10.0,),
                        DropdownButtonFormField(
                          key: Key('jobTitle'),
                          value: jobTitle,
                          validator: (val) =>val==null? 'Enter Your Job Title':null,
                          isDense: true,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Job title',
                            labelStyle: TextStyle(color: Colors.grey,),
                          ),
                          items: jobTitleList.map((title){
                            return DropdownMenuItem(
                              value: title,
                              child: Text(title),
                            );
                          }).toList(),
                          onChanged: (value) {
                            print(value);
                            setState(()=> jobTitle=value );
                          },
                        ),
                        SizedBox(height: 10.0,),
                        TextFormField(
                          key: Key('password'),
                          validator: PasswordFieldValidator.validate,
                          onChanged: (val){
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
                          key: Key('register-button'),
                          child: Text('Register', style: TextStyle(color: Colors.white),),
                          color: Colors.cyan.withOpacity(0.7),
                          onPressed: () async {
                            print ('register clicked');
                            if (_formkey.currentState.validate()){
                              dynamic result = await _authService.registerNewUser(email,mobileNo, password,name,jobTitle);
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
                FlatButton(
                  key: Key('toggle'),
                  onPressed: () {
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
        ),
      );
  }
}