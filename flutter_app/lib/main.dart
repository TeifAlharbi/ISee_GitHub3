import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/profile.dart';
import 'package:flutter_app/signIn.dart';
import 'package:flutter_app/Camera.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/signUp.dart';
import 'package:flutter_app/testPlate1.dart';
import 'package:flutter_app/testResult.dart';
import 'package:styled_text/styled_text.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

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
          var currentUser = FirebaseAuth.instance.currentUser;

          if (currentUser != null) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'ISee',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: testPlate1());
          } else {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'ISee',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: signIn());
          }
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
