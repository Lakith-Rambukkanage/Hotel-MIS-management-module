import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/calendaricon.dart';
import 'package:flutter_learn/custom_widgets/eventCard.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/pages/home/checkevent.dart';

class ViewEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      appBarTitle: 'Events', 
      propic: 'dummypropic.png',
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children :<Widget>[
          EventCard(),
          SizedBox(height: 10.0,),
      ],
      )
    );
  }
}