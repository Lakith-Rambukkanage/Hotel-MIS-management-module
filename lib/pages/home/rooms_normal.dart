import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/normal_rooms_list.dart';
import 'package:flutter_learn/custom_widgets/normal_rooms_panel.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:provider/provider.dart';

class RoomsNormal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ReusableScreen(
        appBarTitle: 'Normal Rooms',
        propic: 'dummypropic.png',
        child: StreamProvider<List<RoomDetail>>.value(
          value: DatabaseService().roomDetailList,
          child:  Container(
            //color: Colors.white.withOpacity(0.5),
            height: 520.0,
            child: Column(
              children: <Widget>[
                NormalRoomsPanel(),
                NormalRoomsList(),
              ],
            ),
          ),
        ));
  }
}