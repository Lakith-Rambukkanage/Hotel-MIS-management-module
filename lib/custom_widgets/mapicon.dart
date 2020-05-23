import 'package:flutter/material.dart';

class MapIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
                    Container(
                        height: 100.0,
                        width: 70.0,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('All Sections', style: TextStyle(color: Colors.white, fontSize: 10.0)),
                            ),
                            Container(
                              height: 50.0,
                              width: 60.0,
                              decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30.0)),
                              child: Icon(Icons.map,color: Colors.grey[900],size: 30.0,)),
                            SizedBox(height: 15.0,)
                          ],
                        ),
                      ),
                      ]
    );
  }
}