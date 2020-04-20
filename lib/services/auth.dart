import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //signin anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser fireUser = result.user;
      print(fireUser.toString());
      return fireUser;
    } catch (e) {
      print('error-read next');
      print(e.toString());
      return null;
    }
  }

  //signin email & password#

  //sig up with email and password

  //signout
}