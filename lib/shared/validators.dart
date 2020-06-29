class EmailFieldValidator{
  static String validate(String value){
    if (value.isEmpty){
      return 'Enter Your Email';
    }else if (value.contains('@')){
      return null;
    }else{
      return 'Enter valid Email';
    }
  }
}
class PasswordFieldValidator{
  static String validate(String value){
    if(value.isEmpty){
      return 'Enter Your Password';
    }else if (value.length<6){
      return 'Password should be at least 6 characters long';
    }else{
      return null;
    }
  }
}

class NameFieldValidator{
  static String validate(String value){
    return value.isEmpty? 'Enter Your Name':null;
  }
}

class ContactFieldValidator{
  static String validate(String value){
    return value.length!=10? 'Enter valid Contact No':null;
  }
}