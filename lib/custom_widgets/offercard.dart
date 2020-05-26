import 'package:flutter/material.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/pages/home/editoffer.dart';
import 'package:intl/intl.dart';


class OfferCard extends StatelessWidget {

  final Offer offer;


  OfferCard({
    @required this.offer,
  });



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

    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(15.0),
        onTap: (){
          Navigator.push(context,new MaterialPageRoute(
              builder: (context)=>
              new EditOffer(offer: offer,))
          );
        },
        trailing: Icon(Icons.edit,color: Colors.blue,),
        title: Text('$name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text ('Price - $price LKR'),
            Text ('Amount Sold - $sold'),
            Text ('Offer Valid till- $formattedDate'),
          ],
        ),
      ),
    );
  }
}