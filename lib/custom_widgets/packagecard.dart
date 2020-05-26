import 'package:flutter/material.dart';
import 'package:flutter_learn/models/room.dart';


import 'edit_room_package.dart';

class PackageCard extends StatelessWidget {

  final RoomPackage package;


  PackageCard({
    @required this.package,
  });



  @override
  Widget build(BuildContext context) {
    void _updateRoomPackages({String docid}){
      showDialog(context: context, builder: (context){
        return Center(
          child: Container(
            height: 400.0,
            padding: EdgeInsets.all(10.0),
            child:EditRoomPackage(docid: docid,),
          ),
        );
      });
    }
    String type = this.package.type;
    String docid = this.package.docid;
    String price_b = this.package.price_b;
    String price_h = this.package.price_h;
    String price_f = this.package.price_f;
    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(15.0),
        onTap: ()=>_updateRoomPackages(docid: docid),
        trailing: Icon(Icons.edit,color: Colors.blue,),
        subtitle: Text('$type'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text ('Breakfast Only - $price_b LKR'),
            Text ('Half Board        - $price_h LKR'),
            Text ('Full Board         - $price_f LKR'),
          ],
        ),
      ),
    );
  }
}