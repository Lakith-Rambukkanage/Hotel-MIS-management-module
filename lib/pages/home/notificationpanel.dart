import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/notification_list.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/notification.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:provider/provider.dart';

class NotificationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      propic: 'dummypropic.png',
      appBarTitle: 'Notifications',
        child: StreamProvider<List<NotificationModel>>.value(
          value: DatabaseService().notificationList(),
          child:  Column(
          children: <Widget>[
            Card(
              child: ListTile(
                trailing: Icon(Icons.call_received),
                title: Text('Received'),
              ),
            ),
            NotificationList(),
            SizedBox(height: 8.0,),
            Card(
              child: ListTile(
                trailing: Icon(Icons.business),
                title: Text('Sections Alerts'),
              ),
            ),
            NotificationListSection(),
            Card(
              child: ListTile(
                trailing: Icon(Icons.send),
                title: Text('Sent'),
              ),
            ),
            NotificationListSent(),
          ],
          ),
        )
    );
  }
}