import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/table_list.dart';
import 'package:flutter_learn/custom_widgets/table_list_panel.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:provider/provider.dart';
import 'package:flutter_learn/services/database.dart';
class ViewTables extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
        appBarTitle: 'Tables',
        propic: 'dummypropic.png',
        child:
        StreamProvider<List<TableDetail>>.value(
          value: DatabaseService().tablesList,
          child:  Container(
            //color: Colors.white.withOpacity(0.5),
            height: 450.0,child: Column(
            children: <Widget>[
              TableListPanel(),
              TableList(),
            ],
          ),
          ),
        )
    );
  }
}