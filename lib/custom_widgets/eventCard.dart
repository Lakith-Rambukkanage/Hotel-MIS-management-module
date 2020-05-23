import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/calendaricon.dart';
import 'package:flutter_learn/pages/home/checkevent.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(10.0),
            onTap: (){
              Navigator.push(context,new MaterialPageRoute(
                  builder: (context)=>
                  new CheckEvent())
              );
            },
            leading: CalendarIcon(
                month : 5,
                date :'10'
            ),
            title: Text('Event name'),
            subtitle:Text('Event Details'),
          ),
        ],
      ),
    );
  }
}
