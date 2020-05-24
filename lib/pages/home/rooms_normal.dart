import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/capacitygraph.dart';
import 'package:flutter_learn/custom_widgets/normal_rooms_list.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/seaside_rooms_list.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:provider/provider.dart';

class RoomsNormal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ReusableScreen(
        appBarTitle: 'Normal Rooms',
        propic: 'dummypropic.png',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children : <Widget>[
            Container(
              margin: EdgeInsets.all(1.0),
              width: 450.0,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.9),borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Normal Rooms', style: TextStyle(color: Colors.grey[900], fontSize: 25.0)),
                        StreamProvider<List<RoomDetail>>.value(
                          value: DatabaseService().roomDetailList,
                          child:  Container(
                            //color: Colors.white.withOpacity(0.5),
                            height: 520.0,
                            child: Column(
                              children: <Widget>[
                                NormalRoomsList(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}