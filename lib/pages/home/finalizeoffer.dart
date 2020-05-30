import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/custom_widgets/itemcard.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:intl/intl.dart';


class FinalizeOffer extends StatefulWidget {
  final List itemList;

  const FinalizeOffer({Key key, this.itemList}) : super(key: key);
  @override
  _FinalizeOfferState createState() => _FinalizeOfferState();
}

class _FinalizeOfferState extends State<FinalizeOffer> {

  DateTime selectedDate = DateTime.now();
  //String docid = this.offer.docid;
  String name = '';
  int price = 0;
  int sold = 0;
  String error='';
  var formatter = new DateFormat('yyyy-MM-dd');
  //date picker
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  //form key
  final _formkey = GlobalKey<FormState>();
  //Function to map items
  List _mapItems(List itemList){
    final CollectionReference itemsCollection = Firestore.instance.collection("items");
    List itemsListToDB = [];
    for( var i = 0 ; i<itemList.length; i++ ) {
      Map itemMap = new Map();
      Item item = itemList[i];
      itemMap['item'] = itemsCollection.document(item.docid);
      itemMap['quantity'] = item.quantity;
      //print(itemMap);
      itemsListToDB.add(itemMap);
    }
    return itemsListToDB;
  }


  @override
  Widget build(BuildContext context) {
    List itemList = widget.itemList;
    String formattedDate = formatter.format(selectedDate);
    TextEditingController _controller=TextEditingController();
    return ReusableScreen(
        appBarTitle: 'Add Offer',
        propic: 'dummypropic.png',
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    validator: (val) =>val.isEmpty? 'Enter Offer Name':null,
                    onChanged: (val){
                      setState( () => name = val );
                      //print(name);
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.fastfood),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.grey,),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.event_note,color: Colors.cyan),
                        Text('       Valid Till : $formattedDate',style: TextStyle(fontSize: 16.0,color: Colors.grey[600]),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(height: 2.0,color: Colors.grey[400],),
                  TextFormField(
                      //controller: _controller,
                      onChanged:(val){
                        setState( () => price = int.parse(val) );
                      },
                      validator: (val) =>val.isEmpty? 'Enter Offer Price':null,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Price',
                          labelStyle: TextStyle(color: Colors.grey,),
                          hintText: "Enter Price",
                          icon: Icon(Icons.monetization_on)
                      )
                  ),
                  SizedBox(height: 15.0,),
                  Container(
                    height: 170.0,
                    child: ListView.builder(
                        itemCount: itemList.length,
                        itemBuilder: (context,index){
                          return ItemTile(item : itemList[index]);
                        }
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                          child: Text('<-Change Items', style: TextStyle(color: Colors.white),),
                          color: Colors.cyan.withOpacity(0.7),
                          onPressed: () {
                            Navigator.pop(context);
                          }
                      ),
                      RaisedButton(
                          child: Text('Add Offer', style: TextStyle(color: Colors.white),),
                          color: Colors.cyan.withOpacity(0.7),
                          onPressed: () async {
                            if (_formkey.currentState.validate()){
//                              print(price);
//                              print(name);
//                              print(selectedDate);
                              List itemsListToDB = _mapItems(itemList);

                          dynamic result = await DatabaseService().addNewOffer(name, itemsListToDB, price, Timestamp.fromDate(selectedDate) );
                          setState(() {error = 'Processing ...';});
                          if (result==null){
                            setState(() {error = 'Please Enter Valid Details and Check Connectivity';});
                          }else{
                            setState(() {error = 'Processing ...';});
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            String body = (name!=null)?'New Offer \' $name\' was added to Menu':'New Offer was Added';
                            await DatabaseService().sectionNotification(body, 'Restaurant');
//                            Navigator.push(context,new MaterialPageRoute(
//                                builder: (context)=>
//                                new ViewRestaurant())
//                            );
                          }
                            }
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Text(error,textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
                ],
              ),
            ),
          ),
        ));
  }
}
