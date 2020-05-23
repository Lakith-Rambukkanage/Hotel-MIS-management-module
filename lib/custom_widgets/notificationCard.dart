import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    String senderName = 'Sender';
    String notificationContext = 'Context of the notification';
    Icon sectionicon = Icon(Icons.account_balance);//TODO :change icon for section of the sender

    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: sectionicon,
              title: Text('$senderName'),
              subtitle: Text('$notificationContext'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Reply'),
                  onPressed: () {},//TODO: on pressed bottom sheet to send the reply
                ),
                FlatButton(
                  child: const Text('Mark as Read'),
                  onPressed: () {},//change status to read
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
