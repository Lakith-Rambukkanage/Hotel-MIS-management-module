import 'package:flutter/material.dart';

class CapacityGraph extends StatelessWidget {
  final int white;
  final int cyan;
  final double width;
  final double height;
  final String whiteLabel;
  final String cyanLabel;

  const CapacityGraph({
  @required this.white,
  @required this.cyan,
  @required this.whiteLabel,
  @required this.cyanLabel, 
  @required this.width,
  @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    int total = white + cyan ;
    double whiteheight = 20 + height*white/total;
    double cyanheight = 20 + height*cyan/total;
    if (white+cyan==0){
       whiteheight = 20 ;
       cyanheight = 20 ;
    }else{
       whiteheight = 20 + height*white/total;
       cyanheight = 20 + height*cyan/total;
    }
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
          ],
      ),
    ),
      );
  }
}