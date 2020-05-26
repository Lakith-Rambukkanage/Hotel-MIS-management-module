import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/ordercard.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<List<OrderDetail>>(context);
    if (orderList!=null) {
      return Expanded(
        child: ListView.builder(
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            if (orderList[index].status!='served') {
              return OrderCard(order: orderList[index]);
            }else{
              return Container();
            }
          },
        ),
      );
    }else{
      print('Loading - Order list');
      return Loading();
    }
  }
}
