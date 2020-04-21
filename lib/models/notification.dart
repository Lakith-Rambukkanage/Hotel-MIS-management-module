import 'package:flutter_learn/models/user.dart';

class Notification {
  String notificationId;
  String notificationStatus;
  DateTime notificationTime;
  User sender;
  List<User> recievers;  
  String content;
}