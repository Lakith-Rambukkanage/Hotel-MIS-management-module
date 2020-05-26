import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/tablecard.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class TableList extends StatefulWidget {
  @override
  _TableListState createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  @override
  Widget build(BuildContext context) {
    final tablesList = Provider.of<List<TableDetail>>(context);
    if (tablesList!=null) {
      tablesList.sort((t1,t2)=>(t1.table_no.compareTo(t2.table_no)));
      return Expanded(
        child: ListView.builder(
          itemCount: tablesList.length,
          itemBuilder: (context, index) {
              return TableCard(table: tablesList[index]);
          },
        ),
      );
    }else{
      print('Loading - Table list');
      return Loading();
    }
  }
}
