//ALL DONE
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/Test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/user.dart';
import 'globals.dart' as globals;

class TestResult extends StatefulWidget {
  @override
  _TestResult createState() => _TestResult();
}

class  _TestResult extends State<TestResult> {
  void initState() {
    super.initState();
  }

  //variables
  final _formkey = GlobalKey<FormState>();
  user userObject = new user();
  //TextEditingController _datecontroller = TextEditingController();
  //TextEditingController _testResultcontroller = TextEditingController();
 // TextEditingController _correctAnswerscontroller = TextEditingController();
  //TextEditingController _incorrectAnswerscontroller = TextEditingController();
  //TextEditingController _CVDTypecontroller = TextEditingController();
  String formattedDate;
  String cuurDate;
  int correctAnswer;
  int incorrectanswer;
  String finalResult;

  @override
  void dispose() {
    userObject.getDatecontroller.dispose();
    userObject.getTestResultcontroller.dispose();
    userObject.getCorrectAnswerscontroller.dispose();
    userObject.getIncorrectAnswerscontroller.dispose();
    userObject.getCVDTypecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                'Ishihara Test Result',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  //   fontSize: screenText * 12.0,
                  color: const Color(0xFF6981B5).withOpacity(0.72),
                  fontWeight: FontWeight.w900,
                ),

                minFontSize: 20,
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
            padding: EdgeInsets.only(left:screenWeidth * 0.05 ,top: screenHeight  * 0.25
                , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
            child: SizedBox(
              width: 313.0,
              height: 96.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 313.0,
                    height: 89.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.0),
                      color: Colors.white,
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xFF707070),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 18.0,
                    bottom: 0,
                    child: SizedBox(
                      width: 276.0,
                      height: 69.0,
                      child: AutoSizeText(
                        'The Result of your test is:',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                       //   fontSize: 24.0,
                          color: const Color(0xFF6A77AB),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 20,
                        maxFontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), //---------- Box note ----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.700 ,top: screenHeight  * 0.910),
            child:RaisedButton(
              color: const Color(0xff6981b5),
              child:Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Test()));
              },
            ),
          ),//----------Done Button----------
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
                            correctAnswer = document.data()['correct_answer'];
                            incorrectanswer = document.data()['wrong_answer'];
                            finalResult = document.data()['final_result'];
                            userObject.getDatecontroller.text = document.data()['Date'];
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
          ), //------Get info from firebase--------
          StreamBuilder(
            stream:
            FirebaseFirestore.instance.collection('CVD_User').snapshots(),
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
                            userObject.getCVDTypecontroller.text = document.data()['CVDType'];
                          });
                        });
                        return new ListTile();
                      } else {
                        return new ListTile();
                      }
                    }).toList(),
                  );
              }
            },
          ), //------Get cvd type from firebase--------
          Padding(
            padding: new EdgeInsets.only(top:320.0, left: 50.0),
            child: Text(
              'Test Date: ',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),//date text
          Padding(
            padding: new EdgeInsets.only(top:375.0, left: 50.0),
            child: Text(
              'Test Result: ',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),//test result text
          Padding(
            padding: new EdgeInsets.only(top:435.0, left: 50.0),
            child: Text(
              'Correct Answers: ',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),//correct answers text
          Padding(
            padding: new EdgeInsets.only(top:495.0, left: 50.0),
            child: Text(
              'Incorrect Answers: ',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),//Incorrect answers text
          Padding(
            padding: new EdgeInsets.only(top:555.0, left: 50.0),
            child: Text(
              'My CVD Type: ',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),//My CVD Type text


          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Ishihara_Test')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return Text('');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('');
                default:
                  return new ListView(
                    children: snapshot.data.docs
                        .map((DocumentSnapshot document) {
                      var currentUser =
                          FirebaseAuth.instance.currentUser;
                      if (document.id == currentUser.uid) {
                        Future.delayed(Duration(), () async {
                          await setState(() {
                            String page11_choice1 =
                            document['page11_choice1'];
                            String page11_choice2 =
                            document['page11_choice2'];

                            //1- normal vision
                            if (incorrectanswer <= 3) {
                              //update the CVDType value
                              FirebaseFirestore.instance
                                  .collection("CVD_User")
                                  .doc(currentUser.uid)
                                  .update(
                                  {
                                    'CVDType': "Normal vision"});
                            } else if (incorrectanswer >= 4) {
                              //2- Red_green (Portan -> makes red look more green)
                              if (page11_choice1 == "Nothing" &&
                                  page11_choice2 == "2") {
                                //update the CVDType value
                                FirebaseFirestore.instance
                                    .collection("CVD_User")
                                    .doc(currentUser.uid)
                                    .update(
                                    {'CVDType': "Protanopia"});
                                //3- Red_green (Deutran -> common type makes green look more red)
                              } else if (page11_choice1 == "4" &&
                                  page11_choice2 == "Nothing") {
                                //update the CVDType value
                                FirebaseFirestore.instance
                                    .collection("CVD_User")
                                    .doc(currentUser.uid)
                                    .update(
                                    {'CVDType': "Duetronopia"});
                              }
                            }

                          });
                          return new ListTile();
                        });
                      } else {
                        return new ListTile();
                      }
                    }).toList(),
                  );
              }
            },
          ), //------Get info from firebase--------

          Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: userObject.getDatecontroller,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(top: 320.0, left: 180.0),
                  ),
                ), //----------Date----------
                TextFormField(
                  controller:userObject.getTestResultcontroller,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(top: 40.0, left: 180.0),
                    hintText: finalResult.toString() + ' %',
                  ),
                ), //----------Test Result----------
                TextFormField(
                  controller: userObject.getCorrectAnswerscontroller,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(top: 40.0, left: 200.0),
                    hintText: correctAnswer.toString(),
                  ),
                ), //----------Correct Answers----------
                TextFormField(
                  controller: userObject.getIncorrectAnswerscontroller,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(top: 40.0, left: 210.0),
                   hintText: incorrectanswer.toString(),
                  ),
                ), //----------Incorrect Answers----------



                TextFormField(
                  controller:userObject.getCVDTypecontroller,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(top: 40.0, left: 180.0),
                    hintText: userObject.getCVDTypecontroller.text,
                  ),
                ), //----------My CVD Type---------
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String Background =
    '<svg viewBox="-132.8 -212.0 250.3 250.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  /><stop offset="0.047428" stop-color="#ff321387"  /><stop offset="0.133932" stop-color="#ffb4b4d3"  /><stop offset="0.211895" stop-color="#ffdce4f3"  /><stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ff6a77ab"  /></linearGradient></defs><path transform="translate(-100.26, -233.0)" d="M 932.4722900390625 95.21127319335938 C 715.0507202148438 95.21127319335938 295.9188232421875 69.95317840576172 93.37493896484375 228.1106872558594 C 23.73117065429688 282.4923706054688 -24.022705078125 449.0497741699219 -24.022705078125 522.7361450195312 C -24.022705078125 685.9822998046875 -68.51026916503906 865.0326538085938 46.0013427734375 963.8968505859375 C 78.24923706054688 991.7384033203125 34.607666015625 994.908935546875 70.93707275390625 1011.32470703125 C 84.87640380859375 1017.623474121094 74.25277709960938 1038.3515625 93.37493896484375 1043.91162109375 C 119.2852478027344 1052.81298828125 364.1560974121094 1056.273681640625 398.1963500976562 1058.5244140625 C 435.2300720214844 1060.973388671875 473.1695861816406 1043.91162109375 505.1127319335938 1043.91162109375 C 580.9110717773438 1043.91162109375 656.1889038085938 1005.343017578125 735.28759765625 963.8968505859375 C 771.1249389648438 945.1187744140625 820.5877685546875 927.4923706054688 848.7631225585938 909.5341796875 C 880.033935546875 889.6029663085938 918.8973388671875 853.3441162109375 941.8712768554688 822.8403930664062 C 971.9507446289062 782.9025268554688 982.9915161132812 747.07763671875 998.2335205078125 713.11376953125 C 1026.332885742188 650.499755859375 1028.603393554688 617.8158569335938 998.2335205078125 531.9896850585938 C 903.0227661132812 262.921875 1224.705688476562 95.21127319335938 932.4722900390625 95.21127319335938 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.68412" y1="0.157539" x2="0.24164" y2="0.93267"><stop offset="0.0" stop-color="#ffffffff"  /><stop offset="0.08674" stop-color="#ff8996c2"  /><stop offset="0.158918" stop-color="#ff7a87b7"  /><stop offset="0.59789" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ffb5c3e2"  /></linearGradient></defs><path transform="translate(-81.0, -212.0)" d="M 513.5 0 C 797.0982055664062 0 1027 235.0505065917969 1027 525 C 1027 814.949462890625 810.3135986328125 983.9443359375 526.7153930664062 983.9443359375 C 403.9173583984375 983.9443359375 239.5424194335938 908.4990844726562 157.8780822753906 853.68603515625 C 51.26186370849609 782.1254272460938 32.13705444335938 777.7958984375 32.13705444335938 613.39453125 C 32.13705444335938 508.1428527832031 13.97368240356445 359.6548156738281 60.75470352172852 262.614990234375 C 68.71327209472656 246.106201171875 57.71491241455078 215.8832855224609 67.75968170166016 200.606689453125 C 159.6092681884766 60.91526031494141 350.3712158203125 0 513.5 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
