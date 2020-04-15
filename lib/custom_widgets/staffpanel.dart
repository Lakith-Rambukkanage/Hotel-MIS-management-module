import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/hometile.dart';

class StaffPanel extends StatelessWidget {
  final int active;
  final int leave;
  final int awol;
  final String staff;

  const StaffPanel({
    @required this.active, 
    @required this.leave, 
    @required this.awol,
    @required this.staff
  });

  @override
  Widget build(BuildContext context) {
    int total = active + leave + awol;
    double activeheight = 100*active/total;
    double leaveheight = 100*leave/total;
    double awolheight = 100*awol/total;
    return HomeTile(
      children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('$staff',style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 25.0,
                            height: activeheight,
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
                            height: leaveheight,
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
                            height: awolheight,
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
                      child: Text('$active - Active', style: TextStyle(color: Colors.blue[300], fontSize: 18.0),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$leave - On leave', style: TextStyle(color: Colors.cyan, fontSize: 18.0),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$awol - AWOL', style: TextStyle(color: Colors.white, fontSize: 15.0),),
                    ),
                  ],
                ),
              ),]
    );
  }
}