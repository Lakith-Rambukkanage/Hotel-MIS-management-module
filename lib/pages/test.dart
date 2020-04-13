import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/donut.dart';
import 'package:flutter_learn/custom_widgets/gauge.dart';
import 'package:flutter_learn/custom_widgets/panel.dart';

class Test extends StatelessWidget {
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
        child : DonutAutoLabelChart.withSampleData(),
      )
      );
  }
}