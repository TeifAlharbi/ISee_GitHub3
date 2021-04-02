import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Test.dart';
import 'package:flutter_app/TestPlate1.dart';
import 'package:flutter_app/TestInstructions.dart';
import 'package:flutter_app/TestPlate11.dart';
import 'package:flutter_app/TestPlate3.dart';
import 'package:flutter_app/TestResult.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'globals.dart' as globals;

class TestPlate12 extends StatefulWidget {
  @override
  _TestPlate12 createState() => _TestPlate12();
}

//drop down menu variable
String valueChoose1;
List listItem = ["Nothing", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

//current date
String cuurDate;
var now = new DateTime.now();
var formatter = new DateFormat('dd-MM-yyyy');
String formattedDate = formatter.format(now);

class _TestPlate12 extends State<TestPlate12> {
  void initState() {
    super.initState();
  }

  //variables
  TextEditingController _firstNumbercontroller = TextEditingController();
  double finalResult;

  @override
  void dispose() {
    _firstNumbercontroller.dispose();
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
                '12/12 ',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
               //   fontSize: 25.0,
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
            child:
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
                    image: AssetImage('images/Ishihara_12.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),  //----------Image Plate Box----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.11 ,top: screenHeight  * 0.760 ),
          //  child: Padding(
            //  padding: const EdgeInsets.all(16.0),
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left:screenWeidth * 0.820 ,top: screenHeight  * 0.910),
              child: InkWell(
                onTap: () async {
                  if (valueChoose1 != null) {
                    //correct answers counter
                    if (valueChoose1 == "3") {
                      globals.correctAnswerCount++;
                    }
                    //wrong answers counter
                    if (valueChoose1 != "3") {
                      globals.wrongAnswerCount++;
                    }
                    finalResult = (globals.correctAnswerCount * 100) / 12;

                    StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('Ishihara_Test').snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Text('');
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('');
                          default:
                            return new ListView(
                              children:
                              snapshot.data.docs.map((DocumentSnapshot document) {
                                var currentUser =  FirebaseAuth.instance.currentUser;
                                if (document.id == currentUser.uid) {
                                  Future.delayed(Duration(), () async {
                                    await setState(() {
                                   String page11_choice1 = document['page11_choice1'];
                                   String page11_choice2 = document['page11_choice2'];

                                        //1- normal vision
                                        if (globals.wrongAnswerCount <= 3){
                                          //update the CVDType value
                                          FirebaseFirestore.instance
                                              .collection("CVD_User")
                                              .doc(currentUser.uid)
                                              .update({'CVDType': "Normal vision"});

                                        }else if (globals.wrongAnswerCount >= 4){
                                          //2- Red_green (Portan -> makes red look more green)
                                          if (page11_choice1 == "Nothing" && page11_choice2 == "2"){
                                            //update the CVDType value
                                            FirebaseFirestore.instance
                                                .collection("CVD_User")
                                                .doc(currentUser.uid)
                                                .update({'CVDType': "Red_Green (Protan)"});

                                            //3- Red_green (Deutran -> common type makes green look more red)
                                          }else if (page11_choice1 == "4" && page11_choice2 == "Nothing"){
                                            //update the CVDType value
                                            FirebaseFirestore.instance
                                                .collection("CVD_User")
                                                .doc(currentUser.uid)
                                                .update({'CVDType': "Red_Green (Deutran)"});
                                          }
                                        }
                                    });
                                    return new ListTile();
                                  });
                                }else{
                                  return new ListTile();
                                }
                              }).toList(),
                            );
                        }
                      },
                    ); //------Get info from firebase--------

                  //2-Add user information into CVD_User table
                    var current_user = await FirebaseAuth.instance.currentUser;
                    FirebaseFirestore.instance
                        .collection("Ishihara_Test")
                        .doc(current_user.uid)
                        .update({
                      'page12_choice1': valueChoose1,
                      'correct_answer': globals.correctAnswerCount,
                      'wrong_answer': globals.wrongAnswerCount,
                      'final_result': finalResult.toStringAsFixed(2),
                      'Date': formattedDate.toString(),
                    });

                    print(valueChoose1);
                    print(globals.correctAnswerCount);
                    print(globals.wrongAnswerCount);
                    print(finalResult);
                    print("Successfully Complete The Twelfth Page");

                    //3-Direct the user to next page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TestResult()));
                  } else {
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
                    ); //Alert Dialog
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
                      MaterialPageRoute(builder: (context) => TestPlate11()));
                },
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
          ),  //----------Back Button----------
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
          ),  //----------Cancel Icon----------
        ],
      ),
    );
  }
}

const String _svg_dpe9pm =
    '<svg viewBox="-132.8 -212.0 250.3 250.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  /><stop offset="0.047428" stop-color="#ff321387"  /><stop offset="0.133932" stop-color="#ffb4b4d3"  /><stop offset="0.211895" stop-color="#ffdce4f3"  /><stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ff6a77ab"  /></linearGradient></defs><path transform="translate(-100.26, -233.0)" d="M 932.4722900390625 95.21127319335938 C 715.0507202148438 95.21127319335938 295.9188232421875 69.95317840576172 93.37493896484375 228.1106872558594 C 23.73117065429688 282.4923706054688 -24.022705078125 449.0497741699219 -24.022705078125 522.7361450195312 C -24.022705078125 685.9822998046875 -68.51026916503906 865.0326538085938 46.0013427734375 963.8968505859375 C 78.24923706054688 991.7384033203125 34.607666015625 994.908935546875 70.93707275390625 1011.32470703125 C 84.87640380859375 1017.623474121094 74.25277709960938 1038.3515625 93.37493896484375 1043.91162109375 C 119.2852478027344 1052.81298828125 364.1560974121094 1056.273681640625 398.1963500976562 1058.5244140625 C 435.2300720214844 1060.973388671875 473.1695861816406 1043.91162109375 505.1127319335938 1043.91162109375 C 580.9110717773438 1043.91162109375 656.1889038085938 1005.343017578125 735.28759765625 963.8968505859375 C 771.1249389648438 945.1187744140625 820.5877685546875 927.4923706054688 848.7631225585938 909.5341796875 C 880.033935546875 889.6029663085938 918.8973388671875 853.3441162109375 941.8712768554688 822.8403930664062 C 971.9507446289062 782.9025268554688 982.9915161132812 747.07763671875 998.2335205078125 713.11376953125 C 1026.332885742188 650.499755859375 1028.603393554688 617.8158569335938 998.2335205078125 531.9896850585938 C 903.0227661132812 262.921875 1224.705688476562 95.21127319335938 932.4722900390625 95.21127319335938 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.68412" y1="0.157539" x2="0.24164" y2="0.93267"><stop offset="0.0" stop-color="#ffffffff"  /><stop offset="0.08674" stop-color="#ff8996c2"  /><stop offset="0.158918" stop-color="#ff7a87b7"  /><stop offset="0.59789" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ffb5c3e2"  /></linearGradient></defs><path transform="translate(-81.0, -212.0)" d="M 513.5 0 C 797.0982055664062 0 1027 235.0505065917969 1027 525 C 1027 814.949462890625 810.3135986328125 983.9443359375 526.7153930664062 983.9443359375 C 403.9173583984375 983.9443359375 239.5424194335938 908.4990844726562 157.8780822753906 853.68603515625 C 51.26186370849609 782.1254272460938 32.13705444335938 777.7958984375 32.13705444335938 613.39453125 C 32.13705444335938 508.1428527832031 13.97368240356445 359.6548156738281 60.75470352172852 262.614990234375 C 68.71327209472656 246.106201171875 57.71491241455078 215.8832855224609 67.75968170166016 200.606689453125 C 159.6092681884766 60.91526031494141 350.3712158203125 0 513.5 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
