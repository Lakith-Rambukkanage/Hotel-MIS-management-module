import 'package:flutter/material.dart';

class RoomPanel extends StatelessWidget {
  final int available;
  final int cleaning;
  final int checked;

  const RoomPanel({
  @required this.available, 
  @required this.cleaning, 
  @required this.checked
  });

  @override
  Widget build(BuildContext context) {
    int total = available + cleaning + checked;
    double availableheight = 20 + 65*available/total;
    double cleaningheight = 20 + 65*cleaning/total;
    double checkedheight = 20 + 65*checked/total;
    return Column(
        children : <Widget>[Container(
        height: 170.0,
        width: 170.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Rooms', style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ),
              Container(width: 150.0,height: availableheight, decoration:BoxDecoration(color: Colors.white),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.offline_pin),
                  Text(' available - $available'),
                ],
              ),),
              Container(width: 150.0,height: cleaningheight, color: Colors.cyan, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.settings),
                  Text(' cleaning - $cleaning'),
                ],
              ),),
              Container(width: 150.0,height: checkedheight,decoration:BoxDecoration(color: Colors.blue),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.airline_seat_individual_suite),
                  Text(' checked-in - $checked'),
                ],
              ),),
              ],
          ),
        ),
      ),
    ]
    );
  }
}