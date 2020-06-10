import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/notification_list.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/notification.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:provider/provider.dart';
class NotificationPanel extends StatefulWidget {
  @override
  _NotificationPanelState createState() => _NotificationPanelState();
}

class _NotificationPanelState extends State<NotificationPanel> {
  bool _sectionFocused = false;
  bool _recFocused = false;
  bool _sentFocused = false;
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
                  onTap: (){
                    setState(() {
                      _sectionFocused = !_sectionFocused;
                      _recFocused = false;
                      _sentFocused = false;
                    });
                  },
                  trailing: Icon(Icons.business),
                  title: Text('Sections Alerts'),
                ),
              ),
              Container(
                  height: _sectionFocused?400.0:200.0,
                  child: NotificationListSection()
              ),
              SizedBox(height: 8.0,),
              Card(
                child: ListTile(
                  onTap: (){
                    setState(() {
                      _recFocused = !_recFocused;
                      _sectionFocused = false;
                      _sentFocused = false;
                    });
                  },
                  trailing: Icon(Icons.call_received),
                  title: Text('Received'),
                ),
              ),
              Container(
                  height: _recFocused?400.0:200.0,
                  child: NotificationList()
              ),
              SizedBox(height: 8.0,),
              Card(
                child: ListTile(
                  onTap: (){
                    setState(() {
                      _sentFocused = !_sentFocused;
                      _recFocused = false;
                      _sectionFocused = false;
                    });
                  },
                  trailing: Icon(Icons.send),
                  title: Text('Sent'),
                ),
              ),
              Container(
                  height: _sentFocused?400.0:200.0,
                  child: NotificationListSent()
              ),
            ],
          ),
        )
    );
  }
}
