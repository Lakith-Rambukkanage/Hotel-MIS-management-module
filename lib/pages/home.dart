import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/donut.dart';
import 'package:flutter_learn/custom_widgets/gauge.dart';
import 'package:flutter_learn/custom_widgets/panel.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
          backgroundColor: Colors.grey[850]
        ),
        backgroundColor: Colors.grey[900],
        body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child : SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Panel.panel(Panel.todayPanel()),
                SizedBox(height: 20.0,),
                Panel.panel(Panel.staffPanel()),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Panel.panel(Panel.roomStatus()),
                    SizedBox(width: 10.0,),
                    Panel.panel(Panel.mapIcon()),
                  ],
                ),
                SizedBox(height: 20.0,),
                Panel.panel([Container(height: 120.0,)]),
              ],
            ),
          ),
        ),
      )
      );
  }
}