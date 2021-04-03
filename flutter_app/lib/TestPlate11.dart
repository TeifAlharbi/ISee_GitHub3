import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Test.dart';
import 'package:flutter_app/TestPlate1.dart';
import 'package:flutter_app/TestInstructions.dart';
import 'package:flutter_app/TestPlate10.dart';
import 'package:flutter_app/TestPlate12.dart';
import 'package:flutter_app/TestPlate3.dart';
import 'package:flutter_app/TestPlate5.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'globals.dart' as globals;

class TestPlate11 extends StatefulWidget {
  @override
  _TestPlate11 createState() => _TestPlate11();
}

//drop down menu variable
String valueChoose1;
String valueChoose2;
List listItem = ["Nothing","0","1","2","3","4","5","6","7","8","9"];


class  _TestPlate11 extends State<TestPlate11> {
  void initState() {
    super.initState();
  }
  //variables
  TextEditingController _firstNumbercontroller = TextEditingController();
  TextEditingController _secondNumbercontroller = TextEditingController();



  @override
  void dispose() {
    _firstNumbercontroller.dispose();
    _secondNumbercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;
    double screenText = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/fram2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),//----------Background----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.05 ,top: screenHeight  * 0.10
                , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
            child: Container(
              alignment: Alignment(-0.78, -0.37),
              width:screenWeidth ,
              height: screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: Colors.white.withOpacity(0.72),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFF707070).withOpacity(0.72),

                ),
              ),

              child: AutoSizeText(
                'Ishihara Test',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  //   fontSize: screenText * 12.0,
                  color: const Color(0xFF6981B5).withOpacity(0.72),
                  fontWeight: FontWeight.w900,
                ),

                minFontSize: 10,
                maxFontSize: 30,
                maxLines: 1,
              ),

            ),
          ), //----------Header----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.73 ,top: screenHeight  * 0.09 ),
            child: Container(
              width: screenWeidth * 0.20,
              height: screenHeight* 0.09,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(178.0),
                image: DecorationImage(
                  image: const AssetImage('images/ISee.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ), //----------ISee Logo----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.40 ,top: screenHeight  * 0.20
                , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
            child: SizedBox(
              width: 100.0,
              height: 50.0,
              child: AutoSizeText(
                '11/12 ',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                 // fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                minFontSize: 20,
                maxFontSize: 30,
              ),
            ),
          ), //----------Plate Number----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.08 ,top: screenHeight  * 0.260
                ,  right:screenWeidth * 0.08 , bottom: screenHeight  * 0.200 ),
            child: // Group: Group 38
            Container(
              alignment: Alignment(0.0, 0.02),
              width: 313.0,
              height: 338.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
                color: Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFF707070),
                ),
              ),
              child: Container(
                width: 297.0,
                height: 277.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/Ishihara_11.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ), //----------Image Plate Box----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.11 ,top: screenHeight  * 0.760 ),
              child: Container(
                padding: EdgeInsets.only(left: 16.0 , right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.black , width: 0.5),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
                child: DropdownButton(
                  hint: AutoSizeText("Select The First Number      "),
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 12,
                      color: Colors.black
                  ),
                  value: valueChoose1,
                  onChanged: (newValue){
                    setState(() {
                      valueChoose1=_firstNumbercontroller.toString();
                      valueChoose1 = newValue;
                    });
                  },
                  items: listItem.map((valueItem){
                    return DropdownMenuItem(
                      value: valueItem,
                      child:Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ), //---------- first drop down  ----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.11 ,top: screenHeight  * 0.840 ),
              child: Container(
                padding: EdgeInsets.only(left: 16.0 , right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.black , width: 0.5),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
                child: DropdownButton(
                  hint: AutoSizeText("Select The Second Number"),
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 12,
                      color: Colors.black
                  ),
                  value: valueChoose2,
                  onChanged: (newValue){
                    setState(() {
                      valueChoose2=  _secondNumbercontroller.toString();
                      valueChoose2 = newValue;
                    });
                  },
                  items: listItem.map((valueItem){
                    return DropdownMenuItem(
                      value: valueItem,
                      child:Text(valueItem),
                    );
                  }).toList(),

                ),
              ),
            ), //---------- second drop down  ----------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left:screenWeidth * 0.820 ,top: screenHeight  * 0.910),
              child: InkWell(
                onTap: () async {
                  if (valueChoose1 != null && valueChoose2 != null ){

                    if(valueChoose1 == "4" && valueChoose2 == "2") {
                      globals.correctAnswerCount++ ;
                    } else{
                      globals.wrongAnswerCount++;
                    }

                    //2-Add user information into CVD_User table
                    var current_user = await FirebaseAuth.instance.currentUser;
                    FirebaseFirestore.instance
                        .collection("Ishihara_Test")
                        .doc(current_user.uid)
                        .update({
                      'page11_choice1': valueChoose1,
                      'page11_choice2': valueChoose2,
                      'correct_answer':globals.correctAnswerCount,
                      'wrong_answer':globals.wrongAnswerCount

                    });
                    print(valueChoose1);
                    print(valueChoose2);
                    print(globals.correctAnswerCount);
                    print(globals.wrongAnswerCount);
                    print("Successfully Complete The Eleventh Page");

                    //3-Direct the user to next page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TestPlate12()));
                  }else{
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Please Try Again!!"),
                        content: Text("You Must Select a Number"),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      ),
                    );//Alert Dialog

                  }
                },
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 40.0,
                ),
                ),
            ),
          ), //----------next button----------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(right:screenWeidth * 0.820 ,top: screenHeight  * 0.910),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestPlate10()));
                },
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
          ), //----------Back Button----------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left:screenWeidth * 0.100 ,top: screenHeight  * 0.18),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Test()));
                },
                child: Icon(
                  Icons.cancel,
                  color: const Color(0xff6a77ab),
                  size: 40.0,
                ),
              ),
            ),
          ), //----------Cancel Icon----------
        ],
      ),
    );
  }
}