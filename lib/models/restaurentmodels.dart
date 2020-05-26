import 'package:cloud_firestore/cloud_firestore.dart';

class TableDetail{
  String id;
  bool activeStatus;
  int table_no;
  int no_of_seats;

  TableDetail({this.id, this.activeStatus, this.table_no, this.no_of_seats});
}
class OrderDetail{
  String status;
  int total;

  OrderDetail({this.status, this.total});
}

class Offer {
  String docid;
  List items;
  String name;
  int price;
  int sold;
  Timestamp validTill;

  Offer({this.docid,this.items, this.name, this.price, this.sold, this.validTill});
}

class Item{
  String docid;
  bool available;
  String category;
  String image;
  String name;
  int persons;
  int price;
  int quantity;

  Item({this.docid,this.available, this.category,this.image, this.name, this.persons, this.price,this.quantity});
}
