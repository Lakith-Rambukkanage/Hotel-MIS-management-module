import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/roomcard.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:provider/provider.dart';

import 'capacitygraph.dart';

class SeasideRoomsList extends StatefulWidget {
  int bookedCount=0;
  int availableCount=0;
  @override
  _SeasideRoomsListState createState() => _SeasideRoomsListState();
}

class _SeasideRoomsListState extends State<SeasideRoomsList> {
  @override
  Widget build(BuildContext context) {
    final roomList = Provider.of<List<RoomDetail>>(context);
    if (roomList!=null) {
      roomList.forEach((r){
            if (r.booked && r.type=='Sea-View') {
              widget.bookedCount += 1;
            }
            else if(!r.booked && r.type=='Sea-View'){
              widget.availableCount += 1;
            }
          });
    }
    //print(roomList);
    if (roomList!=null) {
      return Container(
        height: 500.0,
        child: Column(
          children: <Widget>[
            Expanded(
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
            ),
            Container(margin: EdgeInsets.all(10.0), color: Colors.grey[500], height: 2.0,),
            CapacityGraph(white: widget.availableCount.isNaN?0:widget.availableCount, cyan: widget.bookedCount.isNaN?0:widget.bookedCount, whiteLabel: 'Available', cyanLabel: 'Booked', width: 350.0, height: 70,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Assigned to : ', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                      FlatButton(child: Text('Arthur Shelby', style: TextStyle(color: Colors.blue, fontSize: 17.0, fontStyle: FontStyle.italic)), onPressed: () {},),
                    ],
                  ),
                ],
              ),
            ),
            Container(margin: EdgeInsets.all(10.0), color: Colors.grey[500], height: 2.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.notifications,color: Colors.blue,),
                  label: Text('Instructions'),
                ),
                FlatButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.airline_seat_individual_suite, color: Colors.blue,),
                  label: Text('Room Prices'),
                  //TODO : functions availability according to user
                ),
              ],
            ),
          ],
        ),
      );
    }else{
      //TODO: Loading
      print('Loading - seaside room list');
      return Container(color: Colors.blue, height: 100.0,child: Text('Loading...'),);
    }
  }
}
