//ALL DONE IN THIS CLASS
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/signIn.dart';
import 'package:flutter_app/testInstructions.dart';
import 'package:flutter_app/Camera.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';

class signUp extends StatefulWidget {
  @override
  _signUp createState() => _signUp();


  //---------- validateEmailFormat Method ----------
  static String validateEmailFormat(String email) {
    if (email.isEmpty) {
      return 'Please Fill The Email Field';
    }else if(!EmailValidator.validate(email)){
      return 'The Email is badly formatted.';
    }
  }


  //---------- validatePasswordFormat Method ----------
  static String validatePasswordFormat(String password) {
    if (password.isEmpty) {
      return 'Please Fill Password Input';
    }
    if (password.trim().length < 6) {
      return 'Password should be at least 6 characters';
    }
  }


  static String addToFirebase(String finalResult,TextEditingController _firstNamecontroller,
      TextEditingController _lastNamecontroller , TextEditingController _phoneNOcontroller
      ,TextEditingController _emailcontroller ,   TextEditingController _gendercontroller ,
      TextEditingController _CVDTypecontroller){


    FirebaseFirestore.instance
        .collection("CVD_User")
        .doc(finalResult)
        .set({
      'firstName': _firstNamecontroller.text,
      'lastName': _lastNamecontroller.text,
      'phoneNo': _phoneNOcontroller.text,
      'email': _emailcontroller.text,
      'gender': _gendercontroller.text,
      'CVDType': _CVDTypecontroller.text,
    }
    );
    return 'User Successfully Added';
  }
}

class _signUp extends State<signUp> {
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  //variables
  final _formkey = GlobalKey<FormState>();
  TextEditingController _firstNamecontroller = TextEditingController();
  TextEditingController _lastNamecontroller = TextEditingController();
  TextEditingController _phoneNOcontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _gendercontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _CVDTypecontroller = TextEditingController();
  int selectedRadio;

  @override
  void dispose() {
    _firstNamecontroller.dispose();
    _lastNamecontroller.dispose();
    _phoneNOcontroller.dispose();
    _emailcontroller.dispose();
    _gendercontroller.dispose();
    _passwordcontroller.dispose();
    _CVDTypecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/fram1.png"),
                fit: BoxFit.cover,
              ),
            ),//----------Background----------
          ),
          Padding(
            padding:  EdgeInsets.only(left:screenWeidth * 0.05 ,top: screenHeight  * 0.10
                , right:screenWeidth * 0.10 ),
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
                'Sign Up',
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
            padding: EdgeInsets.only(left:screenWeidth * 0.73 ,top: screenHeight * 0.09 ),
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
          Form(
            key: _formkey,
            child:SingleChildScrollView(

              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only( top: screenHeight  * 0.20),
                    child: TextFormField(
                      controller: _firstNamecontroller,
                      decoration: InputDecoration(
                        labelText: 'First Name'
                      ),
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Fill First Name Input';
                        }
                      },
                    ),
                  ), //----------Text First Name----------
                  TextFormField(
                    controller: _lastNamecontroller,
                    decoration: InputDecoration(
                        labelText: 'Last Name'
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Last Name Input';
                      }
                    },
                  ), //----------Text Last Name----------
                  TextFormField(
                    controller: _phoneNOcontroller,
                    decoration: InputDecoration(
                        labelText: 'Phone Number'
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Phone Number Input';
                      }
                    },
                  ), //----------Text Phone Number----------
                  TextFormField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                        labelText: 'Email'
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      return signUp.validateEmailFormat(value);
                    },
                  ), //----------Text Email----------
                  TextFormField(
                    controller: _gendercontroller,
                    decoration: InputDecoration(
                        labelText: 'Gender'
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Fill Gender Input';
                      }
                    },
                  ), //----------Text Gender----------
                  TextFormField(
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                    // ignore: missing_return
                    validator: (value) {
                     return signUp.validatePasswordFormat(value);
                    },
                  ), //----------Text Password----------
                  TextFormField(
                    controller: _CVDTypecontroller,
                    decoration: InputDecoration(
                        labelText: 'My CVD Type'
                    ),
                    // ignore: missing_return
                  ), //----------Text CVD----------
                  ListTile(
                  contentPadding: new EdgeInsets.only(top: 20.0, left: 30.0 , bottom: 10.0),
                  //    contentPadding: new EdgeInsets.only(left:screenWeidth * 0.20 ,top: screenHeight * 0.09),
                    title: const AutoSizeText(
                        'I Don\'t Know My CVD Type, \n I Will Take The Test.'
                    ),
                    leading: Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                        setState(() {
                          selectedRadio = 1;
                        });
                      },
                    ),
                  ), //----------CVD Radio----------
                  RaisedButton(
                    color: const Color(0xff6981b5),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                    child: AutoSizeText(
                      'Sign UP',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        //1-Create user with email and pass
                        var result = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailcontroller.text,
                                password: _passwordcontroller.text);

                        if (result != null) {
                          //Check if Directed to Camera Or Test page based on CVD Radio
                          if (selectedRadio == 1) {
                            //2-Add user information into CVD_User table
                            FirebaseFirestore.instance
                                .collection("CVD_User")
                                .doc(result.user.uid)
                                .set({
                              'firstName': _firstNamecontroller.text,
                              'lastName': _lastNamecontroller.text,
                              'phoneNo': _phoneNOcontroller.text,
                              'email': _emailcontroller.text,
                              'gender': _gendercontroller.text,
                              'CVDType': 'none',
                            });
                            print("Successfully Registered without CVD type = " + selectedRadio.toString());

                            //not working IDK why
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text("Successfully Registered"),
                                content: Text("Welcome "+ _firstNamecontroller.text + "." +"\n You will be directed to Test page"),
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

                            //3-Direct the user to test page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => testInstructions()),
                            );
                            print("Directed to Test page");

                          } else {
                        //    String finalResult =  result.user.uid;
                            //2-Add user information into CVD_User table
                            FirebaseFirestore.instance
                                .collection("CVD_User")
                                .doc(result.user.uid)
                                .set({
                              'firstName': _firstNamecontroller.text,
                              'lastName': _lastNamecontroller.text,
                              'phoneNo': _phoneNOcontroller.text,
                              'email': _emailcontroller.text,
                              'gender': _gendercontroller.text,
                              'CVDType': _CVDTypecontroller,
                            });

                         //   SignUp.addToFirebase(finalResult, _firstNamecontroller, _lastNamecontroller
                           //     , _phoneNOcontroller, _emailcontroller, _gendercontroller
                             //   , _CVDTypecontroller);

                             print("Successfully Registered with CVD type = "+ selectedRadio.toString());
                            //not working IDK why
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text("Successfully Registered"),
                                content: Text("Welcome "+ _firstNamecontroller.text + "." +"\n You will be directed to Camera page"),
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

                            //3-Direct the user to camera page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Camera()),
                            );
                            print("Directed to Camera page");
                          }
                        } else {
                          print('Something went wrong. Please Try Again!!');
                        }
                      }
                    },
                  ), //----------SignUP Button----------
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, right: 300.0),
                    child: InkWell(
                      child: SvgPicture.string(
                        // arrow-return-left
                        '<svg viewBox="4.5 5.63 27.0 22.5" ><path  d="M 13.17099952697754 12.70400047302246 C 13.38259315490723 12.91506004333496 13.50151062011719 13.20163917541504 13.50151062011719 13.50050067901611 C 13.50151062011719 13.79936218261719 13.38259315490723 14.08594131469727 13.17099952697754 14.29700088500977 L 7.216000080108643 20.25 L 13.17199993133545 26.20400047302246 C 13.61189460754395 26.64389419555664 13.61189460754395 27.35710525512695 13.17199993133545 27.79700088500977 C 12.73210525512695 28.23689460754395 12.01889514923096 28.23689460754395 11.57900047302246 27.79700088500977 L 4.828999519348145 21.04700088500977 C 4.617405891418457 20.83594131469727 4.498488426208496 20.54936218261719 4.498488426208496 20.2504997253418 C 4.498488426208496 19.95163917541504 4.617405891418457 19.66505813598633 4.828999519348145 19.45399856567383 L 11.57899951934814 12.70400047302246 C 11.79005908966064 12.49240684509277 12.07663822174072 12.37348937988281 12.3754997253418 12.37348937988281 C 12.67436122894287 12.37348937988281 12.96094036102295 12.49240684509277 13.17199993133545 12.70400047302246 Z" fill="#6981b5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path  d="M 30.375 5.625 C 30.9963207244873 5.625 31.5 6.128679752349854 31.5 6.75 L 31.5 15.75 C 31.5 18.85660362243652 28.98160171508789 21.37500190734863 25.87499809265137 21.375 L 6.75 21.375 C 6.128679752349854 21.375 5.625 20.8713207244873 5.625 20.25 C 5.625 19.6286792755127 6.128679752349854 19.125 6.75 19.125 L 25.875 19.125 C 27.73896408081055 19.125 29.25000190734863 17.61395835876465 29.25000190734863 15.74999713897705 L 29.25 6.75 C 29.25 6.128679752349854 29.7536792755127 5.625 30.375 5.625 Z" fill="#6981b5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                        width: 27.0,
                        height: 22.5,
                      ),
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => signIn()));
                      },
                    ),
                  ), //----------Back Icon----------
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String Background =
    '<svg viewBox="-124.3 -213.0 250.3 250.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  /><stop offset="0.047428" stop-color="#ff321387"  /><stop offset="0.133932" stop-color="#ffb4b4d3"  /><stop offset="0.211895" stop-color="#ffdce4f3"  /><stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ff6a77ab"  /></linearGradient></defs><path transform="translate(-100.26, -233.0)" d="M 932.4722900390625 95.236328125 C 715.0507202148438 95.236328125 295.9188232421875 69.55056762695312 93.37493896484375 230.385986328125 C 23.73117065429688 285.6884765625 -24.022705078125 455.0660095214844 -24.022705078125 530 C -24.022705078125 761.5343627929688 65.29049682617188 970.99853515625 304.8984985351562 1041.84765625 C 330.8088073730469 1050.899658203125 365.7186889648438 1057.711059570312 399.7589416503906 1060 C 436.7926635742188 1062.490356445312 473.1695861816406 1060 505.1127319335938 1060 C 580.9110717773438 1060 656.1889038085938 1020.7783203125 735.28759765625 978.63037109375 C 771.1249389648438 959.5343017578125 820.5877685546875 941.6094970703125 848.7631225585938 923.34716796875 C 880.033935546875 903.0784912109375 918.8973388671875 866.2056884765625 941.8712768554688 835.185546875 C 971.9507446289062 794.5714721679688 982.9915161132812 758.1400146484375 998.2335205078125 723.60107421875 C 1026.332885742188 659.9268188476562 1028.603393554688 626.6895141601562 998.2335205078125 539.41015625 C 903.0227661132812 265.78662109375 1224.705688476562 95.236328125 932.4722900390625 95.236328125 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.68412" y1="0.157539" x2="0.24164" y2="0.93267"><stop offset="0.0" stop-color="#ff335ca6"  /><stop offset="0.08674" stop-color="#ff8996c2"  /><stop offset="0.158918" stop-color="#ff7a87b7"  /><stop offset="0.59789" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ffb5c3e2"  /></linearGradient></defs><path transform="translate(-82.0, -213.0)" d="M 513.5 0 C 797.0982055664062 0 1027 235.0505065917969 1027 525 C 1027 814.949462890625 797.0982055664062 1050 513.5 1050 C 390.7019653320312 1050 304.149658203125 999.5283813476562 222.4853210449219 944.71533203125 C 115.8691024780273 873.1547241210938 32.13705444335938 777.7958984375 32.13705444335938 613.39453125 C 32.13705444335938 508.1428527832031 13.97368240356445 359.6548156738281 60.75470352172852 262.614990234375 C 68.71327209472656 246.106201171875 57.71491241455078 215.8832855224609 67.75968170166016 200.606689453125 C 159.6092681884766 60.91526031494141 350.3712158203125 0 513.5 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
