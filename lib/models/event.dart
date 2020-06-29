
class EventModel {
  String docid;
  DateTime eventDate ;
  int timeSlot;
  String hall;
  String eventName;
  String customerName;
  String contactNo;
  String email;

  EventModel({this.docid, this.eventDate, this.timeSlot, this.hall,
      this.eventName, this.customerName, this.contactNo, this.email});
}