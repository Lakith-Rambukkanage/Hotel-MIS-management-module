import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget{

  final String image;
  final String name;

  const SectionTile({ 
    @required this.image, 
    @required this.name});

  

  @override
  Widget build(BuildContext context) {
    return Container(
                      margin: EdgeInsets.all(10.0),
                      child : Stack(
                        alignment: AlignmentDirectional.center,
                        children : <Widget>[
                          Image(
                                image: AssetImage('assets/'+image),
                                //height: 200.0,
                                width: 350.0,
                              ),
                          Container(
                          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.8),borderRadius: BorderRadius.circular(10.0)),
                          padding: const EdgeInsets.all(10.0),
                          child: Text(name,style: TextStyle(fontSize: 30.0),),
                          ),
                        ]
                      ),
                    );
  }
  
}