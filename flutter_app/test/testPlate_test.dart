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
import 'package:flutter_app/testPlate1.dart';


main(){


  //----------First Test----------
  test("Drop-Down Menu Empty Selection",(){

    //variable
    String choice = "";

    //call the method and assign a value to it
    bool value = testPlate1.testUserSelection(choice);

    //check if the actual result matches the expected result
    expect(value,false);
  });


  //----------Second Test----------
  test("Drop-Down Menu Correct Selection",(){

    //variable
    String choice = "4";

    //call the method and assign a value to it
    bool value = testPlate1.testUserSelection(choice);

    //check if the actual result matches the expected result
    expect(value,true);
  });

  //----------Third Test----------
  test("Drop-Down Menu Wrong Selection",(){

    //variable
    String choice = "20";

    //call the method and assign a value to it
    bool value = testPlate1.testUserSelection(choice);

    //check if the actual result matches the expected result
    expect(value,false);
  });






}







