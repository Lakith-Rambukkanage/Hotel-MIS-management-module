import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/notificationCard.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';

class NotificationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      propic: 'dummypropic.png',
      appBarTitle: 'Notifications',
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children :<Widget>[
          NotificationCard(),
      ],
    )
    );
  }
}