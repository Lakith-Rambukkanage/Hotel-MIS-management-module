import 'package:flutter/material.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final _formKey = GlobalKey<FormState>();
  String _currentName ;
  String _currentMobileNo ;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData){
            return Scaffold(
              body: Container(
                margin: EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0,),
                        Text('Edit Profile Details',style: TextStyle(fontSize: 20.0),),
                        SizedBox(height: 10.0,),
                        TextFormField(
                          initialValue: _currentName?? snapshot.data.name,
                          validator: (val) => val.isEmpty ? 'Enter Your Name' : null,
                          onChanged: (val) {
                            setState(() => _currentName = val);
                            print(_currentName);
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        TextFormField(
                          initialValue: _currentMobileNo??snapshot.data.mobileNo,
                          validator: (val) =>
                              val.length != 10 ? 'Enter valid Mobile No' : null,
                          onChanged: (val) {
                            setState(() => _currentMobileNo = val);
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Mobile No',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RaisedButton(
                            child: Text(
                              'Update',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.cyan,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                print(_currentName);
                                await DatabaseService(uid: user.uid).editUserData(
                                    username: _currentName ?? snapshot.data.name,
                                    mobileNo: _currentMobileNo ?? snapshot.data.mobileNo);
                              }
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }else{
          return Loading();
        }
        });
  }
}