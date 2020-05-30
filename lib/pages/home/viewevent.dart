import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/event.dart';
import 'package:flutter_learn/pages/home/event_reschedule.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:intl/intl.dart';

class ViewEvent extends StatelessWidget {
  final String docid;

  const ViewEvent({Key key, this.docid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      appBarTitle: 'Events',
      propic: 'dummypropic.png',
        child: StreamBuilder<EventModel>(
          stream: DatabaseService(docid: docid).eventById,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              EventModel e = snapshot.data;
              String slot = '';
              switch (e.timeSlot) {
                case 0:
                  slot = 'Morning';
                  break;
                case 1:
                  slot = 'Afternoon';
                  break;
                case 2:
                  slot = 'Evening';
                  break;
                case 3:
                  slot = 'Night';
                  break;
                default:
                  slot = 'Morning';
              }
              var formatter = new DateFormat('yyyy-MM-dd');
              String formattedDate = formatter.format(e.eventDate);
            return Card(
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children :<Widget>[
                  Card(
                    color: Colors.grey[300],
                    child: ListTile(
                      title:Text('${e.eventName}'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title:Text('Date : $formattedDate'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.timelapse),
                      title:Text('Time Slot : $slot'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.business),
                      title:Text('Hall : ${e.hall}'),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      //leading: Icon(Icons.perm_contact_calendar),
                      title: Text('${e.customerName}'),
                      subtitle: Text('Email : ${e.email} \nContact No. : ${e.contactNo}'),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton.icon(
                        icon: Icon(Icons.event, color: Colors.cyan,),
                          label: Text('Reschedule'),
                        onPressed: (){
                          Navigator.push(context,new MaterialPageRoute(
                              builder: (context)=>
                              new RescheduleEvent(docid: docid,eventName: e.eventName,))
                          );
                        },
                      ),
                      FlatButton.icon(
                          icon: Icon(Icons.delete, color: Colors.red,),
                          label: Text('Delete',),
                          onPressed: ()=>showAlertDialog(context,docid,e.eventName,),
                      ),
                    ],
                  ),
                ],
                ),
              ),
            );
            }else{
              return Loading();
            }
          }
        )
    );
  }


  showAlertDialog(BuildContext context,String docid,String eventName) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {Navigator.pop(context);},
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () async{
        try{await DatabaseService().deleteEvent(docid);
        Navigator.pop(context);
        Navigator.pop(context);
        String body = (eventName!=null)?'Event \' $eventName\' was deleted':'Offer was deleted';
        await DatabaseService().sectionNotification(body, 'Halls');
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
      title: Text("Delete Event"),
      content: Text("Are you sure you want to delete the Event?"),
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