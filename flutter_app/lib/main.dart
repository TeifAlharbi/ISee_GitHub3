import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/AboutColorBlindness.dart';
import 'package:flutter_app/AboutISee.dart';
import 'package:flutter_app/AboutIshihara.dart';
import 'package:flutter_app/IshiharaTest.dart';
import 'package:flutter_app/Profile.dart';
import 'package:flutter_app/Security.dart';
import 'package:flutter_app/SignIn.dart';
import 'package:flutter_app/Camera.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/SignUp.dart';
import 'package:flutter_app/Support.dart';
import 'package:flutter_app/Test.dart';
import 'package:flutter_app/TestInstructions.dart';
import 'package:flutter_app/TestPlate1.dart';
import 'package:flutter_app/TestPlate10.dart';
import 'package:flutter_app/TestPlate11.dart';
import 'package:flutter_app/TestPlate12.dart';
import 'package:flutter_app/TestPlate3.dart';
import 'package:flutter_app/TestPlate4.dart';
import 'package:flutter_app/TestPlate5.dart';
import 'package:flutter_app/TestPlate6.dart';
import 'package:flutter_app/TestPlate7.dart';
import 'package:flutter_app/TestPlate8.dart';
import 'package:flutter_app/TestPlate9.dart';
import 'package:flutter_app/TestResult.dart';
import 'package:flutter_app/TestResultNew.dart';
import 'package:flutter_app/UserSettings.dart';
import 'package:flutter_app/language.dart';
import 'TestPlate2.dart';
import 'TestPlate2.dart';

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
                home:Camera()
            );
          }else{
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'ISee',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: SignIn()
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