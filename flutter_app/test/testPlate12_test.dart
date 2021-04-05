
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/testPlate12.dart';


main(){


  //----------First Test----------
  test("Test Result Normale",(){

    //variable
    int wrongAnswersCounter = 2 ;
    String page11_choice1 = "4";
    String page11_choice2 = "2";

    //call the method and assign a value to it
    String CVDType = TestPlate12.ishiharaTestResult(wrongAnswersCounter, page11_choice1, page11_choice2);

    //check if the actual result matches the expected result
    expect(CVDType,'Normal vision');
  });

  //----------Second Test----------
  test("Test Result Red_Green (Protan)",(){

    //variable
    int wrongAnswersCounter = 7 ;
    String page11_choice1 = "Nothing";
    String page11_choice2 = "2";

    //call the method and assign a value to it
    String CVDType = TestPlate12.ishiharaTestResult(wrongAnswersCounter, page11_choice1, page11_choice2);

    //check if the actual result matches the expected result
    expect(CVDType,'Red_Green (Protan)');
  });


  //----------Third Test----------
  test("Test Result Red_Green (Deutran)",(){

    //variable
    int wrongAnswersCounter = 9 ;
    String page11_choice1 = "4";
    String page11_choice2 = "Nothing";

    //call the method and assign a value to it
    String CVDType = TestPlate12.ishiharaTestResult(wrongAnswersCounter, page11_choice1, page11_choice2);

    //check if the actual result matches the expected result
    expect(CVDType,'Red_Green (Deutran)');
  });





}