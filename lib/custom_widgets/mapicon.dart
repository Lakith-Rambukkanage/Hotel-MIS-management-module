import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/hometile.dart';

class MapIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeTile(
      children: <Widget>[
                    Container(
                        height: 170.0,
                        width: 170.0,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('All Sections', style: TextStyle(color: Colors.white, fontSize: 18.0)),
                            ),
                            Container(
                              height: 100.0,
                              width: 120.0,
                              decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30.0)),
                              child: Icon(Icons.map,color: Colors.grey[900],size: 80.0,)),
                            SizedBox(height: 15.0,)
                          ],
                        ),
                      ),
                      ]
    );
  }
}