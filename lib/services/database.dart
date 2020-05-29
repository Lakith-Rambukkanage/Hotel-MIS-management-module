import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learn/models/event.dart';
import 'package:flutter_learn/models/notification.dart';
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
  final CollectionReference itemsCollection = Firestore.instance.collection("items");
  final CollectionReference notificationsCollection = Firestore.instance.collection("notifications");
  final CollectionReference eventsCollection = Firestore.instance.collection("events");

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
//  UserData getUserDataByID(String uid){
//    UserData u;
//    staffUsersCollection.document(uid).get().then((snap){
//      if (snap.exists){
//      u= UserData(
//        uid:snap.documentID ,
//        name: snap.data['name']??'',
//        email: snap.data['email']??'',
//        mobileNo: snap.data['mobileNo']??'',
//        userEnabled: snap.data['userEnabled']??false,
//        activeStatus: snap.data['activeStatus']??false,
//        jobTitle: snap.data['jobTitle']??'',
//        section: snap.data['section']??'',
//      );}else{
//        u= UserData(
//          uid:'' ,
//          name: 'Error retrieving User',
//          email: '',
//          mobileNo: '',
//          userEnabled: false,
//          activeStatus: false,
//          jobTitle: '',
//          section: '',
//        );
//      }
//    });
//    return u;
//  }


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

  Future staffSectionChange({String uid,String section,bool userEnabled}) async {
    return await staffUsersCollection.document(uid).updateData({
      'section' : section,
      'userEnabled' : userEnabled,
    });
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

  //to get order list snapshots
  Stream<List<OrderDetail>> get ordersList{
    return ordersCollection.snapshots().map(_ordersListFromSnapshot);
  }
  //to convert orders in the list in to order detail model
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
  //to convert offers in the list in to offer model
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
        docid: doc.documentID??'',
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
          available: snap.data['available'] ?? false,
          name: snap.data['name'] ?? '',
          //description: snap.data['description'] ?? '',
          persons: snap.data['persons'] ?? 1,
          price: snap.data['price'] ?? '',
          category: snap.data['category'] ?? '',
          image: snap.data['image'] ?? '',
        quantity: item['quantity']??1,
      );
      offerItems.add(offerItem);
    }
    return offerItems;
  }



  //to get items list snapshots by category
  Stream<List<Item>> getItemListByCategory(){
    return itemsCollection.where('available', isEqualTo: true).snapshots().map(_itemListFromSnapshot);
  }
  //to convert items in the list in to item model
  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Item(
        docid: doc.documentID,
        name:doc.data['name']??'',
        category:doc.data['category']??'',
        price:doc.data['price']??0,
        persons:doc.data['persons']??1,
        available:doc.data['available']??false,
        image:doc.data['image']??0,
        quantity: 0,
      );
    }).toList();
  }

  Future addNewOffer(String name,List items,int price,Timestamp validTill) async {
    return await specialOffersCollection.add({
      'name' : name,
      'items' : items,
      'sold' : 0,
      'price' : price,
      'validTill' : validTill,
    });
  }
  Future extendOffer(String docid,Timestamp validTill) async {
    return await specialOffersCollection.document(docid).updateData({
      'validTill' : validTill,
    });
  }
  Future deleteOffer(String docid)async{
    return await specialOffersCollection.document(docid).delete();
  }

  //Notifications handling
  //to get notification list snapshots
  Stream<List<NotificationModel>> notificationList(){
    return notificationsCollection.where('softDelete', isEqualTo: false).snapshots().map(_notificationListFromSnapshot);
  }
  //to convert notification in the list in to notification model
  List<NotificationModel> _notificationListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return NotificationModel(
        docid: doc.documentID,
        recID:doc.data['recID']??'',
        recName:doc.data['recName']??'',
        senderID:doc.data['senderID']??'',
        senderName:doc.data['senderName']??'',
        read:doc.data['read']??false,
        softDelete:doc.data['softDelete']??false,
        body: doc.data['body']??'Error retrieving message',
        type: doc.data['senderID']??'',
        sentDate: doc.data['sentDate'].toDate()??'',
      );
    }).toList();
  }
  Future sendNotification(String body,String senderID,String recID) async {
    //document refernce
    DocumentReference send = staffUsersCollection.document(senderID);
    var snap = await send.get();
    String sName = snap.data['name'];
    DocumentReference rec = staffUsersCollection.document(recID);
    var snapr = await rec.get();
    String rName = snapr.data['name'];
    return await notificationsCollection.add({
      'body' : body,
      'senderID' : senderID,
      'senderName' : sName,
      'recID' : recID,
      'recName' :rName,
      'read' : false,
      'softDelete' : false,
      'sentDate' : Timestamp.fromDate(DateTime.now()),
    });
  }

  Future markAsRead(String docid) async {
    return await notificationsCollection.document(docid).updateData({
      'read' : true,
    });
  }
  Future softDelete(String docid) async {
    return await notificationsCollection.document(docid).updateData({
      'softDelete' : true,
    });
  }
  Future sectionNotification(String body,String senderName) async {
    return await notificationsCollection.add({
      'body' : body,
      'senderID' : 'section',
      'senderName' : senderName,
      'recID' : 'section receiver',
      'recName' :'intended',
      'read' : false,
      'softDelete' : false,
      'sentDate' : Timestamp.fromDate(DateTime.now()),
    });
  }

  //events Handling
  //to get events list snapshots by date
  Stream<List<EventModel>> getEventsListByDate(DateTime date){
    return eventsCollection.where('eventDate', isEqualTo: Timestamp.fromDate(date)).snapshots().map(_eventsListFromSnapshot);
  }

  //to get events list snapshots by date
  Stream<List<EventModel>> getEventsList(){
    return eventsCollection.snapshots().map(_eventsListFromSnapshot);
  }
  //to get events list snapshots upcoming
  Stream<List<EventModel>> getUpcomingEventsList(){
    DateTime date= DateTime.now();//todo:check greater than add and subtract and check for yesterday today and tom
    return eventsCollection.where('eventDate', isGreaterThanOrEqualTo: Timestamp.fromDate(date)).snapshots().map(_eventsListFromSnapshot);
  }
  //to convert events in the list in to event model
  List<EventModel> _eventsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      DateTime date = doc.data['eventDate'].toDate()??'';
      return EventModel(
        docid: doc.documentID,
        eventName:doc.data['eventName']??'',
        eventDate :date??'',
        hall: doc.data['hall']??'',
        timeSlot: doc.data['timeSlot']??0,
        contactNo: doc.data['contactNo']??'',
        customerName: doc.data['customerName']??'',
        email: doc.data['email']??'',
      );
    }).toList();
  }

  Future addEvent(EventModel event) async {
    Timestamp timestamp = Timestamp.fromDate(event.eventDate);
    return await eventsCollection.add({
      'eventName' : event.eventName,
      'hall' : event.hall,
      'email' : event.email,
      'customerName' : event.customerName,
      'contactNo' : event.contactNo,
      'eventDate' : timestamp,
      'timeSlot' : event.timeSlot,
    });
  }
  Future deleteEvent(String docid)async{
    return await eventsCollection.document(docid).delete();
  }
  Stream<EventModel> get eventById{
    return eventsCollection.document(docid).snapshots()
        .map(_eventFromSnapShot);
  }

  EventModel _eventFromSnapShot(DocumentSnapshot snapshot) {
    DateTime date = snapshot.data['eventDate'].toDate()??'';
    return EventModel(
      docid: snapshot.documentID,
      eventName:snapshot.data['eventName']??'',
      eventDate :date??'',
      hall: snapshot.data['hall']??'',
      timeSlot: snapshot.data['timeSlot']??0,
      contactNo: snapshot.data['contactNo']??'',
      customerName: snapshot.data['customerName']??'',
      email: snapshot.data['email']??'',
    );
  }
}