class User {
  String id;
  String employeeId;
  String userName;
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String jobtitle;
  String assignedSectionID; //crarfy
  String proPic; //crarfy  

  User({String id,String userName}){
    this.id=id;
    this.userName = userName;
  }

  //change profile settings
  changeProfileDetails({
    String newUserName,
    String newFirstName,
    String newLastName,
    String newEmail,
    String newPhoneNo,}){
    //db update
    //if success object update too//this.att=newAtt
    //fail return fail message and keep same for object too
  }

  //
}