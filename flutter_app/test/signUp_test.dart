
import 'package:flutter_app/signUp.dart';
import 'package:flutter_test/flutter_test.dart';




main(){


  //----------First Test----------
  test("You Must Enter a Correct Email Format",(){

    //variable
    String email = "bayan#baz";

    //call the method and assign a value to it
    String enteredEmail = signUp.validateEmailFormat(email);

    //check if the actual result matches the expected result
    expect(enteredEmail,'The Email is badly formatted.');
  });

  //----------Second Test----------
  test("You Must Enter a Correct Password",(){

    //variable
    String password = "bfb12";

    //call the method and assign a value to it
    String enteredPassword =  signUp.validatePasswordFormat(password);

    //check if the actual result matches the expected result
    expect(enteredPassword,'Password should be at least 6 characters');
  });


}