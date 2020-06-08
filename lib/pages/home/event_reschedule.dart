import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/event.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:intl/intl.dart';

class RescheduleEvent extends StatefulWidget {
  final String docid;
  final String eventName;

  const RescheduleEvent({Key key, this.docid, this.eventName}) : super(key: key);


  @override
  _RescheduleEventState createState() => _RescheduleEventState();
}

class _RescheduleEventState extends State<RescheduleEvent> {
  static DateTime temp = DateTime.now();
  DateTime selectedDate = new DateTime(temp.year,temp.month,temp.day)??DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  //date picker
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(Duration(days: 1)),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }



  @override
  Widget build(BuildContext context) {
    String formattedDate = formatter.format(selectedDate);
    return ReusableScreen(
        appBarTitle: 'Reschedule Event',
        propic: 'dummypropic.png',
        child: StreamBuilder<List<EventModel>>(
            stream: DatabaseService().getEventsListByDate(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                Map availability = {
                  0 : 'Available',
                  1 : 'Available',
                  2 : 'Available',
                  3 : 'Available',//up to here east night
                  4 : 'Available',
                  5 : 'Available',
                  6 : 'Available',
                  7 : 'Available',//up to here west night
                };
                List<EventModel> eventsList = snapshot.data;
//                List<EventModel> eastHallEventsList = eventsList.where((e)=>(e.hall=='East Hall')).toList();
//                List<EventModel> westHallEventsList = eventsList.where((e)=>(e.hall=='West Hall')).toList();
                for (EventModel e in eventsList){
                  if (e.hall=='East Hall'){
                    availability[e.timeSlot]=e.eventName;
                  }else if (e.hall=='West Hall'){
                    availability[e.timeSlot+4]=e.eventName;
                  }
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.event_note,color: Colors.cyan),
                            Text('       Select date : $formattedDate',style: TextStyle(fontSize: 16.0,color: Colors.grey[600]),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Card(
                      child:ListTile(
                        title: Text('East Hall'),
                        trailing: Icon(Icons.business,color: Colors.cyan,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_reschedule(selectedDate,'East Hall',0),
                        enabled: (availability[0]=='Available'),
                        title: Text('${availability[0]}'),
                        subtitle: Text('Morning'),
                        trailing: (availability[0]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_reschedule(selectedDate,'East Hall',1),
                        enabled: (availability[1]=='Available'),
                        title: Text('${availability[1]}'),
                        subtitle: Text('Afternoon'),
                        trailing: (availability[1]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_reschedule(selectedDate,'East Hall',2),
                        enabled: (availability[2]=='Available'),
                        title: Text('${availability[2]}'),
                        subtitle: Text('Evening'),
                        trailing: (availability[2]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_reschedule(selectedDate,'East Hall',3),
                        enabled: (availability[3]=='Available'),
                        title: Text('${availability[3]}'),
                        subtitle: Text('Night'),
                        trailing: (availability[3]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    SizedBox(height: 10.0,),
                    Card(
                      child:ListTile(
                        title: Text('West Hall'),
                        trailing: Icon(Icons.business,color: Colors.cyan,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_reschedule(selectedDate,'West Hall',0),
                        enabled: (availability[4]=='Available'),
                        title: Text('${availability[4]}'),
                        subtitle: Text('Morning'),
                        trailing: (availability[4]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_reschedule(selectedDate,'West Hall',1),
                        enabled: (availability[5]=='Available'),
                        title: Text('${availability[5]}'),
                        subtitle: Text('Afternoon'),
                        trailing: (availability[5]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_reschedule(selectedDate,'West Hall',2),
                        enabled: (availability[6]=='Available'),
                        title: Text('${availability[6]}'),
                        subtitle: Text('Evening'),
                        trailing: (availability[6]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_reschedule(selectedDate,'West Hall',3),
                        enabled: (availability[7]=='Available'),
                        title: Text('${availability[7]}'),
                        subtitle: Text('Night'),
                        trailing: (availability[7]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                  ],
                );
              }else{
                return Loading();
              }
            }
        )
    );
  }
  _reschedule(DateTime date,String hall,int timeSlot)async{
    String docid = widget.docid??'';
    String eventName = widget.eventName??'';
    await DatabaseService().rescheduleEvent(docid, date, hall, timeSlot);
    Navigator.pop(context);
    String body = (eventName!=null)?'\'$eventName\' was rescheduled':'Event was rescheduled';
    await DatabaseService().sectionNotification(body, 'Halls');
  }

}
