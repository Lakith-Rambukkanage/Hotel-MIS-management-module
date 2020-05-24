import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:flutter_learn/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference staffUsersCollection = Firestore.instance.collection('staff-users');
  final CollectionReference roomDetailsCollection = Firestore.instance.collection("room-details");
  final CollectionReference tablesCollection = Firestore.instance.collection("tables");
  final CollectionReference ordersCollection = Firestore.instance.collection("orders");

  Future updateUserData(String name,String email,String mobileNo, String jobTitle, String section,bool activeStatus,bool userEnabled) async {
    return await staffUsersCollection.document(uid).setData({
      'name' : name,
      'email' : email,
      'mobileNo' : mobileNo,
      'jobTitle' : jobTitle,
      'section' : section,
      'activeStatus' : activeStatus,
      'userEnabled' : userEnabled,
    });
  }

  Future updateUserActiveStatus(bool activeStatus) async {

    return await staffUsersCollection.document(uid).updateData({
      'activeStatus' : activeStatus,
    });
  }

  Stream<UserData> get userData{
    return staffUsersCollection.document(uid).snapshots()
        .map(_userDataFromSnapShot);
  }

   UserData _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      email: snapshot.data['email']??'',
      mobileNo: snapshot.data['mobileNo']??'',
      name: snapshot.data['name']??'',
      jobTitle: snapshot.data['jobTitle'] ??'',
      section: snapshot.data['section'] ??'',
      activeStatus: snapshot.data['activeStatus']??false,
      userEnabled: snapshot.data['userEnabled']??false,
    );
  }

  //staff pages database requests

  //to get stafflist snapshots
  Stream<List<Staff>> get staffList{
    return staffUsersCollection.snapshots().map(_staffListFromSnapshot);
  }
  //to convert staff list in to staff model
  List<Staff> _staffListFromSnapshot(QuerySnapshot snapshot){
        return snapshot.documents.map((doc){
          return Staff(
            uid: doc.documentID,
            name: doc.data['name']??'',
            email: doc.data['email']??'',
            mobileNo: doc.data['mobileNo']??'',
            section: doc.data['section']??'' ,
            jobTitle: doc.data['jobTitle'] ??'',
            activeStatus: doc.data['activeStatus']??false,
            userEnabled: doc.data['userEnabled']??false,
          );
        }).toList();
  }
  //Rooms database Requests

  //to get room detail list snapshots
  Stream<List<RoomDetail>> get roomDetailList{
    return roomDetailsCollection.snapshots().map(_roomDetailListFromSnapshot);
  }
  //to convert rooms in the list in to room detail model
  List<RoomDetail> _roomDetailListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return RoomDetail(
        docid: doc.documentID,
        bedid:doc.data['id']??0,
        type: doc.data['type']??'',
        bed : doc.data['bed']??'',
        booked: doc.data['booked']??false,
        booked_till: doc.data['booked_till']??'not booked',
      );
    }).toList();
  }

  //Tables database Requests

  //to get tables  list snapshots
  Stream<List<TableDetail>> get tablesList{
    return tablesCollection.snapshots().map(_tablesListFromSnapshot);
  }
  //to convert rooms in the list in to room detail model
  List<TableDetail> _tablesListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      print(doc);
      return TableDetail(
        id: doc.documentID,
        table_no:doc.data['table_no']??0,
        no_of_seats: doc.data['no_of_seats']??0,
        activeStatus: doc.data['activeStatus']??false,
      );
    }).toList();
  }
  //Orders database Requests

  //to get tables  list snapshots
  Stream<List<OrderDetail>> get ordersList{
    return ordersCollection.snapshots().map(_ordersListFromSnapshot);
  }
  //to convert rooms in the list in to room detail model
  List<OrderDetail> _ordersListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return OrderDetail(
        status:doc.data['status']??'placed',
        total: doc.data['total']??0,
      );
    }).toList();
  }
}