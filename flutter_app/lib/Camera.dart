import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_app/colors.dart';
import 'package:flutter_app/camera_helper.dart';
import 'package:flutter_app/tflite_helper.dart';
import 'package:flutter_app/result.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/Profile.dart';
import 'package:flutter_app/UserSettings.dart';

class Camera extends StatefulWidget {
  Camera({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Camera createState() => _Camera();
}

class _Camera extends State<Camera> with SingleTickerProviderStateMixin {
  AnimationController _colorAnimController;
  Animation _colorTween;
  List<Result> outputs;

  void initState() {
    super.initState();
    //Load TFLite Model
    TFLiteHelper.loadModel().then((value) {
      setState(() {
        TFLiteHelper.modelLoaded = true;
        print("tf loaded successfully");
      });
      print("----------------------"+ TFLiteHelper.modelLoaded.toString());
    });
    //Initialize Camera
    CameraHelper.initializeCamera();
    //Setup Animation
    _setupAnimation();
    //Subscribe to TFLite's Classify events
    TFLiteHelper.tfLiteResultsController.stream.listen(
      (value) {
        value.forEach((element) {
          _colorAnimController.animateTo(element.confidence,
              curve: Curves.bounceIn, duration: Duration(milliseconds: 500));
        });
        //Set Results
        outputs = value;
        //Update results on screen
        setState(() {
          //Set bit to false to allow detection again
          CameraHelper.isDetecting = false;
        });
      },
      onDone: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Stack(
        children: <Widget>[
          FutureBuilder<void>(
            future: CameraHelper.initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return Stack(
                  children: <Widget>[
                    CameraPreview(CameraHelper.camera),
                    _buildResultsWidget(width, outputs)
                  ],
                );
              } else {
                // Otherwise, display a loading indicator.
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.08 ,top: screenHeight  * 0.800
                , right:screenWeidth * 0.08 , bottom: screenHeight  * 0.01),
            child: Container(
              child: SizedBox(
                //   width: 345.0,
                // height: 95.0,
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
        ],
      ),
    );
  }

  @override
  void dispose() async{
    await TFLiteHelper.disposeModel();
    //await Tflite.close();
    CameraHelper.camera.dispose();
    super.dispose();
  }

  Widget _buildResultsWidget(double width, List<Result> outputs) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: outputs != null && outputs.isNotEmpty
              ? ListView.builder(
                  itemCount: outputs.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom:200.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Text(
                          outputs[index].label ?? 'default value',
                          //  outputs[index].label,
                          style: TextStyle(
                            color: _colorTween.value,
                            fontSize: 20.0,
                          ),
                        ),
                        AnimatedBuilder(
                            animation: _colorAnimController,
                            builder: (context, child) => LinearPercentIndicator(
                                  width: width * 0.88,
                                  lineHeight: 14.0,
                                  percent: outputs[index].confidence,
                                  progressColor: _colorTween.value,
                                )),
                        Text(
                          "${(outputs[index].confidence * 100.0).toStringAsFixed(2)} %" ??
                              'default value',
                          //"${(outputs[index].confidence * 100.0).toStringAsFixed(2)} %",
                          style: TextStyle(
                            color: _colorTween.value,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    );
                  })
              : Center(
                  child: Text("Wating for model to detect..",
                      style: TextStyle(
                        color: f10,
                        fontSize: 20.0,
                      ))),
        ),
      ),
    );
  }

  void _setupAnimation() {
    _colorAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _colorTween = ColorTween(begin: f7, end: f1).animate(_colorAnimController);
  }
}


const String _svg_hp4zgj =
    '<svg viewBox="151.2 747.6 50.6 45.9" ><path transform="translate(147.8, 744.26)" d="M 51.16246795654297 12.53848457336426 L 45.70444107055664 17.51151275634766 C 45.59551620483398 17.61031341552734 45.42435836791992 17.65422630310059 45.27913665771484 17.63227081298828 L 39.63956832885742 16.70541572570801 C 39.4442024230957 16.6724796295166 39.28688049316406 16.5281982421875 39.25057601928711 16.3525505065918 L 38.24091339111328 11.23680782318115 C 38.21670913696289 11.09409427642822 38.26511764526367 10.9498119354248 38.37404251098633 10.85100936889648 L 43.81996917724609 5.88895845413208 C 44.24527359008789 5.503160953521729 44.18476486206055 4.863300323486328 43.69895172119141 4.554348468780518 C 42.47145843505859 3.760797262191772 41.01229095458984 3.374999523162842 39.83319854736328 3.374999523162842 C 39.74848556518555 3.374999523162842 39.66377639770508 3.374999523162842 39.58942794799805 3.385977506637573 C 38.06975555419922 3.462823629379272 34.81256866455078 4.234419345855713 32.29533767700195 6.660553932189941 C 29.85244941711426 8.998867034912109 27.29891014099121 13.3430118560791 29.56026649475098 18.18430519104004 C 29.8282413482666 18.7692756652832 30.13079452514648 19.54087066650391 29.23178100585938 20.35637855529785 C 28.30857086181641 21.17188453674316 4.956754684448242 41.12046432495117 4.956754684448242 41.12046432495117 C 2.76800799369812 42.82989501953125 2.927063226699829 45.99468994140625 4.944652080535889 47.83585357666016 C 5.978515625 48.76271057128906 7.37544059753418 49.24731063842773 8.749890327453613 49.24731063842773 C 10.0984058380127 49.24731063842773 11.41234683990479 48.78466796875 12.34766578674316 47.80292129516602 C 12.34766578674316 47.80292129516602 34.15560531616211 26.72988891601562 35.22577667236328 25.77166748046875 C 35.71158981323242 25.34195899963379 36.16109466552734 25.20865440368652 36.57429122924805 25.20865440368652 C 36.97538757324219 25.20865440368652 37.34018325805664 25.34038925170898 37.62025451660156 25.47369384765625 C 38.82354736328125 26.03670692443848 40.17378997802734 26.28920364379883 41.55861663818359 26.28920364379883 C 44.81579971313477 26.28920364379883 48.24414443969727 24.92166137695312 50.33607864379883 23.02560234069824 C 53.30281066894531 20.33442878723145 53.84913635253906 17.73264312744141 53.9338493347168 16.39803504943848 C 54.00646591186523 15.30650997161865 53.66588592529297 13.90603160858154 52.63373565673828 12.62631130218506 C 52.28104782104492 12.20757865905762 51.58777618408203 12.16366672515869 51.16246795654297 12.53848743438721 Z M 10.00158882141113 45.42069625854492 C 9.332517623901367 46.01664352416992 8.251976013183594 46.01664352416992 7.582903385162354 45.42069625854492 C 6.925933837890625 44.81377410888672 6.925933837890625 43.83359527587891 7.582903385162354 43.22666549682617 C 8.251976013183594 42.63072204589844 9.332517623901367 42.63072204589844 10.00158882141113 43.22666549682617 C 10.65856075286865 43.84456634521484 10.65856075286865 44.82631683349609 10.00158882141113 45.42069625854492 Z" fill="#6981b5" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_15ia88 =
    '<svg viewBox="296.2 655.4 35.4 36.2" ><path transform="translate(290.23, 649.44)" d="M 23.70994567871094 10.29697704315186 C 26.27788734436035 10.29697704315186 28.35880470275879 12.42284870147705 28.35880470275879 15.0462646484375 C 28.35880470275879 17.66968154907227 26.27788734436035 19.79555320739746 23.70994567871094 19.79555320739746 C 21.14200401306152 19.79555320739746 19.06108474731445 17.66968154907227 19.06108474731445 15.0462646484375 C 19.06108474731445 12.42284870147705 21.14200401306152 10.29697704315186 23.70994567871094 10.29697704315186 M 23.70994567871094 30.65107345581055 C 30.28476333618164 30.65107345581055 37.21377944946289 33.95296096801758 37.21377944946289 35.40036010742188 L 37.21377944946289 37.88808441162109 L 10.20611190795898 37.88808441162109 L 10.20611190795898 35.40036010742188 C 10.20611190795898 33.95296096801758 17.13512802124023 30.65107345581055 23.70994567871094 30.65107345581055 M 23.70994567871094 6 C 18.81757354736328 6 14.85497283935547 10.04820442199707 14.85497283935547 15.0462646484375 C 14.85497283935547 20.04432678222656 18.81757164001465 24.092529296875 23.70994567871094 24.092529296875 C 28.60231781005859 24.092529296875 32.56491851806641 20.04432678222656 32.56491851806641 15.0462646484375 C 32.56491851806641 10.04820251464844 28.60231781005859 6 23.70994567871094 6 Z M 23.70994567871094 26.35409545898438 C 17.79924964904785 26.35409545898438 6 29.38459396362305 6 35.40036010742188 L 6 42.18505859375 L 41.41989135742188 42.18505859375 L 41.41989135742188 35.40036010742188 C 41.41989135742188 29.38459396362305 29.62063980102539 26.35409545898438 23.70994567871094 26.35409545898438 Z" fill="#6a77ab" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j0bnl7 =
    '<svg viewBox="74.0 683.0 73.0 58.6" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(74.0, 680.75)" d="M 72.9678955078125 16.9124755859375 L 72.9678955078125 54.61598587036133 C 72.9678955078125 58.08523178100586 69.90380859375 60.89990234375 66.12715911865234 60.89990234375 L 6.840740203857422 60.89990234375 C 3.064081430435181 60.89990234375 0 58.08523178100586 0 54.61598587036133 L 0 16.9124755859375 C 0 13.44322872161865 3.064081430435181 10.62855815887451 6.840740203857422 10.62855815887451 L 19.3820972442627 10.62855815887451 L 21.13503646850586 6.321455478668213 C 22.13264465332031 3.873345851898193 24.68367004394531 2.250000238418579 27.53397750854492 2.250000238418579 L 45.41965866088867 2.250000238418579 C 48.26996994018555 2.250000238418579 50.82099533081055 3.873345851898193 51.818603515625 6.321455478668213 L 53.58579635620117 10.62855815887451 L 66.12715911865234 10.62855815887451 C 69.90380859375 10.62855815887451 72.9678955078125 13.44322872161865 72.9678955078125 16.9124755859375 Z M 53.58579635620117 35.76422500610352 C 53.58579635620117 27.0976619720459 45.9184684753418 20.05443382263184 36.48394775390625 20.05443382263184 C 27.04942512512207 20.05443382263184 19.3820972442627 27.0976619720459 19.3820972442627 35.76422500610352 C 19.3820972442627 44.43080520629883 27.04942512512207 51.47402954101562 36.48394775390625 51.47402954101562 C 45.9184684753418 51.47402954101562 53.58579635620117 44.43080520629883 53.58579635620117 35.76422500610352 Z M 49.02530288696289 35.76422500610352 C 49.02530288696289 42.11360549926758 43.39594650268555 47.28474807739258 36.48394775390625 47.28474807739258 C 29.57195091247559 47.28474807739258 23.94259262084961 42.11360549926758 23.94259262084961 35.76422500610352 C 23.94259262084961 29.41485595703125 29.57195091247559 24.24371337890625 36.48394775390625 24.24371337890625 C 43.39594650268555 24.24371337890625 49.02530288696289 29.41485595703125 49.02530288696289 35.76422500610352 Z" fill="#6a77ab" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';

