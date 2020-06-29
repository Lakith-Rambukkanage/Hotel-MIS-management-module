import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/itemcard.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditOffer extends StatefulWidget {
  final Offer offer;

  const EditOffer({Key key, this.offer}) : super(key: key);
  @override
  _EditOfferState createState() => _EditOfferState();
}

class _EditOfferState extends State<EditOffer> {
  Offer offer;
  DateTime selectedDate = DateTime.now();
  String dateError ='';
  

  //date picker
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: offer.validTill.toDate(),
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate){
      setState(() {dateError = 'Processing';});
      try {
        dynamic result = await DatabaseService().extendOffer(offer.docid, Timestamp.fromDate(picked));
        setState(() {
          selectedDate = picked;
          offer.validTill = Timestamp.fromDate(selectedDate);
          dateError = '';
        });
        String body = (offer.name!=null)?'Offer \' ${offer.name}\' was edited':'Offer was edited';
        await DatabaseService().sectionNotification(body, 'Restaurant');
      } catch (e) {
        setState(() {
          dateError = 'An Error Occurred, Please try again';
          //print(e.toString());
        });
      }

    }
  }
  @override
  Widget build(BuildContext context) {
    offer = widget.offer;
    List items = offer.items;
    String docid = offer.docid;
    String name = offer.name;
    int price = offer.price;
    int sold = offer.sold;
    DateTime today  = DateTime.now();
    DateTime validTill = offer.validTill.toDate();
    bool valid = validTill.isAfter(today);
    Color c;
    if (valid){
      c=Colors.green;
    }
    else{
      c=Colors.red;
    }
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(validTill);
    return ReusableScreen(
        appBarTitle: 'View Offer',
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
                Builder(
                  builder: (context)=> Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Valid Till : $formattedDate',style: TextStyle(fontSize: 16.0,color: c),),
                      IconButton(
                        onPressed: ()  {
                          final userData = Provider.of<UserData>(context);
                          if (userData!=null) {
                            if ((userData.jobTitle ==
                                'Senior Manager' ||
                                userData.jobTitle == 'Manager') &&
                                (userData.section == 'Restaurant' ||
                                    userData.section == 'Hotel')) {
                              _selectDate(context);
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
                        icon: Icon(Icons.edit,color: Colors.cyan),
                      ),
                    ],
                  ),
                ),
                Text(dateError,textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
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
                          height: 200.0,
                          child: ListView.builder(
                              itemCount: itemList.length,
                              itemBuilder: (context,index){
                                return ItemTile(item : itemList[index]);
                              }
                          ),
                        );
                      }
                    }
                ),
                Builder(
                  builder:(context)=> Center(child: FlatButton.icon(
                      onPressed: (){
                        final userData = Provider.of<UserData>(context);
                        if (userData!=null) {
                          if ( userData.jobTitle == 'Manager') {
                            showAlertDialog(context,offer.docid,offer.name);
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
                      icon: Icon(Icons.delete,color: Colors.red,),
                      label: Text('Delete Offer'))
                  ),
                )
              ],
            ),
          ),
        ));
  }
  showAlertDialog(BuildContext context,String docid,String offerName) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {Navigator.pop(context);},
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () async{
        try{await DatabaseService().deleteOffer(docid);
        Navigator.pop(context);
        Navigator.pop(context);
        String body = (offerName!=null)?'Offer \' $offerName\' was deleted':'Offer was deleted';
        await DatabaseService().sectionNotification(body, 'Restaurant');
        }catch(e){
          print('e.toString()');
          Navigator.pop(context);
          print(e.toString());
          //Navigator.pop(context);
          showErrorAlertDialog(context);
          //error display-------------
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Offer"),
      content: Text("Are you sure you want to delete the Offer?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showErrorAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Ok"),
      onPressed:  () {Navigator.pop(context);},
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("An Error occurred!"),
      content: Text("Please try again"),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
