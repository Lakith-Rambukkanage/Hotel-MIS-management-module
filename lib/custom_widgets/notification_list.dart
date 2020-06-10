import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/notificationCard.dart';
import 'package:flutter_learn/models/notification.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    final notificationList = Provider.of<List<NotificationModel>>(context);
    final user = Provider.of<User>(context);
    if (notificationList!=null && user!=null) {
      List<NotificationModel> validList = notificationList.where((n)=>(n.recID==user.uid)).toList();
      List<NotificationModel> recList = validList.where((n)=>(!n.read)).toList();
      recList.sort((n1,n2)=>(n2.sentDate.compareTo(n1.sentDate)));
      if (recList.isNotEmpty){return Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: recList.length,
                itemBuilder: (context, index) {
                    return NotificationCard(notification: recList[index]);
                },
              ),
            ),
          ],
        ),
      );
      }else{
        return Card(
          child: ListTile(
            subtitle: Text('No Received Messages From Staff'),
          ),
        );
      }
    }else{
      print('Loading - Received Notification list');
      return Loading();
    }
  }
}


class NotificationListSent extends StatefulWidget {
  @override
  _NotificationListSentState createState() => _NotificationListSentState();
}

class _NotificationListSentState extends State<NotificationListSent> {
  @override
  Widget build(BuildContext context) {
    final notificationList = Provider.of<List<NotificationModel>>(context);
    final user = Provider.of<User>(context);
    if (notificationList!=null && user!=null) {
      List<NotificationModel> sentList = notificationList.where((n)=>(n.senderID==user.uid)).toList();
      sentList.sort((n1,n2)=>(n2.sentDate.compareTo(n1.sentDate)));
      if (sentList.isNotEmpty){return Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: sentList.length,
                itemBuilder: (context, index) {
                    return NotificationCardSent(notification: sentList[index]);
                },
              ),
            ),
          ],
        ),
      );
      }else{
        return Card(
          child: ListTile(
            subtitle: Text('No Sent Messages'),
          ),
        );
      }
    }else{
      print('Loading - Sent Notification list');
      return Loading();
    }
  }
}


class NotificationListSection extends StatefulWidget {
  @override
  _NotificationListSectionState createState() => _NotificationListSectionState();
}

class _NotificationListSectionState extends State<NotificationListSection> {
  @override
  Widget build(BuildContext context) {
    final notificationList = Provider.of<List<NotificationModel>>(context);
    //final user = Provider.of<User>(context);
    if (notificationList!=null ) {
      List<NotificationModel> sectionList = notificationList.where((n)=>(n.senderID=='section')).toList();
      sectionList.sort((n1,n2)=>(n2.sentDate.compareTo(n1.sentDate)));
      if (sectionList.isNotEmpty){return Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: sectionList.length,
                itemBuilder: (context, index) {
                    return NotificationCardSection(notification: sectionList[index]);
                },
              ),
            ),
          ],
        ),
      );
      }else{
        return Card(
          child: ListTile(
            subtitle: Text('No Notifications From Sections'),
          ),
        );
      }
    }else{
      print('Loading -Section Notification list');
      return Loading();
    }
  }
}


