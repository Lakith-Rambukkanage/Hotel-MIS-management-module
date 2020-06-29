
class NotificationModel {
  String docid;
  bool read;
  bool softDelete;
  String recID;
  String recName;
  String senderID;
  String senderName;
  String type;
  String body;
  DateTime sentDate;

  NotificationModel({this.docid, this.read, this.softDelete, this.recID,
      this.recName, this.senderID, this.senderName, this.type, this.body,this.sentDate});
}