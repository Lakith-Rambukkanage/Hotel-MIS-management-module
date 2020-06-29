import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/itemcard.dart';
import 'package:flutter_learn/pages/home/finalizeoffer.dart';


class AddItemPopup extends StatefulWidget {
  final List selectedItems;

  const AddItemPopup({Key key, this.selectedItems}) : super(key: key);
  _AddItemPopupState createState() => _AddItemPopupState();
}

class _AddItemPopupState extends State<AddItemPopup> {

  final _formKey = GlobalKey<FormState>();
  //error
  String error = '';

  @override
  Widget build(BuildContext context) {
    if(widget.selectedItems.isNotEmpty){
      return Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text('Selected Items',style: TextStyle(fontSize: 17.0),),
                        Container(
                          height: 300.0,
                          child: ListView.builder(
                              itemCount: widget.selectedItems.length,
                              itemBuilder: (context,index){
                                return ItemCard(item : widget.selectedItems[index]);
                              }
                          ),
                        ),
                        RaisedButton(
                            child: Text(
                              'Proceed',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.cyan,
                            onPressed: ()  {
                              List finalSelectedItems = widget.selectedItems.where((i)=>i.quantity>0).toList();
                              if (finalSelectedItems.isNotEmpty) {
                                //print(finalSelectedItems);
                                Navigator.push(context,new MaterialPageRoute(
                                    builder: (context)=>
                                    new FinalizeOffer(itemList: finalSelectedItems,))
                                );
                              }else{
                                setState(() {error = 'Please Select Items';});
                              }
                              //Navigator.pop(context);
                            }),
                        SizedBox(height: 5.0,),
                        Text(error,textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
                      ],
                    ),
                  ),
                ),
              ),
            );
    }else{
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('No Items Selected',style: TextStyle(fontSize: 17.0),),
                RaisedButton(
                    child: Text('Ok', style: TextStyle(color: Colors.white),),
                    color: Colors.cyan,
                    onPressed: ()  {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      );
    }

  }
}
