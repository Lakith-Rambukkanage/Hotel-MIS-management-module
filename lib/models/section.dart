import 'package:flutter_learn/models/user.dart';

class Section {
  String sectionId;
  String sectionName;
  String inchargeId;
  String status;
  List<User> allocatedStaff;
  Section superSection;
  List<Section> subSections;
}