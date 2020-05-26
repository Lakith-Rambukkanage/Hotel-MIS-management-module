import 'package:flutter/material.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';

class OrderCard extends StatelessWidget {

  final OrderDetail order;


  OrderCard({
    @required this.order,
  });



  @override
  Widget build(BuildContext context) {
    String status = this.order.status;
    int total = this.order.total;
    Color stat;
    IconData icon;

    switch (status) {
      case 'placed':
        stat = Colors.blue;
        icon = Icons.assignment;
        break;
      case 'confirmed':
        stat = Colors.amber;
        icon = Icons.play_circle_filled;
        break;
      case 'cooking':
        stat = Colors.deepOrange;
        icon = Icons.whatshot;
        break;
      case 'cooked':
        stat = Colors.deepOrangeAccent;
        icon = Icons.room_service;
        break;
      default:
        stat = Colors.blue;
        icon = Icons.restaurant;
    }
    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon,color: stat,),
        title: Text('Order Status : $status'),
        subtitle: Text ('Total : $total',style: TextStyle(color: Colors.green[700]),),
      ),
    );
  }
}