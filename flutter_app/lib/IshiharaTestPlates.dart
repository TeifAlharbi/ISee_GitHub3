import 'package:flutter/material.dart';

class IshiharaTestPlates {
  TextEditingController _firstNumbercontroller = TextEditingController();
  TextEditingController _secondNumbercontroller = TextEditingController();
  String valueChoose1;
  String valueChoose2;
  List listItem = ["Nothing", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  double finalResult;

  //getter
  TextEditingController get getFirstNumbercontroller => _firstNumbercontroller;
  TextEditingController get getSecondNumbercontroller =>
      _secondNumbercontroller;

  static String ishiharaTestResult(
      int wrongAnswersCounter, String page11_choice1, String page11_choice2) {
    //less than or equal to three mistakes is a person with normal vision
    if (wrongAnswersCounter <= 3) {
      return "Normal vision";
      //otherwise is not normal vision
    } else if (wrongAnswersCounter >= 4) {
      //the actual plate number is 42, if the user only see 2 then he/she
      //is Protanopia
      if (page11_choice1 == "Nothing" && page11_choice2 == "2") {
        return "Protanopia";

        //if the user only see 4 then he/she is Duetronopia
      } else if (page11_choice1 == "4" && page11_choice2 == "Nothing") {
        return "Duetronopia";
      }
    }
  }

  static bool testUserSelection(String choice) {
    List listItem = [
      "Nothing",
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9"
    ];

    //user did not enter a value
    if (choice == null) {
      print("you must select a value");
      return false;

      //user entered a value
    } else if (choice != null) {
      //value found
      if (listItem.contains(choice)) {
        print("correctly select a value from the drop-down menu");
        return true;

        //value not found
      } else {
        print("please select a correct value from the drop-down menu");
        return false;
      }
    }
  }
}
