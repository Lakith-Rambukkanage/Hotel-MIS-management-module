import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learn/models/staff.dart';
import 'package:flutter_learn/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference staffUsersCollection = Firestore.instance.collection('staff-users');

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
            section: doc.data['section']??'' ,
            jobTitle: doc.data['jobTitle'] ??'',
            activeStatus: doc.data['activeStatus']??false,
            userEnabled: doc.data['userEnabled']??false,
          );
        }).toList();
  }


}