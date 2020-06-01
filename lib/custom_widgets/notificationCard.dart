import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/send_notification_form.dart';
import 'package:flutter_learn/models/notification.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationCard extends StatefulWidget {
  final NotificationModel notification;

  const NotificationCard({Key key, this.notification}) : super(key: key);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {

  @override
  Widget build(BuildContext context) {
    NotificationModel notification = widget.notification;
    String senderName = notification.senderName;
    DateTime sentDate = notification.sentDate;
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(sentDate);
    String notificationContext = notification.body;
    Icon sectionIcon = Icon(Icons.perm_identity);//TODO :change icon for section of the sender

    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                subtitle: Text('From : $senderName \n$formattedDate'),
                title: Text('$notificationContext'),
                trailing:Column(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.edit), onPressed: (){
                      showOptionDialog(context, notification.docid,notification.recID,notification.senderID);
                    }),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  showOptionDialog(BuildContext context,String docid,String senderID,String recID) {

    // set up the buttons
    Widget markAsReadButton = FlatButton(
      child: Text("Mark as read"),
      onPressed:  () async{
        try {
          Navigator.pop(context);
          await DatabaseService().markAsRead(docid);
        } catch (e) {
          print('e.toString()');
          print(e.toString());
        }
        },
    );
    Widget replyButton = FlatButton(
      child: Text("Reply"),
      onPressed:  (){
        Navigator.pop(context);
        _showSendPanel(senderID,recID);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text("Respond to Notification"),
      content: Text("Response"),
      actions: [
        markAsReadButton,
        replyButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _showSendPanel(String senderID,String recID,){
    showDialog(context: context, builder: (context){
      return Center(
        child: Container(
          height: 450.0,
          padding: EdgeInsets.all(30.0),
          child:SendNotificationForm(senderID:senderID ,recID:recID ,),
        ),
      );
    });
  }
}


class NotificationCardSent extends StatefulWidget {
  final NotificationModel notification;

  const NotificationCardSent({Key key, this.notification}) : super(key: key);

  @override
  _NotificationCardSentState createState() => _NotificationCardSentState();
}

class _NotificationCardSentState extends State<NotificationCardSent> {

  @override
  Widget build(BuildContext context) {
    NotificationModel notification = widget.notification;
    String senderName = notification.senderName;
    DateTime sentDate = notification.sentDate;
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(sentDate);
    String recName = notification.recName;
    String notificationContext = notification.body;
    Color c = Colors.grey;
    IconData readIcon = Icons.query_builder;

    if (notification.read){
      c = Colors.blue;
      readIcon = Icons.done_all;
    }else{
      c = Colors.grey;
      readIcon = Icons.query_builder;
    }
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.all(10.0),
                trailing: IconButton(icon: Icon(Icons.delete),color: Colors.red,
                  onPressed :() async{
                  try {
                    await DatabaseService().softDelete(notification.docid);
                  } catch (e) {
                    print('e.toString()');
                    print(e.toString());
                  }
                },),
                subtitle: Text('To: $recName\n$formattedDate'),
                title: Text('$notificationContext'),
                leading: Icon(readIcon,color:c,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class NotificationCardSection extends StatefulWidget {
  final NotificationModel notification;

  const NotificationCardSection({Key key, this.notification}) : super(key: key);

  @override
  _NotificationCardSectionState createState() => _NotificationCardSectionState();
}

class _NotificationCardSectionState extends State<NotificationCardSection> {

  @override
  Widget build(BuildContext context) {
    NotificationModel notification = widget.notification;
    String senderName = notification.senderName??'';
    DateTime sentDate = notification.sentDate??'';
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(sentDate);
    String recName = notification.recName;
    String notificationContext = notification.body;
    Color c = Colors.grey;
    IconData icon = Icons.query_builder;

    if (notification.read){
      c = Colors.blue;
      icon = Icons.done_all;
    }else{
      c = Colors.grey;
      icon = Icons.query_builder;
    }
    switch(senderName){
      case 'Hotel':
        icon = Icons.home;
        break;
      case 'Halls':
        icon = Icons.business;
        break;
      case 'Rooms':
        icon = Icons.hotel;
        break;
      case 'Restaurant':
        icon = Icons.restaurant;
        break;
      default:
        icon = Icons.query_builder;
    }
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.all(10.0),
                trailing: IconButton(icon: Icon(Icons.delete),color: Colors.red,
                  onPressed :() async{
                    final userData = Provider.of<UserData>(context);
                    if (userData!=null) {
                      if (userData.jobTitle == 'Manager' ) {
                        try {
                          await DatabaseService().softDelete(notification.docid);
                        } catch (e) {
                          print('e.toString()');
                          print(e.toString());
                        }
                      }else{
                        final snackBar = SnackBar(
                          content: Text('Not Authorized!'),
                          action: SnackBarAction(
                            label: 'ok',
                            onPressed: () {},
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                    }
                  },),
                subtitle: Text('Section : $senderName\n$formattedDate'),
                title: Text('$notificationContext'),
                leading: Icon(icon,color:c,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
