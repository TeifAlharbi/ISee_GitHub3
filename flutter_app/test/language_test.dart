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
import 'package:flutter_app/language.dart';


main(){


  //----------First Test----------
  test("Switch Between Arabic/English --> Arabic",(){

    //variable
    int arabicLanguageNum = 2;

    //call the method and assign a value to it
    String actualLanguage = language.translate(arabicLanguageNum);

    //check if the actual result matches the expected result
    expect(actualLanguage,'اختر اللغة');
  });


  /*
  //----------Second Test----------
  test("Switch Between Arabic/English --> English",(){

    //variable
    int arabicLanguageNum = 0;

    //call the method and assign a value to it
    String expectedLanguage = language.translate(arabicLanguageNum);

    //check if the actual result matches the expected result
    expect(expectedLanguage,'Choose language');
  });

   */


}