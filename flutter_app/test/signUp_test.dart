
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/signUp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/signIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



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

/*

  //----------Third Test----------
  test("You Must Enter A Password",() async {

/*
    TextEditingController _emailcontroller = TextEditingController();
    _emailcontroller.text = "teifalharbi@kau.com";

    TextEditingController _passwordcontroller= TextEditingController();
    _passwordcontroller.text = "teif123456";


    var result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: _emailcontroller.text,
        password: _passwordcontroller.text);


 */
    //variable
    TextEditingController _firstNamecontroller = TextEditingController();
    _firstNamecontroller.text = "teif";

    TextEditingController _lastNamecontroller = TextEditingController();
    _lastNamecontroller.text = "alharbi";

    TextEditingController _phoneNOcontroller = TextEditingController();
    _phoneNOcontroller.text = "0546792468";

  TextEditingController _emailcontroller = TextEditingController();
 _emailcontroller.text = "teifalharbi@kau.com";

    TextEditingController _gendercontroller = TextEditingController();
    _gendercontroller.text = "female";

    TextEditingController _passwordcontroller = TextEditingController();
    _passwordcontroller.text = "teif123456";

    TextEditingController _CVDTypecontroller = TextEditingController();
    _CVDTypecontroller.text = "Red_Green (Deutran)";


    //call the method and assign a value to it

    //p.s the id is just a random number to test
    String information = SignUp.addToFirebase("123456789e2sqw", _firstNamecontroller,
        _lastNamecontroller, _phoneNOcontroller, _emailcontroller, _gendercontroller, _CVDTypecontroller);


    //check if the actual result matches the expected result
    expect(information,'User Successfully Added');
  });

 */




}