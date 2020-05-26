import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/order_list.dart';
import 'package:flutter_learn/custom_widgets/order_list_panel.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:provider/provider.dart';
import 'package:flutter_learn/services/database.dart';
class ViewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
        appBarTitle: 'Orders',
        propic: 'dummypropic.png',
        child:
        StreamProvider<List<OrderDetail>>.value(
          value: DatabaseService().ordersList,
          child:  Container(
            //color: Colors.white.withOpacity(0.5),
            height: 450.0,child: Column(
            children: <Widget>[
              OrderListPanel(),
              OrderList(),
            ],
          ),
          ),
        )
    );
  }
}