import 'package:flutter/material.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class OrderListPanel extends StatefulWidget {
  @override
  _OrderListPanelState createState() => _OrderListPanelState();
}

class _OrderListPanelState extends State<OrderListPanel> {
  int _placedCount = 0;
  int _confirmedCount = 0;
  int _cookingCount = 0;
  int _cookedCount = 0;
  int _servedCount = 0;
  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<List<OrderDetail>>(context);
    if (orderList!=null) {
      _placedCount = orderList.where((o)=>(o.status=='placed')).toList().length??0;
      _confirmedCount = orderList.where((o)=>(o.status=='confirmed')).toList().length??0;
      _cookingCount = orderList.where((o)=>(o.status=='cooking')).toList().length??0;
      _cookedCount = orderList.where((o)=>(o.status=='cooked')).toList().length??0;
      _servedCount = orderList.where((o)=>(o.status=='served')).toList().length??0;
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.assignment,color: Colors.blue,size: 35.0,),
                    Text('$_placedCount',style: TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.play_circle_filled,color: Colors.amber,size: 35.0,),
                    Text('$_confirmedCount',style: TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.whatshot,color: Colors.deepOrange,size: 35.0,),
                    Text('$_cookingCount',style: TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.room_service,color: Colors.deepOrangeAccent,size: 35.0,),
                    Text('$_cookedCount',style: TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.check,color: Colors.green,size: 35.0,),
                    Text('$_servedCount',style: TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
            ],
          ),
        ),
        );
    }else{
      print('Loading - Order list');
      return Loading();
    }
  }
}
