import 'package:flutter_app/IshiharaTestPlates.dart';
import 'package:flutter_test/flutter_test.dart';


main(){

  //***************** Drop Down Menu *****************

  //----------First Test----------
  test("Drop-Down Menu Empty Selection",(){

    //variable
    String choice = "";

    //call the method and assign a value to it
    bool value = IshiharaTestPlates.testUserSelection(choice);

    //check if the actual result matches the expected result
    expect(value,false);
  });


  //----------Second Test----------
  test("Drop-Down Menu Correct Selection",(){

    //variable
    String choice = "4";

    //call the method and assign a value to it
    bool value = IshiharaTestPlates.testUserSelection(choice);

    //check if the actual result matches the expected result
    expect(value,true);
  });


  //----------Second Test----------
  test("Drop-Down Menu Wrong Selection",(){

    //variable
    String choice = "20";

    //call the method and assign a value to it
    bool value = IshiharaTestPlates.testUserSelection(choice);

    //check if the actual result matches the expected result
    expect(value,false);
  });



  //***************** Ishihara Test Result *****************


  //----------Fourth Test----------
  test("Test Result Normale",(){

    //variables
    int wrongAnswersCounter = 2 ;
    String page11_choice1 = "4";
    String page11_choice2 = "2";

    //call the method and assign a value to it
    String CVDType = IshiharaTestPlates.ishiharaTestResult(wrongAnswersCounter, page11_choice1, page11_choice2);

    //check if the actual result matches the expected result
    expect(CVDType,'Normal vision');
  });

  //----------Fifth Test----------
  test("Test Result Red_Green (Protan)",(){

    //variables
    int wrongAnswersCounter = 7 ;
    String page11_choice1 = "Nothing";
    String page11_choice2 = "2";

    //call the method and assign a value to it
    String CVDType = IshiharaTestPlates.ishiharaTestResult(wrongAnswersCounter,
        page11_choice1, page11_choice2);

    //check if the actual result matches the expected result
    expect(CVDType,'Protanopia');
  });


  //----------Sixth Test----------
  test("Test Result Red_Green (Deutran)",(){

    //variables
    int wrongAnswersCounter = 9 ;
    String page11_choice1 = "4";
    String page11_choice2 = "Nothing";

    //call the method and assign a value to it
    String CVDType = IshiharaTestPlates.ishiharaTestResult(wrongAnswersCounter, page11_choice1, page11_choice2);

    //check if the actual result matches the expected result
    expect(CVDType,'Duetronopia');
  });





}







