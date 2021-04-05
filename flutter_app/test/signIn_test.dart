import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/signIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/aboutISee.dart';
import 'package:flutter_app/Camera.dart';
import 'package:flutter_app/signUp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

/*
class MokeFirebaseAuth extends Mock implements FirebaseAuth{}
class MokeFirebaseUser  extends Mock implements FirebaseApp{}
class MockAuthResult extends Mock implements AuthCredential{}


 */



main(){

  /*
  MokeFirebaseAuth _auth = MokeFirebaseAuth();
  BehaviorSubject<MokeFirebaseUser> user = BehaviorSubject<MokeFirebaseUser>();
  SignIn _repo = SignIn.userCheck(_emailcontroller, _passwordcontroller, context)


   */

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


  /*
  //----------Second Test----------
  test("You Must Be Registered To Enter",() async {
    //variable


    TextEditingController _emailcontroller = TextEditingController();
    _emailcontroller.text = "bazb@gmail.com";

    TextEditingController _passwordcontroller= TextEditingController();
    _passwordcontroller.text = "Bayan300";

    BuildContext context;

   // final _formkey = GlobalKey<FormState>();


   bool correctUser =  await SignIn.userCheck(_emailcontroller ,  _passwordcontroller , context);


     // if (_formkey.currentState.validate()) {
        expect(correctUser, 'true');
     // }


   // var correctUser = SignIn.userCheck(_emailcontroller, _passwordcontroller, context) ;
    //check if the actual result matches the expected result

  });

   */


}