
import 'package:flutter_test/flutter_test.dart';
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







