import 'package:flutter/material.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class TableListPanel extends StatefulWidget {
  @override
  _TableListPanelState createState() => _TableListPanelState();
}

class _TableListPanelState extends State<TableListPanel> {
  int _activeCount = 0;
  int _inactiveCount = 0;

  @override
  Widget build(BuildContext context) {
    final tableList = Provider.of<List<TableDetail>>(context);
    if (tableList!=null) {
      _activeCount = tableList.where((o)=>(o.activeStatus)).toList().length??0;
      _inactiveCount = tableList.where((o)=>(!o.activeStatus)).toList().length??0;

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
                    Icon(Icons.restaurant,color: Colors.green,size: 35.0,),
                    Text('$_activeCount',style: TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.restaurant_menu,color: Colors.red,size: 35.0,),
                    Text('$_inactiveCount',style: TextStyle(fontSize: 20.0),),
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
