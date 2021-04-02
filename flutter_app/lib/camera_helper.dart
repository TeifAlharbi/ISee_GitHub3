import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/tflite_helper.dart';

class CameraHelper {
  static CameraController camera;
  CameraController cameraController;
  static bool isDetecting = false;
  static CameraLensDirection _direction = CameraLensDirection.back;
  static Future<void> initializeControllerFuture;

  static Future<CameraDescription> _getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  static void initializeCamera() async {
    camera = CameraController(
        await _getCamera(_direction),
        defaultTargetPlatform == TargetPlatform.android
            ? ResolutionPreset.medium
            : ResolutionPreset.low,
        enableAudio: false);

    // camera = CameraController(
    // await _getCamera(_direction), ResolutionPreset.low, enableAudio: false);

    initializeControllerFuture = camera.initialize().then((value) {
      camera.startImageStream((CameraImage image) {
        if (!TFLiteHelper.modelLoaded) return;
        if (isDetecting) return;
        isDetecting = true;
        try {
          TFLiteHelper.classifyImage(image);
        } catch (e) {
          print(e);
        }
      });
    });
  }

  // //camera initialization
  // initCamera() {
  //   cameraController = CameraController(cameras[0], ResolutionPreset.medium);
  //   cameraController.initialize().then((value) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {
  //       cameraController.startImageStream((imageFromStream) => {
  //             if (!isWorking)
  //               {
  //                 isWorking = true,
  //                 imgCamera = imageFromStream,
  //               }
  //           });
  //     });
  //   });
  // }
}
