import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/seaside_rooms_list.dart';
import 'package:flutter_learn/custom_widgets/seaside_rooms_panel.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:provider/provider.dart';

class RoomsSeaside extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ReusableScreen(
        appBarTitle: 'Seaside Rooms',
        propic: 'dummypropic.png',
        child: StreamProvider<List<RoomDetail>>.value(
          value: DatabaseService().roomDetailList,
          child:  Container(
            //color: Colors.white.withOpacity(0.5),
            height: 450.0,
            child: Column(
            children: <Widget>[
              SeasideRoomsPanel(),
              SeasideRoomsList(),
            ],
          ),
          ),
        ));
  }
}