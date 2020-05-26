import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/itemcard.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:intl/intl.dart';

class EditOffer extends StatelessWidget {
  final Offer offer;

  const EditOffer({Key key, this.offer}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    List items = this.offer.items;
    String docid = this.offer.docid;
    String name = this.offer.name;
    int price = this.offer.price;
    int sold = this.offer.sold;
    DateTime validTill = this.offer.validTill.toDate();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(validTill);
    return ReusableScreen(
        appBarTitle: 'Edit Offer',
        propic: 'dummypropic.png',
        child: Card(
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Offer Name : $name',style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 10.0,),
                Text('Price : $price LKR',style: TextStyle(fontSize: 18.0),),
                SizedBox(height: 10.0,),
                Text('Sold : $sold',style: TextStyle(fontSize: 18.0),),
                SizedBox(height: 10.0,),
                Text('Valid Till : $formattedDate',style: TextStyle(fontSize: 18.0),),
                SizedBox(height: 10.0,),
                Container(height: 2.0,color: Colors.grey,),
                SizedBox(height: 10.0,),
                FutureBuilder<List<Item>>(
                  future: DatabaseService().getOfferItems(offer.items),
                    builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return Loading();
                          }
                          else{
                            List<Item> itemList = snapshot.data;
                            return Container(
                              height: 250.0,
                              child: ListView.builder(
                                itemCount: itemList.length,
                                itemBuilder: (context,index){
                                  return ItemCard(item : itemList[index]);
                                }
                              ),
                            );
                          }
                        }
                )
              ],
            ),
          ),
        ));
  }
}