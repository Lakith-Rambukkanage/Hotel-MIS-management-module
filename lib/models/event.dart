import 'package:flutter_learn/models/user.dart';

class Event {
  String eventName;
  DateTime eventDate ;
  String status;
  String inchargeId;
  List<String> allocatedSections;
  List<User> allocatedStaff;
}