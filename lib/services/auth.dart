import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/services/database.dart';

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
      FirebaseUser firebaseUser = result.user;
      print(firebaseUser.toString());
      User user =_userFromFirebaseUser(firebaseUser);
      return user;
    } catch (e) {
      print('error-sign in anon');
      print(e.toString());
      return null;
    }
  }

  //signin email & password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult authresult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = authresult.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print('Sign in error');
      print(e.toString());
      return null;
    }
  }
  //register with email and password
  Future registerNewUser(String email,String password, String name, String jobTitle) async{
    try{
      AuthResult authresult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = authresult.user;
      await DatabaseService(uid: firebaseUser.uid).updateUserData(name, jobTitle);
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
        print('Reister error');
        print(e.toString());
        return null;
    }
  }

  //signout
  Future signOut () async{
    try {
      return await _auth.signOut();
    } catch (e) {
      print('error - sign out');
      print(e.toString());
      return null;
    }
  } 
}