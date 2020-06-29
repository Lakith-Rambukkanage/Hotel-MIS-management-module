import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/addofferitemsbody.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';


class AddOfferItems extends StatefulWidget {
  @override
  _AddOfferItemsState createState() => _AddOfferItemsState();
}

class _AddOfferItemsState extends State<AddOfferItems> {

  List itemList;

  @override
  Widget build(BuildContext context) {

    return ReusableScreen(
        appBarTitle: 'Add Offer',
        propic: 'dummypropic.png',
        child: StreamBuilder<List<Item>>(
            stream: DatabaseService().getItemListByCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                itemList =snapshot.data;
                List categoryList=[];
                itemList.forEach((e)=>categoryList.add(e.category));
                List categoryListFiltered = categoryList.toSet().toList();
                return AddOfferItemsBody(categoryListFiltered: categoryListFiltered,itemList: itemList,);
              }else{
                return Loading();
              }
            })
        );
  }
}
