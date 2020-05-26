import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class EditRoomPackage extends StatefulWidget {
  final String docid;

  const EditRoomPackage({Key key, this.docid}) : super(key: key);
  @override
  _EditRoomPackageState createState() => _EditRoomPackageState();
}

class _EditRoomPackageState extends State<EditRoomPackage> {

  final _formKey = GlobalKey<FormState>();
  String _currentPriceB ;
  String _currentPriceH ;
  String _currentPriceF ;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RoomPackage>(
        stream: DatabaseService(docid: widget.docid).roomPackage,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            String type =snapshot.data.type;
            return Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text('Package : $type',style: TextStyle(fontSize: 17.0),),
                        TextFormField(
                          initialValue: _currentPriceB?? snapshot.data.price_b,
                          validator: (val) => val.isEmpty ? 'Enter a Valid Price' : null,
                          onChanged: (val) {
                            setState(() => _currentPriceB = val);
                            print(_currentPriceB);
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Breakfast Only',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        TextFormField(
                          initialValue: _currentPriceH?? snapshot.data.price_h,
                          validator: (val) => val.isEmpty ? 'Enter a Valid Price' : null,
                          onChanged: (val) {
                            setState(() => _currentPriceH = val);
                            print(_currentPriceH);
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Half Board',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        TextFormField(
                          initialValue: _currentPriceF?? snapshot.data.price_f,
                          validator: (val) => val.isEmpty ? 'Enter a Valid Price' : null,
                          onChanged: (val) {
                            setState(() => _currentPriceF = val);
                            print(_currentPriceF);
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Full Board',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),

                        RaisedButton(
                            child: Text(
                              'Update',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.cyan,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                              await DatabaseService(docid: widget.docid).updateRoomPackage(
                                price_b: _currentPriceB??snapshot.data.price_b,
                                price_h: _currentPriceH??snapshot.data.price_h,
                                price_f: _currentPriceF??snapshot.data.price_f,
                              );
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
