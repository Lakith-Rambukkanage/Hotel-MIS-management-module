import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/calendaricon.dart';
import 'package:flutter_learn/custom_widgets/hometile.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/pages/home/checkevent.dart';

class ViewEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableScreen(
      appBarTitle: 'Events', 
      propic: 'dummypropic.png',
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children :<Widget>[
        GestureDetector(
          onTap: (){
                        Navigator.push(context,new MaterialPageRoute(
                        builder: (context)=>
                        new CheckEvent())
                        );
                      },
                  child: HomeTile(
                children : <Widget>[ 
                  Container(width: 6.0,height: 80.0 ,color: Colors.green,),
                  Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Wedding @ 03.00 p.m', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                    Text('George Hall ', style: TextStyle(color: Colors.cyan, fontSize: 18.0),),
                    SizedBox(height: 5.0,),
                    Text("In charge : Polly Grey", style: TextStyle(color: Colors.white, fontSize: 18.0 ),),
                  ],
                 ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CalendarIcon(month: 'Apr', date: '20'),
                )  
                ]
            ),
        ),
          SizedBox(height: 10.0,),
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 80.0 ,color: Colors.green,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('BBQ @ 08.00 p.m', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('Pool Area ', style: TextStyle(color: Colors.cyan, fontSize: 18.0),),
                  SizedBox(height: 5.0,),
                  Text("In charge : Hugh Lane", style: TextStyle(color: Colors.white, fontSize: 18.0 ),),
                ],
               ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CalendarIcon(month: 'Apr', date: '21'),
              )  
              ]
          ),
                    SizedBox(height: 10.0,),
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 80.0 ,color: Colors.amber,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Wedding @ 03.00 p.m', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('George Hall ', style: TextStyle(color: Colors.cyan, fontSize: 18.0),),
                  SizedBox(height: 5.0,),
                  Text("In charge : Polly Grey", style: TextStyle(color: Colors.white, fontSize: 18.0 ),),
                ],
               ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CalendarIcon(month: 'Apr', date: '24'),
              )  
              ]
          ),
                    SizedBox(height: 10.0,),
          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 80.0 ,color: Colors.amber,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('\'IOTA\' @9.00 a.m', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('East Hall ', style: TextStyle(color: Colors.cyan, fontSize: 18.0),),
                  SizedBox(height: 5.0,),
                  Text("In charge : Anna Kendrik", style: TextStyle(color: Colors.white, fontSize: 18.0 ),),
                ],
               ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CalendarIcon(month: 'Apr', date: '24'),
              )  
              ]
          ),
                    SizedBox(height: 10.0,),

          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 80.0 ,color: Colors.blue,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Party @ 03.00 p.m', style: TextStyle(color: Colors.white, fontSize: 20.0 ),),
                  Text('Pool side ', style: TextStyle(color: Colors.cyan, fontSize: 18.0),),
                  SizedBox(height: 5.0,),
                  Text("In charge : Liam White", style: TextStyle(color: Colors.white, fontSize: 18.0 ),),
                ],
               ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CalendarIcon(month: 'Apr', date: '27'),
              )  
              ]
          ),
                    SizedBox(height: 10.0,),

          HomeTile(
              children : <Widget>[ 
                Container(width: 6.0,height: 80.0 ,color: Colors.red,),
                Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Conference @ 10.00 a.m', style: TextStyle(color: Colors.white, fontSize: 18.0 ),),
                  Text('Richard Hall ', style: TextStyle(color: Colors.cyan, fontSize: 18.0),),
                  SizedBox(height: 5.0,),
                  Text("In charge : Niel Jackson", style: TextStyle(color: Colors.white, fontSize: 18.0 ),),
                ],
               ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CalendarIcon(month: 'Mar', date: '01'),
              )  
              ]
          ),
      ],
      )
    );
  }
}