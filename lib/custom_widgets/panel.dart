import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Panel {
  static Widget panel(List<Widget> children){
    Widget container = Container(
                decoration: new BoxDecoration(color: Colors.grey[800].withOpacity(0.9),borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:children
                ),
              );
    return container;
  }
  static Widget calendarIcon(String month, String date){
    Container container = Container(
                        decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(month,
                              style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey[800]
                              ),
                              ),
                              Text('$date',
                              style: TextStyle(
                              fontSize: 70.0,
                              color: Colors.grey[800]
                              ),
                              ),
                            ],
                          ),
                        ),
                      );
    return container;
  }

  static List<Widget> todayPanel (){
    List<Widget> containers = [Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text('Today',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white
                            ),
                          ),
                          Divider(
                            height: 20.0,
                            thickness: 10.0,
                            color: Colors.white,
                          ),        
                          Text('- Wedding hall-1 @3.00 pm',
                          style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white
                          ),
                          ),
                        ],
                        ),
                       ),
                      SizedBox(width: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Panel.calendarIcon('Apr','03'),
                      ),];
    return containers;
  }

  static List<Widget> staffPanel (){
    List<Widget> container = [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Staff',style: TextStyle(color: Colors.white, fontSize: 25.0)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 25.0,
                                            height: 80.0,
                                            child: const DecoratedBox(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.blue
                                                      ),
                                                    ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 25.0,
                                            height: 40.0,
                                            child: const DecoratedBox(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.cyan
                                                      ),
                                                    ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 25.0,
                                            height: 10.0,
                                            child: const DecoratedBox(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white
                                                      ),
                                                    ),
                                          ),
                                        ),
                                        SizedBox(height: 110.0,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Active', style: TextStyle(color: Colors.blue[300], fontSize: 18.0),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('On leave', style: TextStyle(color: Colors.cyan, fontSize: 18.0),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('AWOL', style: TextStyle(color: Colors.white, fontSize: 15.0),),
                                    ),
                                  ],
                                ),
                              ),
                              ];
    return container;
  } 
}