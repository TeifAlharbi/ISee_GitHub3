import 'package:flutter/material.dart';
//import 'globals.dart' as globals;

class IshiharaTestPlates{

  TextEditingController _firstNumbercontroller = TextEditingController();
  TextEditingController _secondNumbercontroller = TextEditingController();
  String valueChoose1;
  String valueChoose2;
  List listItem = ["Nothing","0","1","2","3","4","5","6","7","8","9"];
  double finalResult;
 // double finalResult = (globals.correctAnswerCount * 100) / 12;


  //getter
  TextEditingController get getFirstNumbercontroller => _firstNumbercontroller;
  TextEditingController get getSecondNumbercontroller => _secondNumbercontroller;
}