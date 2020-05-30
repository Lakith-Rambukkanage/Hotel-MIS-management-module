import 'package:flutter/material.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';

class ItemCard extends StatefulWidget {
  final Item item;

  const ItemCard({Key key, this.item}) : super(key: key);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  @override
  Widget build(BuildContext context) {
    Item item =widget.item;
    String name = item.name;
    String docid = item.docid;
    bool available = item.available;
    int price = item.price;
    int quantity = item.quantity;
    int persons = item.persons;
    String category = item.category;
    String image = item.image??'';
    Color stat;

    switch (quantity) {
      case 0:
        stat = Colors.white;
        break;
      default:
        stat = Colors.green;
    }
    return Card(
      color: stat,
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
                IconButton(icon: Icon(Icons.remove_circle_outline),onPressed: (){
                  if (item.quantity>0){
                    setState(() =>item.quantity-=1);
                    //print(item.quantity);
                  }
                },),
                Text('Qty :$quantity'),
                IconButton(icon: Icon(Icons.add_circle_outline),onPressed: (){
                  setState(() =>item.quantity+=1);
                  //print(item.quantity);
                },),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Item item =this.item;
    String name = item.name;
    String docid = item.docid;
    bool available = item.available;
    int price = item.price;
    int quantity = item.quantity;
    int persons = item.persons;
    String category = item.category;
    String image = item.image??'';

    return Card(
      color: Colors.grey[200],
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.grey,backgroundImage: NetworkImage(image),),
        title: Text('$name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text ('category - $category'),
            Text ('price - $price'),
            Text('Qty :$quantity'),
          ],
        ),
      ),
    );
  }
}
