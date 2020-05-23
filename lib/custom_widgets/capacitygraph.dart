import 'package:flutter/material.dart';

class CapacityGraph extends StatelessWidget {
  final int white;
  final int cyan;
  final int blue;
  final double width;
  final double height;
  final String whiteLabel;
  final String cyanLabel;
  final String blueLabel;

  const CapacityGraph({
  @required this.white, 
  @required this.cyan, 
  @required this.blue,
  @required this.whiteLabel, 
  @required this.cyanLabel, 
  @required this.blueLabel, 
  @required this.width, 
  @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    int total = white + cyan + blue;
    double whiteheight = 20 + height*white/total;
    double cyanheight = 20 + height*cyan/total;
    double blueheight = 20 + height*blue/total;
    return Container(
    //height: 200.0,
    //width: 180.0,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children : <Widget>[
          Container(width: width,height: whiteheight, decoration:BoxDecoration(color: Colors.white),
            child: Center(child: Text(' $whiteLabel - $white')),),
          Container(width: width,height: cyanheight, color: Colors.cyan, child: Center(child: Text(' $cyanLabel - $cyan')),),
          Container(width: width,height: blueheight,decoration:BoxDecoration(color: Colors.blue),
            child: Center(child: Text(' $blueLabel - $blue')),),
          ],
      ),
    ),
      );
  }
}