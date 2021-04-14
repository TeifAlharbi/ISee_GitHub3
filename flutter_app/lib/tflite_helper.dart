import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter_app/result.dart';
import 'package:tflite/tflite.dart';

class TFLiteHelper {
  static StreamController<List<Result>> tfLiteResultsController =
      new StreamController.broadcast();
  static List<Result> _outputs = List();
  static var modelLoaded = false;

  static Future<String> loadModel() async {
    return Tflite.loadModel(
      model: "assets/ourColors.tflite",
      labels: "assets/ourColors.txt",
    );
  }

  static classifyImage(CameraImage image) async {
    await Tflite.runModelOnFrame(
      bytesList: image.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: image.height,
      imageWidth: image.width,
      imageMean: 127.5,
      imageStd: 127.5,
      numResults: 1,
      threshold: 0.4,
    ).then((value) {
      if (value.isNotEmpty) {
        //Clear previous results
        _outputs.clear();
        value.forEach((element) {
          _outputs.add(Result(
              element['confidence'], element['index'], element['label']));
          print(element['label']);
        });
      }
      //Sort results according to most confidence
      _outputs.sort((a, b) => a.confidence.compareTo(b.confidence));
      //Send results
      tfLiteResultsController.add(_outputs);
    });
  }

  static void disposeModel() {
    Tflite.close();
    tfLiteResultsController.close();
  }
}
