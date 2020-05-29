import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/models/event.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:intl/intl.dart';

class SheduleEvent extends StatefulWidget {
  @override
  _SheduleEventState createState() => _SheduleEventState();
}

class _SheduleEventState extends State<SheduleEvent> {

  DateTime selectedDate = DateTime.now();
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
        appBarTitle: 'Schedule Event',
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
              List<EventModel> eastHallEventsList = eventsList.where((e)=>(e.hall=='East Hall')).toList();
              List<EventModel> westHallEventsList = eventsList.where((e)=>(e.hall=='West Hall')).toList();
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
                        onTap: ()=>_showScheduleForm(selectedDate,'East Hall',0),
                        enabled: (availability[0]=='Available'),
                        title: Text('${availability[0]}'),
                        subtitle: Text('Morning'),
                        trailing: (availability[0]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_showScheduleForm(selectedDate,'East Hall',1),
                        enabled: (availability[1]=='Available'),
                        title: Text('${availability[1]}'),
                        subtitle: Text('Afternoon'),
                        trailing: (availability[1]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_showScheduleForm(selectedDate,'East Hall',2),
                        enabled: (availability[2]=='Available'),
                        title: Text('${availability[2]}'),
                        subtitle: Text('Evening'),
                        trailing: (availability[2]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_showScheduleForm(selectedDate,'East Hall',3),
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
                        onTap: ()=>_showScheduleForm(selectedDate,'West Hall',0),
                        enabled: (availability[4]=='Available'),
                        title: Text('${availability[4]}'),
                        subtitle: Text('Morning'),
                        trailing: (availability[4]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_showScheduleForm(selectedDate,'West Hall',1),
                        enabled: (availability[5]=='Available'),
                        title: Text('${availability[5]}'),
                        subtitle: Text('Afternoon'),
                        trailing: (availability[5]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_showScheduleForm(selectedDate,'West Hall',2),
                        enabled: (availability[6]=='Available'),
                        title: Text('${availability[6]}'),
                        subtitle: Text('Evening'),
                        trailing: (availability[6]=='Available')?Icon(Icons.send):Icon(Icons.not_interested,color: Colors.red,),
                      ) ,
                    ),
                    Card(
                      child:ListTile(
                        onTap: ()=>_showScheduleForm(selectedDate,'West Hall',3),
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
  _showScheduleForm(DateTime date,String hall,int timeSlot){
    Navigator.push(context,new MaterialPageRoute(
        builder: (context)=>
        new EventForm(date: date,hall: hall,timeSlot: timeSlot,))
    );
  }

}

class EventForm extends StatefulWidget {
  final String hall;
  final DateTime date;
  final int timeSlot;

  const EventForm({Key key, this.hall, this.date, this.timeSlot}) : super(key: key);
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  //text field state
  String eventName = '';
  String customerName = '';
  String email = '';
  String contactNo = '';

  //error
  String error = '';

  //form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(widget.date);
    String slot = '';
    switch (widget.timeSlot) {
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
    return ReusableScreen(
      appBarTitle: 'Schedule Event',
      propic: 'dummypropic.png',
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10.0),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Hall : ${widget.hall}'),
                              SizedBox(height: 10.0,),
                              Text('Date : $formattedDate'),
                              SizedBox(height: 10.0,),
                              Text('Time Slot : $slot'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        validator: (val) =>val.isEmpty? 'Enter Event Name':null,
                        onChanged: (val){
                          setState( () => eventName = val );
                          //print(email);
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Event Name',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        validator: (val) =>val.isEmpty? 'Enter Customer Name':null,
                        onChanged: (val){
                          setState( () => customerName = val );
                          //print(email);
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Customer Name',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        validator: (val) =>val.isEmpty? 'Enter Email Address to contact':null,
                        onChanged: (val){
                          setState( () => email = val );
                          //print(email);
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        //controller: _controller,
                          onChanged:(val){
                            setState( () => contactNo = val );
                          },
                          validator: (val) => val.length!=10? 'Enter valid Contact No':null,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Customer Contact No',
                              labelStyle: TextStyle(color: Colors.grey,),
                          )
                      ),
                      SizedBox(height: 10.0,),
                      RaisedButton(
                          child: Text('Create Event', style: TextStyle(color: Colors.white),),
                          color: Colors.cyan.withOpacity(0.7),
                          onPressed: () async {
                            if (_formKey.currentState.validate()){
                              EventModel event = EventModel(
                                docid: '',
                                timeSlot: widget.timeSlot??0,
                                email: email,
                                customerName: customerName,
                                contactNo: contactNo,
                                hall: widget.hall,
                                eventDate: widget.date,
                                eventName: eventName,
                              );
                              dynamic result = await DatabaseService().addEvent(event);
                                if (result==null){
                                  setState(() {error = 'Please Enter Valid Details and Check Connectivity';});
                                }else{
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                            }
                          }
                      ),
                      SizedBox(height: 5.0,),
                      Text(error,textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
