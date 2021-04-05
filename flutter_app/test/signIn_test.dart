
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/signIn.dart';




main(){

  //----------First Test----------
  test("You Must Enter An Email",(){

    //variable
    String email = "teifalharbi@gmail.com";

    //call the method and assign a value to it
    String enteredEmail = signIn.validateEmail(email);

    //check if the actual result matches the expected result
    expect(enteredEmail,null);
  });

  //----------Second Test----------
  test("You Must Enter A Password",(){

    //variable
    String password = "";

    //call the method and assign a value to it
    String enteredPassword =  signIn.validatePassword(password);

    //check if the actual result matches the expected result
    expect(enteredPassword,'Please Fill The Password Field');
  });


}