import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learn/models/restaurentmodels.dart';
import 'package:flutter_learn/models/room.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:flutter_learn/models/user.dart';

class DatabaseService {

  final String uid;
  final String docid;
  DatabaseService({this.uid,this.docid});

  //collection reference
  final CollectionReference staffUsersCollection = Firestore.instance.collection('staff-users');
  final CollectionReference roomDetailsCollection = Firestore.instance.collection("room-details");
  final CollectionReference tablesCollection = Firestore.instance.collection("tables");
  final CollectionReference ordersCollection = Firestore.instance.collection("orders");
  final CollectionReference roomsCollection = Firestore.instance.collection("rooms");
  final CollectionReference specialOffersCollection = Firestore.instance.collection("special-offers");

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

  Future editUserData({String username,String mobileNo}) async {
    return await staffUsersCollection.document(uid).updateData({
      'name' : username,
      'mobileNo' : mobileNo,
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

  Stream<List<RoomPackage>> get roomPackageList{
    return roomsCollection.snapshots().map(_roomPackageListFromSnapshot);
  }
  //to convert rooms in the list in to room detail model
  List<RoomPackage> _roomPackageListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return RoomPackage(
        docid: doc.documentID,
        type: doc.data['type']??'',
        price_b : doc.data['price_b']??'',
        price_h : doc.data['price_h']??'',
        price_f : doc.data['price_f']??'',
      );
    }).toList();
  }
  Stream<RoomPackage> get roomPackage{
    return roomsCollection.document(docid).snapshots()
        .map(_roomPackageFromSnapShot);
  }

  RoomPackage _roomPackageFromSnapShot(DocumentSnapshot snapshot) {
    return RoomPackage(
      docid: snapshot.documentID,
      type: snapshot.data['type']??'',
      price_b : snapshot.data['price_b']??'',
      price_h : snapshot.data['price_h']??'',
      price_f : snapshot.data['price_f']??'',
    );
  }

  Future updateRoomPackage({String price_b,String price_h,String price_f}) async {
    return await roomsCollection.document(docid).updateData({
      'price_b' : price_b,
      'price_h' : price_h,
      'price_f' : price_f,
    });
  }
  //Tables database Requests

  //to get tables  list snapshots
  Stream<List<TableDetail>> get tablesList{
    return tablesCollection.snapshots().map(_tablesListFromSnapshot);
  }
  //to convert rooms in the list in to room detail model
  List<TableDetail> _tablesListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
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
  //Special offers database Requests

  //to get offers  list snapshots
  Stream<List<Offer>> get offersList{
    return specialOffersCollection.snapshots().map(_offersListFromSnapshot);
  }
  //to convert rooms in the list in to room detail model
  List<Offer> _offersListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      //print(doc.data['items']);
//      List items = doc.data['items'];
//      for (var i = 0 ; i <items.length; i++){
//        print(items[i]['quantity']);
//      }
      //Future<List> itemsList =  getOfferItems(doc.data['items']);
      //print(itemsList);
      return Offer(
        items: doc.data['items']??[],
        name: doc.data['name']??'',
        price: doc.data['price']??0,
        sold: doc.data['sold']??0,
        validTill: doc.data['validTill']??'',
      );
    }).toList();
  }

//  Item _itemFromDocumentReference({DocumentReference d,int quantity}){
//    d.snapshots().map((d)=>(_itemFromSnapShot));
//
//  }
//  Item _itemFromSnapShot(DocumentSnapshot snapshot) {
//    return Item(
//      docid: snapshot.documentID,
//      available: snapshot.data['available'] ?? true,
//      category: snapshot.data['category'] ?? '',
//      name: snapshot.data['name'] ?? '',
//      persons: snapshot.data['persons'] ?? 1,
//      price: snapshot.data['price'] ?? 0,
//      quantity:0,
//    );
//  }

  Future<List<Item>> getOfferItems(List items) async{
    List<Item> offerItems=[];
    for (var item in items){
      var snap = await item['item'].get();
      Item offerItem=Item(
          docid: snap.documentID,
          available: snap.data['available'] ?? '',
          name: snap.data['name'] ?? '',
          //description: snap.data['description'] ?? '',
          persons: snap.data['persons'] ?? '',
          price: snap.data['price'] ?? '',
          category: snap.data['category'] ?? '',
          image: snap.data['image'] ?? '',
        quantity: item['quantity']
      );
      offerItems.add(offerItem);
    }
    return offerItems;
  }
}