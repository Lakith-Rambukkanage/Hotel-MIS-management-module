import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/pages/home/restaurant.dart';
import 'package:flutter_learn/pages/home/rooms_normal.dart';
import 'package:flutter_learn/pages/home/rooms_seaside.dart';
import 'package:flutter_learn/pages/home/vieworders.dart';
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
          Container(
            decoration: new BoxDecoration(color: Colors.white,),
            width: 200.0,
            padding: const EdgeInsets.all(10.0),
            child: Text('Rooms',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
          ),
          Container(
            height: 165.0,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
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
                      child: Text('Sea Side'),
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
                      child: Text('Normal',),
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
          Container(
            decoration: new BoxDecoration(color: Colors.white,),
            width: 200.0,
            padding: const EdgeInsets.all(10.0),
            child: Text('Restaurant',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
          ),
          Container(
            height: 165.0,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
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
                      child: Text('Kitchen'),
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
                  decoration: BoxDecoration(image:  DecorationImage(image: AssetImage('assets/Rest.png'),fit: BoxFit.fitHeight)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Container(
                      decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Tables'),
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
          Container(
            decoration: new BoxDecoration(color: Colors.white,),
            width: 200.0,
            padding: const EdgeInsets.all(10.0),
            child: Text('Halls',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
          ),
          Container(
            height: 165.0,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
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
                      child: Text('East Hall'),
                    ),
                    //subtitle: Text('View room Occupance'),
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(
                          builder: (context)=>
                          new Restaurant())
                      );
                    },
                  ),
                  //color: Colors.white,
                  decoration: BoxDecoration(image:  DecorationImage(image: AssetImage('assets/Rest.png'),fit: BoxFit.fitHeight)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Container(
                      decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10.0),
                      child: Text('West Hall'),
                    ),
                    //subtitle: Text('View room Occupance'),
                    onTap: (){
                      Navigator.push(context,new MaterialPageRoute(
                          builder: (context)=>
                          new Restaurant())
                      );
                    },
                  ),
                  //color: Colors.white,
                  decoration: BoxDecoration(image:  DecorationImage(image: AssetImage('assets/Rest.png'),fit: BoxFit.fitHeight)),
                ),
              ],
            ),
          ),
                  // TODO : in each section show updates from manager etc. 
                  // TODO : allow broadcast to all employees within section
                  // TODO : add halls
                ],
    )
    );
  }
}