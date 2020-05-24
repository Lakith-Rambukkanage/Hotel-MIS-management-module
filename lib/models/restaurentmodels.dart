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