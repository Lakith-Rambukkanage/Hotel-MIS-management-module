import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      child: LinearProgressIndicator(
      backgroundColor: Colors.grey[800],),
    );
  }
}


