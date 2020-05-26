import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/roomcard.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';


class NormalRoomsList extends StatefulWidget {
  @override
  _NormalRoomsListState createState() => _NormalRoomsListState();
}

class _NormalRoomsListState extends State<NormalRoomsList> {
  @override
  Widget build(BuildContext context) {
    final roomList = Provider.of<List<RoomDetail>>(context);
    //print(roomList);
    if (roomList!=null) {
      return Expanded(
        child: ListView.builder(
          itemCount: roomList.length,
          itemBuilder: (context, index) {
            if (roomList[index].type=='Normal') {
              return RoomCard(room: roomList[index]);
            }else{
              return Container();
            }
          },
        ),
      );
    }else{
      print('Loading - normal room list');
      return Loading();
    }
  }
}
