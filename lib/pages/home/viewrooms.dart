import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/normal_rooms_panel.dart';
import 'package:flutter_learn/custom_widgets/packagecard.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/seaside_rooms_panel.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/services/database.dart';
import 'package:flutter_learn/shared/loading.dart';
import 'package:provider/provider.dart';

class ViewRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ReusableScreen(
        appBarTitle: 'Rooms',
        propic: 'dummypropic.png',
        child: StreamProvider<List<RoomDetail>>.value(
          value: DatabaseService().roomDetailList,
          child:  Column(
            children: <Widget>[
              StreamBuilder<List<RoomPackage>>(
                  stream: DatabaseService().roomPackageList,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      List<RoomPackage> roomPackageList = snapshot.data;
                      return Container(
                        height: 250.0,
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                leading: Text('Rooms Packages',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
                                trailing: Icon(Icons.attach_money,color: Colors.green,),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: roomPackageList.length,
                                itemBuilder: (context, index) {
                                  return PackageCard(package: roomPackageList[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }else{
                      return Loading();
                    }
                  }),
              SizedBox(height: 20.0,),
              Card(
                child: ListTile(
                  leading: Text('Sea Side Rooms',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
                  trailing: Icon(Icons.beach_access,color: Colors.cyan,),
                ),
              ),
              SeasideRoomsPanel(),
              Card(
                child: ListTile(
                  leading: Text('Normal Rooms',style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),
                  trailing: Icon(Icons.photo_size_select_actual,color: Colors.cyan,),
                ),
              ),
              NormalRoomsPanel(),
            ],
          ),
        ));
  }
}