import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/hometile.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';

class NotificationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      propic: 'dummypropic.png',
      appBarTitle: 'Notifications',
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children :<Widget>[
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 50.0 ,color: Colors.cyan,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Event : Wedding', style: TextStyle(color: Colors.cyan, fontSize: 20.0 ),),
                  Text('George Hall', style: TextStyle(color: Colors.cyan, fontSize: 15.0),),
                  SizedBox(height: 5.0,),
                  Text("'Theme adjustment required - white and rose'", style: TextStyle(color: Colors.white, fontSize: 15.0 ),),
                ],
               ),
              ),
              ]
          ),
          SizedBox(height: 10.0,),
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 50.0 ,color: Colors.red,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Polly Grey', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('Assistant manager ', style: TextStyle(color: Colors.cyan, fontSize: 15.0),),
                  SizedBox(height: 5.0,),
                  Text("'Need more staff for conference at East hall '", style: TextStyle(color: Colors.white, fontSize: 15.0 ),),
                ],
               ),
              ),
              ]
          ),
          SizedBox(height: 10.0,),
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 50.0 ,color: Colors.cyan,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Event : Pool Party', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('Pool Area', style: TextStyle(color: Colors.cyan, fontSize: 15.0),),
                  SizedBox(height: 5.0,),
                  Text("'Requires table arrangement before evening'", style: TextStyle(color: Colors.white, fontSize: 15.0 ),),
                ],
               ),
              ),
              ]
          ),
          SizedBox(height: 10.0,),
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 50.0 ,color: Colors.green,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Jonah Lomu', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('Senior manager ', style: TextStyle(color: Colors.cyan, fontSize: 15.0),),
                  SizedBox(height: 5.0,),
                  Text("'Room cleaning and maintenance understaff'", style: TextStyle(color: Colors.white, fontSize: 15.0 ),),
                ],
               ),
              ),
              ]
          ),
          SizedBox(height: 10.0,),
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 50.0 ,color: Colors.green,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Arthur Shelby', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('Assistant manager ', style: TextStyle(color: Colors.cyan, fontSize: 15.0),),
                  SizedBox(height: 5.0,),
                  Text("'Requesting Leave to attend urgent Matter'", style: TextStyle(color: Colors.white, fontSize: 15.0 ),),
                ],
               ),
              ),
              ]
          ),
          SizedBox(height: 10.0,),
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 50.0 ,color: Colors.green,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Paul Hector', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('Head Chef ', style: TextStyle(color: Colors.cyan, fontSize: 15.0),),
                  SizedBox(height: 5.0,),
                  Text("'Menu need to be overlooked for changes'", style: TextStyle(color: Colors.white, fontSize: 15.0 ),),
                ],
               ),
              ),
              ]
          ),
      ],
    )
    );
  }
}