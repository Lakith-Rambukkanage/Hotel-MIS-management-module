import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/add_item_popup.dart';
import 'package:flutter_learn/custom_widgets/itemcard.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:intl/intl.dart';


class AddOffer extends StatefulWidget {
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {

  DateTime selectedDate = DateTime.now();

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

  @override
  Widget build(BuildContext context) {

    void _showAddItemPopup(){
      showDialog(context: context, builder: (context){
        return Center(
          child: Container(
            height: 450.0,
            //padding: EdgeInsets.all(30.0),
            child:AddItemPopup(),
          ),
        );
      });
    }




    //error
    String error = '';

    //form key
    final _formkey = GlobalKey<FormState>();

    List itemList = [Item(name: 'test 1',quantity: 1)];
    //String docid = this.offer.docid;
    String name = '';
    int price = 0;
    int sold = 0;
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(selectedDate);
    return ReusableScreen(
        appBarTitle: 'Add Offer',
        propic: 'dummypropic.png',
        child: Card(
          margin: EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    validator: (val) =>val.isEmpty? 'Enter Offer Name':null,
                    onChanged: (val){
                      setState( () => name = val );
                      //print(email);
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Offer Name',
                      labelStyle: TextStyle(color: Colors.grey,),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    validator: (val) =>val.isEmpty? 'Enter Offer Price':null,
                    onChanged: (val){
                      setState( () => price = val as int );
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Price',
                      labelStyle: TextStyle(color: Colors.grey,),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Valid Till : $formattedDate',style: TextStyle(fontSize: 16.0,color: Colors.grey[600]),),
                      IconButton(
                        onPressed: () => _selectDate(context),
                        color: Colors.cyan.withOpacity(0.7),
                        icon: Icon(Icons.event_note,color: Colors.cyan),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Container(height: 2.0,color: Colors.grey,),
                  SizedBox(height: 10.0,),
                  FlatButton.icon(onPressed: ()=>_showAddItemPopup(), icon: Icon(Icons.add_circle_outline), label: Text('Add Item')),
                  Container(
                    height: 150.0,
                    child: ListView.builder(
                        itemCount: itemList.length,
                        itemBuilder: (context,index){
                          return ItemCard(item : itemList[index]);
                        }
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                        child: Text('Add Offer', style: TextStyle(color: Colors.white),),
                        color: Colors.cyan.withOpacity(0.7),
                        onPressed: () async {
                        if (_formkey.currentState.validate()){
//                          dynamic result = await _authService.signInWithEmailAndPassword(email, password);
//                          if (result==null){
//                            setState(() {error = 'Please Enter Valid Details and Check Connectivity';});
//                          }
                        }
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
