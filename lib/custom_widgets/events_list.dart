import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/eventCard.dart';
import 'package:flutter_learn/models/event.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class EventsList extends StatefulWidget {
  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    DateTime temp = DateTime.now();
    DateTime today = new DateTime(temp.year,temp.month,temp.day)??DateTime.now();
    final eventsList = Provider.of<List<EventModel>>(context);
    if (eventsList!=null) {
      List<EventModel> filter = eventsList.where((e)=>(e.eventDate==today)).toList();
      if(filter.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            itemCount: filter.length,
            itemBuilder: (context, index) {
              return EventCard(event: filter[index]);
            },
          ),
        );
      }else{
        return Card(
          child: ListTile(
            title: Text('No Events to show'),
          ),
        );
      }
    }else{
      print('Loading - Order list');
      return Loading();
    }
  }
}




class EventsListUpcoming extends StatefulWidget {
  @override
  _EventsListUpcomingState createState() => _EventsListUpcomingState();
}

class _EventsListUpcomingState extends State<EventsListUpcoming> {
  @override
  Widget build(BuildContext context) {
    DateTime temp = DateTime.now().add(Duration(days: 1));
    DateTime today = new DateTime(temp.year,temp.month,temp.day)??DateTime.now();
    final eventsList = Provider.of<List<EventModel>>(context);
    if (eventsList!=null) {
      List<EventModel> filter = eventsList.where((e)=>(e.eventDate==today)).toList();
      if (filter.isNotEmpty) {
        return Expanded(
        child: ListView.builder(
          itemCount: filter.length,
          itemBuilder: (context, index) {
            return EventCard(event: filter[index]);
          },
        ),
      );
      }else{
        return Card(
          child: ListTile(
            title: Text('No Events to show'),
          ),
        );
      }
    }else{
      print('Loading - Order list');
      return Loading();
    }
  }
}





class EventsListRecent extends StatefulWidget {
  @override
  _EventsListRecentState createState() => _EventsListRecentState();
}

class _EventsListRecentState extends State<EventsListRecent> {
  @override
  Widget build(BuildContext context) {
    DateTime temp = DateTime.now().subtract(Duration(days: 1));
    DateTime today = new DateTime(temp.year,temp.month,temp.day)??DateTime.now();
    final eventsList = Provider.of<List<EventModel>>(context);
    if (eventsList!=null) {
      List<EventModel> filter = eventsList.where((e)=>(e.eventDate==today)).toList();
      if (filter.isNotEmpty) {
        return Expanded(
        child: ListView.builder(
          itemCount: filter.length,
          itemBuilder: (context, index) {
            return EventCard(event: filter[index]);
          },
        ),
      );
    }else{
      return Card(
        child: ListTile(
          title: Text('No Events to show'),
        ),
      );
    }
    }else{
      print('Loading - Order list');
      return Loading();
    }
  }
}
