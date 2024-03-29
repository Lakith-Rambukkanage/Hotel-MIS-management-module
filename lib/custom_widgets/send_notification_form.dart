import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:provider/provider.dart';


class SendNotificationForm extends StatefulWidget {

  final String senderID;
  final String recID;

  const SendNotificationForm({Key key, this.senderID, this.recID}) : super(key: key);
  @override
  _SendNotificationFormState createState() => _SendNotificationFormState();
}

class _SendNotificationFormState extends State<SendNotificationForm> {

  final _formKey = GlobalKey<FormState>();
  String _message ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: Container(
                margin: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10.0,),
                        Center(child: Text('Send Message',style: TextStyle(fontSize: 20.0),)),
                        SizedBox(height: 15.0,),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          validator: (val) => val.isEmpty ? 'Enter Your Message' : null,
                          onChanged: (val) {
                            setState(() => _message = val);
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Message',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Center(
                          child: RaisedButton(
                              child: Text(
                                'Send',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.cyan,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  Navigator.pop(context);
                                  await DatabaseService().sendNotification(_message, widget.senderID, widget.recID);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}


class SendBroadcastForm extends StatefulWidget {
  @override
  _SendBroadcastFormState createState() => _SendBroadcastFormState();
}

class _SendBroadcastFormState extends State<SendBroadcastForm> {

  final _formKey = GlobalKey<FormState>();
  String _message ;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    String _senderName = (userData!=null)?'Broadcast - ${userData.name}':'Broadcast';
    return Scaffold(
              body: Container(
                margin: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10.0,),
                        Center(child: Text('Send Broadcast',style: TextStyle(fontSize: 20.0),)),
                        SizedBox(height: 15.0,),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          validator: (val) => val.isEmpty ? 'Enter Your Message' : null,
                          onChanged: (val) {
                            setState(() => _message = val);
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Message',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Center(
                          child: RaisedButton(
                              child: Text(
                                'Send',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.cyan,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  Navigator.pop(context);
                                  await DatabaseService().sectionNotification(_message,_senderName);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}
