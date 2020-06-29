
class RoomDetail {
  String bed;
  bool booked;
  String booked_till;
  int bedid;
  String docid;
  String type;

  RoomDetail({this.bed, this.booked, this.booked_till, this.bedid,this.docid, this.type});
}

class RoomPackage{
  String type;
  String docid;
  //breakfast only
  String price_b;
  //half board
  String price_h;
  //full board
  String price_f;

  RoomPackage({this.type,this.docid,this.price_b, this.price_h, this.price_f});
}