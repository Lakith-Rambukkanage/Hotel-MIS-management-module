import 'package:flutter/material.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';
 class NormalRoomsPanel extends StatefulWidget {
   @override
   _NormalRoomsPanelState createState() => _NormalRoomsPanelState();
 }

 class _NormalRoomsPanelState extends State<NormalRoomsPanel> {
   int _bookedCount = 0;
   int _availableCount = 0;

   @override
   Widget build(BuildContext context) {
     final roomsList = Provider.of<List<RoomDetail>>(context);
     if (roomsList!=null) {
       _bookedCount = roomsList.where((o)=>(o.booked&&o.type=='Normal')).toList().length??0;
       _availableCount = roomsList.where((o)=>(!o.booked&&o.type=='Normal')).toList().length??0;

       return Card(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                   children: <Widget>[
                     Icon(Icons.airline_seat_individual_suite,color: Colors.cyan,size: 35.0,),
                     Text('$_bookedCount',style: TextStyle(fontSize: 20.0),),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                   children: <Widget>[
                     Icon(Icons.query_builder,color: Colors.amber,size: 35.0,),
                     Text('$_availableCount',style: TextStyle(fontSize: 20.0),),
                   ],
                 ),
               ),
             ],
           ),
         ),
       );
     }else{
       print('Loading - Order list');
       return Loading();
     }
   }
 }
