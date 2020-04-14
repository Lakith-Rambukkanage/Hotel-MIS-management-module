import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/panel.dart';

class Section extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sections'),
          centerTitle: true,
          backgroundColor: Colors.grey[850]
        ),
        backgroundColor: Colors.grey[900],

        drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Quick Access', style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                  ),
                ),
                ListTile(
                  title: Text('Calendar & Events'),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Staff'),
                  trailing: Icon(Icons.people),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Sections'),
                  trailing: Icon(Icons.map),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Restaurent'),
                  trailing: Icon(Icons.restaurant),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

        body: Container(
          height: 800.0,
          width: 600.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child : SingleChildScrollView(
                  child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Container(
                      child : Stack(
                        alignment: AlignmentDirectional.center,
                        children : <Widget>[
                          Image(
                                image: AssetImage('assets/room.png'),
                                //height: 150.0,
                                width: 350.0,
                              ),
                          Container(
                          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.8),borderRadius: BorderRadius.circular(10.0)),
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Rooms',style: TextStyle(fontSize: 30.0),),
                          ),
                        ]
                      ),
                    ),
                ],
              ),
            ),
        ),
      )
      );
  }
}