import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/events_list.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/event.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_learn/services/database.dart';

import 'event_shedule.dart';
class ViewHalls extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDateToday = formatter.format(today);
    String formattedDateYesterday = formatter.format(today.subtract(Duration(days: 1)));
    String formattedDateTomrrow = formatter.format(today.add(Duration(days: 1)));
    return ReusableScreen(
        appBarTitle: 'Halls',
        propic: 'dummypropic.png',
        child:
        StreamProvider<List<EventModel>>.value(
          value: DatabaseService().getUpcomingEventsList(),
          child:  Container(
            //color: Colors.white.withOpacity(0.5),
            height: 600.0,child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  trailing:FlatButton.icon(
                    onPressed:  (){
                      Navigator.push(context,new MaterialPageRoute(
                          builder: (context)=>
                          new SheduleEvent())
                      );
                    },
                    icon: Icon(Icons.event,color: Colors.green,),
                    label: Text('Schedule Event +'),),
                  title: Text('Halls'),
                ),
              ),
              Card(
                color: Colors.grey[300],
                child: ListTile(
                  title: Text('Today'),
                  trailing: Text('$formattedDateToday'),
                ),
              ),
              EventsList(),
              Card(
                color: Colors.grey[300],
                child: ListTile(
                  title: Text('Upcoming'),
                  trailing: Text('$formattedDateTomrrow'),
                ),
              ),
              EventsListUpcoming(),
              Card(
                color: Colors.grey[300],
                child: ListTile(
                  title: Text('Recent'),
                  trailing: Text('$formattedDateYesterday'),
                ),
              ),
              EventsListRecent(),
            ],
          ),
          ),
        )
    );
  }
}