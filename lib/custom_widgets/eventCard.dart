import 'package:flutter/material.dart';
import 'package:flutter_learn/models/event.dart';
import 'package:flutter_learn/pages/home/viewevent.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String slot = '';
    switch (event.timeSlot) {
      case 0:
        slot = 'Morning';
        break;
      case 1:
        slot = 'Afternoon';
        break;
      case 2:
        slot = 'Evening';
        break;
      case 3:
        slot = 'Night';
        break;
      default:
        slot = 'Morning';
    }
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(10.0),
            title: Text('${event.eventName}'),
            subtitle:Text('${event.hall} - $slot'),
            trailing: Icon(Icons.send,color: Colors.cyan,),
            onTap: () {
              //print('${event.toString().split('_')[1]??''} tapped!');
              Navigator.push(context,new MaterialPageRoute(
                  builder: (context)=>
                  new ViewEvent(docid:event.docid))
              );
            },
          ),
        ],
      ),
    );
  }
}
