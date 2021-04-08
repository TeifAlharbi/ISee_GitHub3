import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dcdg/dcdg.dart';
import 'package:flutter_app/aboutColorBlindness.dart';
import 'package:flutter_app/aboutISee.dart';
import 'package:flutter_app/aboutIshihara.dart';
import 'package:flutter_app/IshiharaTest.dart';
import 'package:flutter_app/profile.dart';
import 'package:flutter_app/security.dart';
import 'package:flutter_app/signIn.dart';
import 'package:flutter_app/Camera.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/signUp.dart';
import 'package:flutter_app/support.dart';
import 'package:flutter_app/Test.dart';
import 'package:flutter_app/testInstructions.dart';
import 'package:flutter_app/testPlate1.dart';
import 'package:flutter_app/testPlate10.dart';
import 'package:flutter_app/testPlate11.dart';
import 'package:flutter_app/testPlate12.dart';
import 'package:flutter_app/testPlate3.dart';
import 'package:flutter_app/testPlate4.dart';
import 'package:flutter_app/testPlate5.dart';
import 'package:flutter_app/testPlate6.dart';
import 'package:flutter_app/testPlate7.dart';
import 'package:flutter_app/testPlate8.dart';
import 'package:flutter_app/testPlate9.dart';
import 'package:flutter_app/testResult.dart';
import 'package:flutter_app/testResultNew.dart';
import 'package:flutter_app/UserSettings.dart';
import 'package:flutter_app/language.dart';
import 'testPlate2.dart';
import 'testPlate2.dart';


List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  //runApp(DevicePreview(builder: (context) => MyApp(),
  //enabled: !kReleaseMode,));


runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      // ignore: missing_return
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // return SomethingWentWrong();
          print("ERROR CONNECTION");
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print("CONNECTION DONE");
          var currentUser =  FirebaseAuth.instance.currentUser;

          if(currentUser != null){
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'ISee',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home:testPlate1()
            );
          }else{
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'ISee',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: signIn()
            );
          }
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
        );
        print("LOADING");

      },
    );
  }
}