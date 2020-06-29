import 'package:flutter/material.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';

class TableCard extends StatelessWidget {

  final TableDetail table;


  TableCard({
    @required this.table,
  });



  @override
  Widget build(BuildContext context) {
    int table_no = this.table.table_no;
    int no_of_seats = this.table.no_of_seats;
    bool activeStatus = this.table.activeStatus;
    Color stat;
    IconData icon;

    switch (activeStatus) {
      case true:
        stat = Colors.green;
        icon = Icons.restaurant;
        break;
      case false:
        stat = Colors.red;
        icon = Icons.restaurant_menu;
        break;
      default:
        stat = Colors.amber;
        icon = Icons.restaurant;
    }
    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon,color: stat,),
        title: Text('Table No : $table_no'),
        subtitle: Text ('No of Seats : $no_of_seats'),
      ),
    );
  }
}