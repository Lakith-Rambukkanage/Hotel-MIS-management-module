import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/hometile.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';

class NotificationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      propic: 'dummypropic.png',
      username: 'Thomas Shelby',
      jobtitle: 'Manager',
      appBarTitle: 'Notifications', 
      content: <Widget>[
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 50.0 ,color: Colors.green,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Notification From Arthur Shelby', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('Assistant manager ', style: TextStyle(color: Colors.cyan, fontSize: 15.0),),
                  SizedBox(height: 5.0,),
                  Text("'Room Price needs Seasonal Price Changes'", style: TextStyle(color: Colors.white, fontSize: 15.0 ),),
                ],
               ),
              ),
              ]
          ),
      ],
    );
  }
}