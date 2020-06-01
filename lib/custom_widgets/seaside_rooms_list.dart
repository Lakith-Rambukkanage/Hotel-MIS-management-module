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
    if (roomList!=null) {
      List<RoomDetail>filter =roomList.where((r)=>(r.type=='Sea-View')).toList();
      return Expanded(
        child: ListView.builder(
          itemCount: filter.length,
          itemBuilder: (context, index) {
              return RoomCard(room: filter[index]);
          },
        ),
      );
    }else{
      print('Loading - seaside room list');
      return Loading();
    }
  }
}
