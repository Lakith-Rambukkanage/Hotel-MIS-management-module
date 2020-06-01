import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/offercard.dart';
import 'package:flutter_learn/custom_widgets/order_list_panel.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/table_list_panel.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/home/addofferitems.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class ViewRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ReusableScreen(
        appBarTitle: 'Restaurant',
        propic: 'dummypropic.png',
        child: StreamProvider<List<Offer>>.value(
          value: DatabaseService().offersList,
          child:  Column(
            children: <Widget>[
              StreamBuilder<List<Offer>>(
                  stream: DatabaseService().offersList,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      List<Offer> offerList = snapshot.data;
                      return Container(
                        height: 250.0,
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                leading: Text('Offers',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
                                trailing: FlatButton.icon(
                                  icon : Icon(Icons.fastfood,color: Colors.green,),
                                  label:Text('Add Offer +'),
                                  onPressed: (){
                                  final userData = Provider.of<UserData>(context);
                                  if (userData!=null) {
                                    if ((userData.jobTitle ==
                                        'Senior Manager' ||
                                        userData.jobTitle == 'Manager') &&
                                        (userData.section == 'Restaurant' ||
                                            userData.section == 'Hotel')) {
                                      Navigator.push(
                                          context, new MaterialPageRoute(
                                          builder: (context) =>
                                          new AddOfferItems())
                                      );
                                    }else{
                                      final snackBar = SnackBar(
                                        content: Text('Not Authorized!'),
                                        action: SnackBarAction(
                                          label: 'ok',
                                          onPressed: () {},
                                        ),
                                      );
                                      Scaffold.of(context).showSnackBar(snackBar);
                                    }
                                  }
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: offerList.length,
                                itemBuilder: (context, index) {
                                  return OfferCard(offer: offerList[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }else{
                      return Loading();
                    }
                  }),
              SizedBox(height: 20.0,),
              Card(
                child: ListTile(
                  leading: Text('Current Orders',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
                  trailing: Icon(Icons.whatshot,color: Colors.deepOrange,),
                ),
              ),
              StreamProvider<List<OrderDetail>>.value(
                  value: DatabaseService().ordersList,
                  child: OrderListPanel()
              ),
              Card(
                child: ListTile(
                  leading: Text('Dining Area - Tables',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
                  trailing: Icon(Icons.room_service,color: Colors.amber,),
                ),
              ),
              StreamProvider<List<TableDetail>>.value(
                  value: DatabaseService().tablesList,
                  child: TableListPanel()),
            ],
          ),
        ));
  }
}