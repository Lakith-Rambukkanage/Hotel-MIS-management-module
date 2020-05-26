import 'package:flutter/material.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/pages/home/staffprofile.dart';

class ItemCard extends StatelessWidget {

  final Item item;


  ItemCard({
    @required this.item,
  });



  @override
  Widget build(BuildContext context) {
    String name = this.item.name;
    String docid = this.item.docid;
    bool available = this.item.available;
    int price = this.item.price;
    int quantity = this.item.quantity;
    int persons = this.item.persons;
    String category = this.item.category;
    String image = this.item.image;
    Color stat;

    switch (available) {
      case true:
        stat = Colors.green;
        break;
      case false:
        stat = Colors.red;
        break;
      default:
        stat = Colors.amber;
    }
    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.grey,backgroundImage: NetworkImage(image),),
        title: Text('$name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text ('category - $category'),
            Text ('price - $price'),
            Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.remove_circle_outline),onPressed: (){},),
                Text('Qty :$quantity'),
                IconButton(icon: Icon(Icons.add_circle_outline),onPressed: (){},),
              ],
            ),
          ],
        ),
      ),
    );
  }
}