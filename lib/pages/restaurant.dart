import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';

class Restaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      appBarTitle: 'Manage Restaurant', 
      propic: 'dummypropic.png', 
      username: 'Thomas shelby', 
      jobtitle: 'Manager',
      content: <Widget>[
        Container(
                  margin: EdgeInsets.all(1.0),
                  width: 450.0,
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.9),borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Restaurant', style: TextStyle(color: Colors.grey[900], fontSize: 25.0)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(image: AssetImage('assets/Rest.png'),),
                            ),
                            Container(margin: EdgeInsets.all(10.0), color: Colors.grey[500], height: 2.0,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('Status : ', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                                  Text('Active', style: TextStyle(color: Colors.green, fontSize: 17.0)),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('Assigned to : ', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                                  FlatButton(child: Text('Arthur Shelby', style: TextStyle(color: Colors.blue, fontSize: 17.0, fontStyle: FontStyle.italic)), onPressed: () {},),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('Allocated Staff : ', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                                  Text('10', style: TextStyle(color: Colors.black, fontSize: 17.0, )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(margin: EdgeInsets.all(10.0), color: Colors.grey[500], height: 2.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton.icon(
                              onPressed: (){}, 
                              icon: Icon(Icons.notifications,color: Colors.blue,), 
                              label: Text('Instructions'),
                            ),
                            FlatButton.icon(
                              onPressed: (){}, 
                              icon: Icon(Icons.edit,color: Colors.blue,), 
                              label: Text('Edit details'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton.icon(
                              onPressed: (){}, 
                              icon: Icon(Icons.people,color: Colors.blue,), 
                              label: Text('Manage Staff'),
                            ),
                            FlatButton.icon(
                              onPressed: (){}, 
                              icon: Icon(Icons.restaurant_menu,color: Colors.blue,),
                              label: Text('Edit Menu'),
                              //TODO : functions available to change menu and stuff
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
      ], 
      );
  }
}