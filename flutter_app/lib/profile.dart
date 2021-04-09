import 'package:adobe_xd/pinned.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Camera.dart';
import 'package:flutter_app/signIn.dart';
import 'package:flutter_app/UserSettings.dart';
import 'package:flutter_app/user.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'globals.dart' as globals;

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  void initState() {
    super.initState();
  }

  //variables
  final _formkey = GlobalKey<FormState>();
 // TextEditingController _CVDTypecontroller = TextEditingController();
  //TextEditingController _lastTestDatecontroller = TextEditingController();
//  TextEditingController _emailcontroller = TextEditingController();
 // TextEditingController _phoneNOcontroller = TextEditingController();
 // TextEditingController _gendercontroller = TextEditingController();
  String fname;
  String cvd;
  String lastTest;
  String email;
  String phone;
  String gender;


  String pro;
  String hello;
  String cvdType;
  String last;
  String eml;
  String phon;
  String gen;
  String mod;

  int count_email = 0;
  int count_phone = 0;
  int count_gender = 0;

  user userObject = new user();

  @override
  void dispose() {
    userObject.getCVDTypecontroller.dispose();
    userObject.getLastTestDatecontroller.dispose();
    userObject.getEmailcontroller.dispose();
    userObject.getPhoneNOcontroller.dispose();
    userObject.getGendercontroller.dispose();
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
          AutoSizeText((() {
            if (globals.language == 0) {
              setState(() {
                 pro ='Profile';
                 hello =  'Hello ' + fname.toString().toUpperCase() + ', How are you?';
                 cvdType = 'Your CVD Type:';
                 last = 'Last Test Date:';
                 eml = 'Email:';
                 phon ='Phone No:';
                 gen = 'Gender: ';
                 mod ='Modify';
              });
              return "";
            }else{
              setState(() {
                pro ='حسابي';
                hello =  'مرحبا ' + fname.toString().toUpperCase() ;
                cvdType = 'نوع عمى الالوان:';
                last = 'تاريخ الاختبار:';
                eml = 'البريد الالكتروني:';
                phon ='رقم الجوال:';
                gen = 'الجنس: ';
                mod ='تعديل';
              });
              return "";
            }
          })()),//----------Translations----------
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
              //   width: 343.0,
              //  height: 56.0,

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
                pro,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  //   fontSize: screenText * 12.0,
                  color: const Color(0xFF6981B5).withOpacity(0.72),
                  fontWeight: FontWeight.w900,
                ),

                minFontSize: 25,
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
            padding: EdgeInsets.only(left:screenWeidth * 0.08 ,top: screenHeight  * 0.800
                , right:screenWeidth * 0.08 , bottom: screenHeight  * 0.01),
            child: Container(
              child: SizedBox(
                width: screenWeidth ,
                height: screenHeight * 0.13 ,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 10.0, 345.0, 74.0),
                      size: Size(345.0, 95.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, 345.0, 74.0),
                            size: Size(345.0, 74.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28.0),
                                color: const Color(0xccffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(124.0, 0.0, 98.0, 95.0),
                      size: Size(345.0, 95.0),
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, 98.0, 95.0),
                            size: Size(98.0, 95.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: const Color(0xccffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //----------Footer---------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.37 ,top: screenHeight  * 0.70
                , right:screenWeidth * 0.08 , bottom: screenHeight  * 0.200),
            child: Container(
              child: RaisedButton(
                  color: const Color(0xff6981b5),
                  child: Text(
                    mod,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    var currentUser = await FirebaseAuth.instance.currentUser;
                    print('pressed');
                    //Update Phone feild
                    if (count_phone > 0) {
                      FirebaseFirestore.instance
                          .collection('CVD_User')
                          .doc(currentUser.uid)
                          .update({
                        'phoneNo': userObject.getPhoneNOcontroller.text,
                      }).then((value) {
                        print('Phone updated successfully');
                      });
                      count_phone--;
                    }
                    //Update Email
                    if (count_email > 0) {
                      FirebaseFirestore.instance
                          .collection('CVD_User')
                          .doc(currentUser.uid)
                          .update({
                        'email': userObject.getEmailcontroller.text,
                      }).then((value) {
                        print('Email updated successfully');
                      });
                      count_email--;
                    }
                    //Update Gender
                    if (count_gender > 0) {
                      FirebaseFirestore.instance
                          .collection('CVD_User')
                          .doc(currentUser.uid)
                          .update({
                        'gender': userObject.getGendercontroller.text,
                      }).then((value) {
                        print('Gender updated successfully');
                      });
                      count_gender--;
                    }
                  }),
            ),
          ), //----------Modify Button----------
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
                        // print('document with id = : ' + document.id);
                        Future.delayed(Duration(), () async {
                          await setState(() {
                            fname = document['firstName'];
                            cvd = document['CVDType'];
                            email = document['email'];
                            phone = document['phoneNo'];
                            gender = document['gender'];
                          });
                        });
                        return new ListTile();
                      } else {
                        //print('no document with id = : ' + document.id);
                        return new ListTile();
                      }
                    }).toList(),
                  );
              }
            },
          ), //------Get info from firebase--------
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
                        // print('document with id = : ' + document.id);
                        Future.delayed(Duration(), () async {
                          await setState(() {
                            lastTest = document['Date'];
                          });
                        });
                        return new ListTile();
                      } else {
                        //print('no document with id = : ' + document.id);
                        return new ListTile();
                      }
                    }).toList(),
                  );
              }
            },
          ), //------Get last date from firebase--------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.15 ,top: screenHeight  * 0.20
                , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
            child: AutoSizeText(
             hello,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.50,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ), //---------Hello Box ---------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.10 ,top: screenHeight  * 0.28
                , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
            child: AutoSizeText(
              cvdType,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ), //CVD type text
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.10 ,top: screenHeight  * 0.37
                , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
            child: AutoSizeText(
              last,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ), //last test text
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.10 ,top: screenHeight  * 0.457
                , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
            child: AutoSizeText(
              eml,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ), //Email Text
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.10 ,top: screenHeight  * 0.544
                , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
            child: AutoSizeText(
              phon,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ), //phone number text
          Padding(
         padding: EdgeInsets.only(left:screenWeidth * 0.10 ,top: screenHeight  * 0.63
         , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
           child: AutoSizeText(
              gen,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ), //gender text
          Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: userObject.getCVDTypecontroller,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding:  EdgeInsets.only(left:screenWeidth * 0.50 ,top: screenHeight  * 0.28),
                    hintText:  cvd.toString(),
                  ),
                ), //----------Text CVD----------
                TextFormField(
                  controller:userObject.getLastTestDatecontroller,
                  readOnly: true,
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding:  EdgeInsets.only(left:screenWeidth * 0.50 ,top: screenHeight  * 0.06),
                    hintText:  lastTest.toString(),

                  ),
                ), //----------Test Date----------
                TextFormField(
                  //  autofocus: true,
                    controller: userObject.getEmailcontroller,
                    decoration: InputDecoration(
                   //   contentPadding:
                     //     new EdgeInsets.only(top: 45.0, left: 180.0),
                      contentPadding:  EdgeInsets.only(left:screenWeidth * 0.35 ,top: screenHeight  * 0.06),
                      hintText: email.toString(),
                  //    labelText: 'Username',

                    ),
                    onTap: () {
                      count_email++;
                    }), //----------Email----------
                TextFormField(
                    controller: userObject.getPhoneNOcontroller,
                    decoration: InputDecoration(
                    //  contentPadding:
                      //    new EdgeInsets.only(top: 40.0, left: 180.0),
                      contentPadding:  EdgeInsets.only(left:screenWeidth * 0.35 ,top: screenHeight  * 0.06),
                      hintText: phone.toString(),
                    ),
                    onTap: () {
                      count_phone++;
                    }), //----------Phone Number----------
                TextFormField(
                    controller: userObject.getGendercontroller,
                    decoration: InputDecoration(
                    //  contentPadding:
                      //    new EdgeInsets.only(top: 40.0, left: 180.0),
                      contentPadding:  EdgeInsets.only(left:screenWeidth * 0.35 ,top: screenHeight  * 0.06),
                      hintText: gender.toString(),
                    ),
                    onTap: () {
                      count_gender++;
                    }), //----------Gender----------
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 575.0, left: 65.0),
            child: Container(
              child: InkWell(
                child:  SvgPicture.string(
                  _svg_hp4zgj,
                  width: 50.6,
                  height: 45.9,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserSettings()));
                },
              ),
            ),
          ), //----------Setting Icon----------
          Padding(
            padding: const EdgeInsets.only(top: 580.0, left: 250.0),
            child: Container(
              child: InkWell(
                child:  SvgPicture.string(
                  _svg_15ia88,
                  width: 35.4,
                  height: 36.2,
                ),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
            ),
          ), //----------Profile Icon----------
          Padding(
            padding: const EdgeInsets.only(top: 565.0, left: 145.0),
            child: Container(
              child: InkWell(
                child:  SvgPicture.string(
                  _svg_j0bnl7,
                ),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Camera()));
                },
              ),
            ),
          ), //----------Camera Icon----------
        Padding(
          padding: const EdgeInsets.only(top: 650.0, left: 25.0),
            child: InkWell(
              child: SvgPicture.string(
                // arrow-return-left
                '<svg viewBox="4.5 5.63 27.0 22.5" ><path  d="M 13.17099952697754 12.70400047302246 C 13.38259315490723 12.91506004333496 13.50151062011719 13.20163917541504 13.50151062011719 13.50050067901611 C 13.50151062011719 13.79936218261719 13.38259315490723 14.08594131469727 13.17099952697754 14.29700088500977 L 7.216000080108643 20.25 L 13.17199993133545 26.20400047302246 C 13.61189460754395 26.64389419555664 13.61189460754395 27.35710525512695 13.17199993133545 27.79700088500977 C 12.73210525512695 28.23689460754395 12.01889514923096 28.23689460754395 11.57900047302246 27.79700088500977 L 4.828999519348145 21.04700088500977 C 4.617405891418457 20.83594131469727 4.498488426208496 20.54936218261719 4.498488426208496 20.2504997253418 C 4.498488426208496 19.95163917541504 4.617405891418457 19.66505813598633 4.828999519348145 19.45399856567383 L 11.57899951934814 12.70400047302246 C 11.79005908966064 12.49240684509277 12.07663822174072 12.37348937988281 12.3754997253418 12.37348937988281 C 12.67436122894287 12.37348937988281 12.96094036102295 12.49240684509277 13.17199993133545 12.70400047302246 Z" fill="#6981b5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path  d="M 30.375 5.625 C 30.9963207244873 5.625 31.5 6.128679752349854 31.5 6.75 L 31.5 15.75 C 31.5 18.85660362243652 28.98160171508789 21.37500190734863 25.87499809265137 21.375 L 6.75 21.375 C 6.128679752349854 21.375 5.625 20.8713207244873 5.625 20.25 C 5.625 19.6286792755127 6.128679752349854 19.125 6.75 19.125 L 25.875 19.125 C 27.73896408081055 19.125 29.25000190734863 17.61395835876465 29.25000190734863 15.74999713897705 L 29.25 6.75 C 29.25 6.128679752349854 29.7536792755127 5.625 30.375 5.625 Z" fill="#6981b5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                width: 27.0,
                height: 22.5,
              ),
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signIn()));
              },
            ),
          ),//----------Logout Icon----------
        ],
      ),
    );
  }
}

const String Background =
    '<svg viewBox="-132.8 -212.0 250.3 250.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  /><stop offset="0.047428" stop-color="#ff321387"  /><stop offset="0.133932" stop-color="#ffb4b4d3"  /><stop offset="0.211895" stop-color="#ffdce4f3"  /><stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ff6a77ab"  /></linearGradient></defs><path transform="translate(-100.26, -233.0)" d="M 932.4722900390625 95.21127319335938 C 715.0507202148438 95.21127319335938 295.9188232421875 69.95317840576172 93.37493896484375 228.1106872558594 C 23.73117065429688 282.4923706054688 -24.022705078125 449.0497741699219 -24.022705078125 522.7361450195312 C -24.022705078125 685.9822998046875 -68.51026916503906 865.0326538085938 46.0013427734375 963.8968505859375 C 78.24923706054688 991.7384033203125 34.607666015625 994.908935546875 70.93707275390625 1011.32470703125 C 84.87640380859375 1017.623474121094 74.25277709960938 1038.3515625 93.37493896484375 1043.91162109375 C 119.2852478027344 1052.81298828125 364.1560974121094 1056.273681640625 398.1963500976562 1058.5244140625 C 435.2300720214844 1060.973388671875 473.1695861816406 1043.91162109375 505.1127319335938 1043.91162109375 C 580.9110717773438 1043.91162109375 656.1889038085938 1005.343017578125 735.28759765625 963.8968505859375 C 771.1249389648438 945.1187744140625 820.5877685546875 927.4923706054688 848.7631225585938 909.5341796875 C 880.033935546875 889.6029663085938 918.8973388671875 853.3441162109375 941.8712768554688 822.8403930664062 C 971.9507446289062 782.9025268554688 982.9915161132812 747.07763671875 998.2335205078125 713.11376953125 C 1026.332885742188 650.499755859375 1028.603393554688 617.8158569335938 998.2335205078125 531.9896850585938 C 903.0227661132812 262.921875 1224.705688476562 95.21127319335938 932.4722900390625 95.21127319335938 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.68412" y1="0.157539" x2="0.24164" y2="0.93267"><stop offset="0.0" stop-color="#ffffffff"  /><stop offset="0.08674" stop-color="#ff8996c2"  /><stop offset="0.158918" stop-color="#ff7a87b7"  /><stop offset="0.59789" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ffb5c3e2"  /></linearGradient></defs><path transform="translate(-81.0, -212.0)" d="M 513.5 0 C 797.0982055664062 0 1027 235.0505065917969 1027 525 C 1027 814.949462890625 810.3135986328125 983.9443359375 526.7153930664062 983.9443359375 C 403.9173583984375 983.9443359375 239.5424194335938 908.4990844726562 157.8780822753906 853.68603515625 C 51.26186370849609 782.1254272460938 32.13705444335938 777.7958984375 32.13705444335938 613.39453125 C 32.13705444335938 508.1428527832031 13.97368240356445 359.6548156738281 60.75470352172852 262.614990234375 C 68.71327209472656 246.106201171875 57.71491241455078 215.8832855224609 67.75968170166016 200.606689453125 C 159.6092681884766 60.91526031494141 350.3712158203125 0 513.5 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hp4zgj =
    '<svg viewBox="151.2 747.6 50.6 45.9" ><path transform="translate(147.8, 744.26)" d="M 51.16246795654297 12.53848457336426 L 45.70444107055664 17.51151275634766 C 45.59551620483398 17.61031341552734 45.42435836791992 17.65422630310059 45.27913665771484 17.63227081298828 L 39.63956832885742 16.70541572570801 C 39.4442024230957 16.6724796295166 39.28688049316406 16.5281982421875 39.25057601928711 16.3525505065918 L 38.24091339111328 11.23680782318115 C 38.21670913696289 11.09409427642822 38.26511764526367 10.9498119354248 38.37404251098633 10.85100936889648 L 43.81996917724609 5.88895845413208 C 44.24527359008789 5.503160953521729 44.18476486206055 4.863300323486328 43.69895172119141 4.554348468780518 C 42.47145843505859 3.760797262191772 41.01229095458984 3.374999523162842 39.83319854736328 3.374999523162842 C 39.74848556518555 3.374999523162842 39.66377639770508 3.374999523162842 39.58942794799805 3.385977506637573 C 38.06975555419922 3.462823629379272 34.81256866455078 4.234419345855713 32.29533767700195 6.660553932189941 C 29.85244941711426 8.998867034912109 27.29891014099121 13.3430118560791 29.56026649475098 18.18430519104004 C 29.8282413482666 18.7692756652832 30.13079452514648 19.54087066650391 29.23178100585938 20.35637855529785 C 28.30857086181641 21.17188453674316 4.956754684448242 41.12046432495117 4.956754684448242 41.12046432495117 C 2.76800799369812 42.82989501953125 2.927063226699829 45.99468994140625 4.944652080535889 47.83585357666016 C 5.978515625 48.76271057128906 7.37544059753418 49.24731063842773 8.749890327453613 49.24731063842773 C 10.0984058380127 49.24731063842773 11.41234683990479 48.78466796875 12.34766578674316 47.80292129516602 C 12.34766578674316 47.80292129516602 34.15560531616211 26.72988891601562 35.22577667236328 25.77166748046875 C 35.71158981323242 25.34195899963379 36.16109466552734 25.20865440368652 36.57429122924805 25.20865440368652 C 36.97538757324219 25.20865440368652 37.34018325805664 25.34038925170898 37.62025451660156 25.47369384765625 C 38.82354736328125 26.03670692443848 40.17378997802734 26.28920364379883 41.55861663818359 26.28920364379883 C 44.81579971313477 26.28920364379883 48.24414443969727 24.92166137695312 50.33607864379883 23.02560234069824 C 53.30281066894531 20.33442878723145 53.84913635253906 17.73264312744141 53.9338493347168 16.39803504943848 C 54.00646591186523 15.30650997161865 53.66588592529297 13.90603160858154 52.63373565673828 12.62631130218506 C 52.28104782104492 12.20757865905762 51.58777618408203 12.16366672515869 51.16246795654297 12.53848743438721 Z M 10.00158882141113 45.42069625854492 C 9.332517623901367 46.01664352416992 8.251976013183594 46.01664352416992 7.582903385162354 45.42069625854492 C 6.925933837890625 44.81377410888672 6.925933837890625 43.83359527587891 7.582903385162354 43.22666549682617 C 8.251976013183594 42.63072204589844 9.332517623901367 42.63072204589844 10.00158882141113 43.22666549682617 C 10.65856075286865 43.84456634521484 10.65856075286865 44.82631683349609 10.00158882141113 45.42069625854492 Z" fill="#6981b5" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_15ia88 =
    '<svg viewBox="296.2 655.4 35.4 36.2" ><path transform="translate(290.23, 649.44)" d="M 23.70994567871094 10.29697704315186 C 26.27788734436035 10.29697704315186 28.35880470275879 12.42284870147705 28.35880470275879 15.0462646484375 C 28.35880470275879 17.66968154907227 26.27788734436035 19.79555320739746 23.70994567871094 19.79555320739746 C 21.14200401306152 19.79555320739746 19.06108474731445 17.66968154907227 19.06108474731445 15.0462646484375 C 19.06108474731445 12.42284870147705 21.14200401306152 10.29697704315186 23.70994567871094 10.29697704315186 M 23.70994567871094 30.65107345581055 C 30.28476333618164 30.65107345581055 37.21377944946289 33.95296096801758 37.21377944946289 35.40036010742188 L 37.21377944946289 37.88808441162109 L 10.20611190795898 37.88808441162109 L 10.20611190795898 35.40036010742188 C 10.20611190795898 33.95296096801758 17.13512802124023 30.65107345581055 23.70994567871094 30.65107345581055 M 23.70994567871094 6 C 18.81757354736328 6 14.85497283935547 10.04820442199707 14.85497283935547 15.0462646484375 C 14.85497283935547 20.04432678222656 18.81757164001465 24.092529296875 23.70994567871094 24.092529296875 C 28.60231781005859 24.092529296875 32.56491851806641 20.04432678222656 32.56491851806641 15.0462646484375 C 32.56491851806641 10.04820251464844 28.60231781005859 6 23.70994567871094 6 Z M 23.70994567871094 26.35409545898438 C 17.79924964904785 26.35409545898438 6 29.38459396362305 6 35.40036010742188 L 6 42.18505859375 L 41.41989135742188 42.18505859375 L 41.41989135742188 35.40036010742188 C 41.41989135742188 29.38459396362305 29.62063980102539 26.35409545898438 23.70994567871094 26.35409545898438 Z" fill="#6a77ab" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j0bnl7 =
    '<svg viewBox="74.0 683.0 73.0 58.6" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(74.0, 680.75)" d="M 72.9678955078125 16.9124755859375 L 72.9678955078125 54.61598587036133 C 72.9678955078125 58.08523178100586 69.90380859375 60.89990234375 66.12715911865234 60.89990234375 L 6.840740203857422 60.89990234375 C 3.064081430435181 60.89990234375 0 58.08523178100586 0 54.61598587036133 L 0 16.9124755859375 C 0 13.44322872161865 3.064081430435181 10.62855815887451 6.840740203857422 10.62855815887451 L 19.3820972442627 10.62855815887451 L 21.13503646850586 6.321455478668213 C 22.13264465332031 3.873345851898193 24.68367004394531 2.250000238418579 27.53397750854492 2.250000238418579 L 45.41965866088867 2.250000238418579 C 48.26996994018555 2.250000238418579 50.82099533081055 3.873345851898193 51.818603515625 6.321455478668213 L 53.58579635620117 10.62855815887451 L 66.12715911865234 10.62855815887451 C 69.90380859375 10.62855815887451 72.9678955078125 13.44322872161865 72.9678955078125 16.9124755859375 Z M 53.58579635620117 35.76422500610352 C 53.58579635620117 27.0976619720459 45.9184684753418 20.05443382263184 36.48394775390625 20.05443382263184 C 27.04942512512207 20.05443382263184 19.3820972442627 27.0976619720459 19.3820972442627 35.76422500610352 C 19.3820972442627 44.43080520629883 27.04942512512207 51.47402954101562 36.48394775390625 51.47402954101562 C 45.9184684753418 51.47402954101562 53.58579635620117 44.43080520629883 53.58579635620117 35.76422500610352 Z M 49.02530288696289 35.76422500610352 C 49.02530288696289 42.11360549926758 43.39594650268555 47.28474807739258 36.48394775390625 47.28474807739258 C 29.57195091247559 47.28474807739258 23.94259262084961 42.11360549926758 23.94259262084961 35.76422500610352 C 23.94259262084961 29.41485595703125 29.57195091247559 24.24371337890625 36.48394775390625 24.24371337890625 C 43.39594650268555 24.24371337890625 49.02530288696289 29.41485595703125 49.02530288696289 35.76422500610352 Z" fill="#6a77ab" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
