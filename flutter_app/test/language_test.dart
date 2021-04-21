
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/language.dart';


main(){


  //----------First Test----------
  test("Switch Between Arabic/English --> Arabic",(){

    //1-variable
    int arabicLanguageNum = 2;

    //2-call the method and assign a value to it
    String actualLanguage = language.translate(arabicLanguageNum);

    //3-check if the actual result matches the expected result
    expect(actualLanguage,'اختر اللغة');
  });

  //----------Second Test----------
  test("Switch Between Arabic/English --> English",(){

    //1-variable
    int arabicLanguageNum = 0;

    //2-call the method and assign a value to it
    String expectedLanguage = language.translate(arabicLanguageNum);

    //3-check if the actual result matches the expected result
    expect(expectedLanguage,'Choose language');
  });

}


