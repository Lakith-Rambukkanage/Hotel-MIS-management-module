import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference staffUsersCollection = Firestore.instance.collection('staff-users');

  Future updateUserData(String name, String jobTitle) async {
    return await staffUsersCollection.document(uid).setData({
      'name' : name,
      'jobTitle' : jobTitle,
    });
  }

  //get streams of snapshots
  //Stream<QuerySnapshot> get U
}