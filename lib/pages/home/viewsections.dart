import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/pages/home/rooms_normal.dart';
import 'package:flutter_learn/pages/home/rooms_seaside.dart';
import 'package:flutter_learn/pages/home/viewhalls.dart';
import 'package:flutter_learn/pages/home/vieworders.dart';
import 'package:flutter_learn/pages/home/viewrestaurant.dart';
import 'package:flutter_learn/pages/home/viewrooms.dart';
import 'package:flutter_learn/pages/home/viewtables.dart';

class Sections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      propic: 'dummypropic.png',
      appBarTitle: 'Sections',
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children : <Widget>[
          Card(
            child: ListTile(
              title: Text('Rooms'),
              subtitle: Text('Room Packages and availability'),
              trailing: Icon(Icons.airline_seat_individual_suite,color: Colors.cyan,),
              onTap: (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new ViewRooms())
                );
              },
            ),
          ),
          Container(
            height: 170.0,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Container(
                      decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Sea Side',textAlign: TextAlign.center,),
                    ),
                    //subtitle: Text('View room Occupance'),
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(
                          builder: (context)=>
                          new RoomsSeaside())
                      );
                    },
                  ),
                  //color: Colors.white,
                  decoration: BoxDecoration(image:  DecorationImage(image: AssetImage('assets/room3.png'),fit: BoxFit.fitHeight)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Container(
                      decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Normal',textAlign: TextAlign.center,),
                    ),
                    //subtitle: Text('View room Occupance'),
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(
                          builder: (context)=>
                          new RoomsNormal())
                      );
                    },
                  ),
                  //color: Colors.white,
                  decoration: BoxDecoration(image:  DecorationImage(image: AssetImage('assets/room2.png'),fit: BoxFit.fitHeight)),
                ),
              ],
            ),
          ),
          //Restaurant kitchen and restaurant
          Card(
            child: ListTile(
              title: Text('Restaurant'),
              subtitle: Text('Offers, kitchen and dining area'),
              trailing: Icon(Icons.restaurant,color: Colors.cyan,),
              onTap: (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new ViewRestaurant())
                );
              },
            ),
          ),
          Container(
            height: 170.0,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Container(
                      decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Kitchen',textAlign: TextAlign.center,),
                    ),
                    //subtitle: Text('View room Occupance'),
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(
                          builder: (context)=>
                          new ViewOrders())
                      );
                    },
                  ),
                  //color: Colors.white,
                  decoration: BoxDecoration(image:  DecorationImage(image: AssetImage('assets/kitchen.PNG'),fit: BoxFit.fitHeight)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Container(
                      decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Tables',textAlign: TextAlign.center,),
                    ),
                    //subtitle: Text('View room Occupance'),
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(
                          builder: (context)=>
                          new ViewTables())
                      );
                    },
                  ),
                  //color: Colors.white,
                  decoration: BoxDecoration(image:  DecorationImage(image: AssetImage('assets/Rest.png'),fit: BoxFit.fitHeight)),
                ),
              ],
            ),
          ),
                  //Halls
          Card(
            child: ListTile(
              title: Text('Halls',),
              subtitle: Text('Upcoming events'),
              trailing: Icon(Icons.business,color: Colors.cyan,),
              onTap: (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new ViewHalls())
                );
              },
            ),
          ), // TODO : in each section show updates from manager etc. // TODO : allow broadcast to all employees within section // TODO : add halls
        ],
    )
    );
  }
}