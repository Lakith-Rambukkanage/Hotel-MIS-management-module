import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      appBarTitle: 'My Profile', 
      propic: 'dummypropic.png', 
      username: 'Thomas Shelby', 
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
                            CircleAvatar(backgroundImage: AssetImage('assets/dummypropic.png'),radius: 40.0,),
                            Text('Thomas Shelby', style: TextStyle(color: Colors.black, fontSize: 25.0)),
                            Text('Manager', style: TextStyle(color: Colors.cyan, fontSize: 20.0)),
                            Container(margin: EdgeInsets.all(10.0), color: Colors.grey[500], height: 2.0,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Status :', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                                  Switch(
                                    value: false,
                                    onChanged: (value) {},
                                    activeTrackColor: Colors.green[400],
                                    activeColor: Colors.green,
                                  ), 
                                ],
                              ),
                              Text('Assigned section :', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                              SizedBox(height :15.0),
                              Text('No. of Subordinates :', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                            ],
                          ),
                        ),
                        Container(margin: EdgeInsets.all(10.0), color: Colors.grey[500], height: 2.0,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('E-mail :', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Mobile No. :', style: TextStyle(color: Colors.black, fontSize: 17.0)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton.icon(
                              onPressed: (){}, 
                              icon: Icon(Icons.edit,color: Colors.blue,), 
                              label: Text('Edit details'),
                            ),
                            FlatButton.icon(
                              onPressed: (){}, 
                              icon: Icon(Icons.delete,color: Colors.red,), 
                              label: Text('delete account'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
      ], 
      );
  }
}