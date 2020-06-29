

class User {
  String uid;
  String email;


  User({String uid,String name,String email}){
    this.uid=uid;
    this.email = email;
  }
}


class UserData {
  String uid;
  String name;
  String email;
  String mobileNo;
  String jobTitle;
  String section;
  bool activeStatus;
  bool userEnabled;

  UserData({String uid,String name,String email,String mobileNo,String jobTitle,String section,bool activeStatus,bool userEnabled}){
    this.uid=uid;
    this.name = name;
    this.email = email;
    this.mobileNo = mobileNo;
    this.jobTitle = jobTitle;
    this.section = section;
    this.activeStatus = activeStatus;
    this.userEnabled = userEnabled;
  }
}