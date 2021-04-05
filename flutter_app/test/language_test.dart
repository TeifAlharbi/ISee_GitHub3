
import 'package:flutter_test/flutter_test.dart';
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