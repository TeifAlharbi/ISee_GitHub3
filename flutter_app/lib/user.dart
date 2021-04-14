import 'package:flutter/material.dart';

class user{

  //variables
  TextEditingController _firstNamecontroller = TextEditingController();
  TextEditingController _lastNamecontroller = TextEditingController();
  TextEditingController _phoneNOcontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _gendercontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _CVDTypecontroller = TextEditingController();
  TextEditingController _lastTestDatecontroller = TextEditingController();
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _testResultcontroller = TextEditingController();
  TextEditingController _correctAnswerscontroller = TextEditingController();
  TextEditingController _incorrectAnswerscontroller = TextEditingController();

  //getter
  TextEditingController get getFirstNamecontroller => _firstNamecontroller;
  TextEditingController get getLastNamecontroller => _lastNamecontroller;
  TextEditingController get getPhoneNOcontroller => _phoneNOcontroller;
  TextEditingController get getEmailcontroller => _emailcontroller;
  TextEditingController get getGendercontroller => _gendercontroller;
  TextEditingController get getPasswordcontroller => _passwordcontroller;
  TextEditingController get getCVDTypecontroller  => _CVDTypecontroller ;
  TextEditingController get getLastTestDatecontroller  => _lastTestDatecontroller ;
  TextEditingController get getDatecontroller  => _datecontroller ;
  TextEditingController get getTestResultcontroller => _testResultcontroller ;
  TextEditingController get getCorrectAnswerscontroller  => _correctAnswerscontroller ;
  TextEditingController get getIncorrectAnswerscontroller  => _incorrectAnswerscontroller ;

}