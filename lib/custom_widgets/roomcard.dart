import 'package:flutter/material.dart';
import 'package:flutter_learn/models/room.dart';

class RoomCard extends StatelessWidget {

  final RoomDetail room;


  RoomCard({
    @required this.room,
  });



  @override
  Widget build(BuildContext context) {
    String bed = this.room.bed;
    String booked_till = this.room.booked_till??'not booked';
    bool booked  = this.room.booked;
    String docid = this.room.docid;
    int bedid = this.room.bedid;
    Color stat;
    IconData icon;

    switch (booked) {
      case true:
        stat = Colors.cyan;
        icon = Icons.airline_seat_individual_suite;
        break;
      case false:
        stat = Colors.white;
        icon = Icons.hourglass_empty;
        break;
      default:
        stat = Colors.amber;
        icon = Icons.hourglass_empty;
    }
    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon,color: stat,),
        title: Text(bed),
        subtitle: Text ('Booked till : $booked_till'),
      ),
    );
  }
}