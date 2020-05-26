import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/roomcard.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class SeasideRoomsList extends StatefulWidget {
  @override
  _SeasideRoomsListState createState() => _SeasideRoomsListState();
}

class _SeasideRoomsListState extends State<SeasideRoomsList> {
  @override
  Widget build(BuildContext context) {
    final roomList = Provider.of<List<RoomDetail>>(context);
    //print(roomList);
    if (roomList!=null) {
      return Expanded(
        child: ListView.builder(
          itemCount: roomList.length,
          itemBuilder: (context, index) {
            if (roomList[index].type=='Sea-View') {
              return RoomCard(room: roomList[index]);
            }else{
              return Container();
            }
          },
        ),
      );
    }else{
      print('Loading - seaside room list');
      return Loading();
    }
  }
}
