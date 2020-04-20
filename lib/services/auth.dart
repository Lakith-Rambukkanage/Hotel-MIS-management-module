import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/authenticate/signin.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create custom user object based on the returned firebase user
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(id: user.uid) :null;
  }

  //auth change FirebaseUser stream converted to a User stream of custom user model
  Stream<User> get user{
    //return _auth.onAuthStateChanged.map((FirebaseUser user)=>_userFromFirebaseUser(user)); 
    //same as above
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
  //signin anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser fireUser = result.user;
      print(fireUser.toString());
      User user =_userFromFirebaseUser(fireUser);
      return user;
    } catch (e) {
      print('error-read next');
      print(e.toString());
      return null;
    }
  }

  //signin email & password

  //sig up with email and password

  //signout
  Future SignOut () async{
    try {
      return await _auth.signOut();
    } catch (e) {
      print('error - sign out');
      print(e.toString());
      return null;
    }
  } 
}