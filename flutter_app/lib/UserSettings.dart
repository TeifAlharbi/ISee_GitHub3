import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_app/aboutColorBlindness.dart';
import 'package:flutter_app/aboutISee.dart';
import 'package:flutter_app/profile.dart';
import 'package:flutter_app/security.dart';
import 'package:flutter_app/support.dart';
import 'package:flutter_app/Test.dart';
import 'package:flutter_app/Camera.dart';
import 'package:flutter_app/language.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'globals.dart' as globals;

class UserSettings extends StatefulWidget {
  @override
  _UserSettings createState() => _UserSettings();
}

class _UserSettings extends State<UserSettings> {
  void initState() {
    super.initState();
  }

  //variables
  final _formkey = GlobalKey<FormState>();
  String sett;
  String lang;
  String sec;
  String sup;
  String test;
  String color;
  String ISee;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AutoSizeText((() {
            if (globals.language == 0) {
              setState(() {
                sett = "Settings";
                lang = 'Language';
                sec = 'Security ';
                sup = 'Support';
                test = 'Ishihara Test';
                color = 'About Color-Blindness';
                ISee = 'About ISee';
              });
              return "";
            } else {
              setState(() {
                sett = "الاعدادات";
                lang = 'اللغه';
                sec = 'الخصوصية';
                sup = 'الدعم الفني';
                test = 'اختبار ايشيهارا';
                color = 'عن عمى الالوان';
                ISee = 'عن ISee';
              });
              return "";
            }
          })()), //----------Translation----------
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/fram3.png"),
                fit: BoxFit.cover,
              ),
            ),
          ), //----------Background----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.05,
                top: screenHeight * 0.10,
                right: screenWeidth * 0.10,
                bottom: screenHeight * 0.05),
            child: Container(
              alignment: Alignment(-0.78, -0.37),
              width: screenWeidth,
              height: screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: Colors.white.withOpacity(0.72),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFF707070).withOpacity(0.72),
                ),
              ),
              child: AutoSizeText(
                sett,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  //   fontSize: screenText * 12.0,
                  color: const Color(0xFFC3BABA).withOpacity(0.72),
                  fontWeight: FontWeight.w900,
                ),
                minFontSize: 25,
                maxFontSize: 30,
                maxLines: 1,
              ),
            ),
          ), //----------Header----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.73, top: screenHeight * 0.09),
            child: Container(
              width: screenWeidth * 0.20,
              height: screenHeight * 0.09,
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
            padding: EdgeInsets.only(
                left: screenWeidth * 0.08,
                top: screenHeight * 0.800,
                right: screenWeidth * 0.08,
                bottom: screenHeight * 0.01),
            child: Container(
              child: SizedBox(
                width: screenWeidth,
                height: screenHeight * 0.13,
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
            padding: EdgeInsets.only(
                left: screenWeidth * 0.05,
                top: screenHeight * 0.22,
                right: screenWeidth * 0.10,
                bottom: screenHeight * 0.05),
            child: Container(
              child: SizedBox(
                width: 333.0,
                height: 32.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 1.0, 26.4, 30.8),
                      size: Size(333.2, 32.0),
                      pinLeft: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                      child:
                          // Adobe XD layer: 'Icon metro-language' (shape)
                          SvgPicture.string(
                        _svg_wl43uz,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(38.0, 8.0, 106.0, 24.0),
                      size: Size(333.2, 32.0),
                      pinLeft: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: AutoSizeText(
                        lang,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          color: const Color(0xFFC3BABA),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 15,
                        maxFontSize: 21,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(317.0, 0.0, 16.2, 28.8),
                      size: Size(333.2, 32.0),
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                    ),
                  ],
                ),
              ),
            ),
          ), //----------Language Label----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.05,
                top: screenHeight * 0.32,
                right: screenWeidth * 0.10,
                bottom: screenHeight * 0.05),
            child: Container(
              child: SizedBox(
                width: 332.0,
                height: 37.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 27.0, 33.0),
                      size: Size(332.2, 37.1),
                      pinLeft: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                      child:
                          // Adobe XD layer: 'Icon material-secur…' (shape)
                          SvgPicture.string(
                        _svg_9tnfh8,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(40.0, 8.3, 94.0, 24.0),
                      size: Size(332.2, 37.1),
                      pinLeft: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: AutoSizeText(
                        sec,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          //   fontSize: 21.5,
                          color: const Color(0xFFC3BABA),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 15,
                        maxFontSize: 21,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(316.0, 8.3, 16.2, 28.8),
                      size: Size(332.2, 37.1),
                      pinRight: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                    ),
                  ],
                ),
              ),
            ),
          ), //----------Security Label----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.05,
                top: screenHeight * 0.42,
                right: screenWeidth * 0.10,
                bottom: screenHeight * 0.05),
            child: Container(
              child: SizedBox(
                width: 332.0,
                height: 33.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 3.5, 27.5, 29.2),
                      size: Size(332.0, 32.7),
                      pinLeft: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                      child:
                          // Adobe XD layer: 'Icon awesome-questi…' (shape)
                          SvgPicture.string(
                        _svg_7s82km,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(42.8, 8.4, 84.0, 24.0),
                      size: Size(332.0, 32.7),
                      pinLeft: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: AutoSizeText(
                        sup,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          //  fontSize: 21.5,
                          color: const Color(0xFFC3BABA),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 15,
                        maxFontSize: 21,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(315.8, 0.0, 16.2, 28.8),
                      size: Size(332.0, 32.7),
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                    ),
                  ],
                ),
              ),
            ),
          ), //----------Support Label----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.05,
                top: screenHeight * 0.52,
                right: screenWeidth * 0.10,
                bottom: screenHeight * 0.05),
            child: Container(
              child: SizedBox(
                width: 332.0,
                height: 42.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 34.0, 42.1),
                      size: Size(332.2, 42.1),
                      pinLeft: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                      child:
                          // Adobe XD layer: 'Icon metro-clipboard' (shape)
                          SvgPicture.string(
                        _svg_hkjrup,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(38, 13.9, 142.0, 24.0),
                      size: Size(332.2, 42.1),
                      pinLeft: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: AutoSizeText(
                        test,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          // fontSize: 21.5,
                          color: const Color(0xFFC3BABA),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 15,
                        maxFontSize: 21,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(316.0, 7.1, 16.2, 28.8),
                      size: Size(332.2, 42.1),
                      pinRight: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                    ),
                  ],
                ),
              ),
            ),
          ), //----------About Ishihara-test Label----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.05,
                top: screenHeight * 0.62,
                right: screenWeidth * 0.10,
                bottom: screenHeight * 0.05),
            child: Container(
              child: SizedBox(
                width: 332.0,
                height: 35.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 32.0, 35.4),
                      size: Size(332.2, 35.4),
                      pinLeft: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                      child:
                          // Adobe XD layer: 'Icon material-color…' (shape)
                          SvgPicture.string(
                        _svg_mv1ywq,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(38.0, 8.4, 248.0, 24.0),
                      size: Size(350.2, 35.4),
                      pinLeft: true,
                      pinRight: true,
                      pinBottom: true,
                      fixedHeight: true,
                      child: AutoSizeText(
                        color,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          color: const Color(0xFFC3BABA),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                        // maxLines: 1,
                        minFontSize: 10,
                        maxFontSize: 20,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(316.0, 5.1, 16.2, 28.8),
                      size: Size(332.2, 35.4),
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                    ),
                  ],
                ),
              ),
            ),
          ), //----------About color-blind Label----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.05,
                top: screenHeight * 0.72,
                right: screenWeidth * 0.10,
                bottom: screenHeight * 0.05),
            child: Container(
              child: SizedBox(
                width: 329.0,
                height: 38.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 23.7, 37.5),
                      size: Size(329.2, 37.5),
                      pinLeft: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                      child:
                          // Adobe XD layer: 'Icon material-perm-…' (shape)
                          SvgPicture.string(
                        _svg_pclm24,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(38.0, 10.3, 118.0, 24.0),
                      size: Size(329.2, 37.5),
                      pinLeft: true,
                      pinBottom: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: AutoSizeText(
                        ISee,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          //  fontSize: 21.5,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 15,
                        maxFontSize: 21,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(313.0, 5.1, 16.2, 28.8),
                      size: Size(329.2, 37.5),
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      fixedWidth: true,
                    ),
                  ],
                ),
              ),
            ),
          ), //----------About ISee Label----------
          Padding(
            //padding: const EdgeInsets.only(top: 600.0, left: 65.0),
            padding: const EdgeInsets.only(top: 575.0, left: 65.0),
            child: Container(
              child: InkWell(
                child: SvgPicture.string(
                  _svg_hp4zgj,
                  width: 50.6,
                  height: 45.9,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserSettings()));
                },
              ),
            ),
          ), //----------Setting Icon----------
          Padding(
            //padding: const EdgeInsets.only(top: 605.0, left: 250.0),
            padding: const EdgeInsets.only(top: 580.0, left: 250.0),
            child: Container(
              child: InkWell(
                child: SvgPicture.string(
                  _svg_15ia88,
                  width: 35.4,
                  height: 36.2,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
            ),
          ), //----------Profile Icon----------
          Padding(
            //padding: const EdgeInsets.only(top: 595.0, left: 145.0),
            padding: const EdgeInsets.only(top: 565.0, left: 145.0),
            child: Container(
              child: InkWell(
                child: SvgPicture.string(
                  _svg_j0bnl7,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Camera()));
                },
              ),
            ),
          ), //----------Camera Icon----------
          Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => language()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 300, top: 145),
                    child: Icon(
                      Icons.arrow_right,
                      color: const Color(0xFFC3BABA),
                      size: 60.0,
                    ),
                  ),
                ), //----------language Icon----------
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => security()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 300, top: 10),
                    child: Icon(
                      Icons.arrow_right,
                      color: const Color(0xFFC3BABA),
                      size: 60.0,
                    ),
                  ),
                ), //----------Security Icon----------
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => support()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 300, top: 10),
                    child: Icon(
                      Icons.arrow_right,
                      color: const Color(0xFFC3BABA),
                      size: 60.0,
                    ),
                  ),
                ), //---------- Support Icon----------
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Test()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 300, top: 10),
                    child: Icon(
                      Icons.arrow_right,
                      color: const Color(0xFFC3BABA),
                      size: 60.0,
                    ),
                  ),
                ), //----------Test Icon----------
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => aboutColorBlindness()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 300, top: 10),
                    child: Icon(
                      Icons.arrow_right,
                      color: const Color(0xFFC3BABA),
                      size: 60.0,
                    ),
                  ),
                ), //----------AboutColorBlindness Icon----------
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => aboutISee()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 300, top: 10),
                    child: Icon(
                      Icons.arrow_right,
                      color: const Color(0xFFC3BABA),
                      size: 60.0,
                    ),
                  ),
                ), //----------AboutISee Icon----------
              ],
            ),
          ), //Fotter action (all the list)
        ],
      ),
    );
  }
}

const String Background =
    '<svg viewBox="-132.8 -212.0 250.3 250.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  /><stop offset="0.047428" stop-color="#ff321387"  /><stop offset="0.133932" stop-color="#ffb4b4d3"  /><stop offset="0.211895" stop-color="#ffdce4f3"  /><stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ff6a77ab"  /></linearGradient></defs><path transform="translate(-100.26, -233.0)" d="M 932.4722900390625 95.21127319335938 C 715.0507202148438 95.21127319335938 295.9188232421875 69.95317840576172 93.37493896484375 228.1106872558594 C 23.73117065429688 282.4923706054688 -24.022705078125 449.0497741699219 -24.022705078125 522.7361450195312 C -24.022705078125 685.9822998046875 -68.51026916503906 865.0326538085938 46.0013427734375 963.8968505859375 C 78.24923706054688 991.7384033203125 34.607666015625 994.908935546875 70.93707275390625 1011.32470703125 C 84.87640380859375 1017.623474121094 74.25277709960938 1038.3515625 93.37493896484375 1043.91162109375 C 119.2852478027344 1052.81298828125 364.1560974121094 1056.273681640625 398.1963500976562 1058.5244140625 C 435.2300720214844 1060.973388671875 473.1695861816406 1043.91162109375 505.1127319335938 1043.91162109375 C 580.9110717773438 1043.91162109375 656.1889038085938 1005.343017578125 735.28759765625 963.8968505859375 C 771.1249389648438 945.1187744140625 820.5877685546875 927.4923706054688 848.7631225585938 909.5341796875 C 880.033935546875 889.6029663085938 918.8973388671875 853.3441162109375 941.8712768554688 822.8403930664062 C 971.9507446289062 782.9025268554688 982.9915161132812 747.07763671875 998.2335205078125 713.11376953125 C 1026.332885742188 650.499755859375 1028.603393554688 617.8158569335938 998.2335205078125 531.9896850585938 C 903.0227661132812 262.921875 1224.705688476562 95.21127319335938 932.4722900390625 95.21127319335938 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.68412" y1="0.157539" x2="0.24164" y2="0.93267"><stop offset="0.0" stop-color="#ffffffff"  /><stop offset="0.08674" stop-color="#ff8996c2"  /><stop offset="0.158918" stop-color="#ff7a87b7"  /><stop offset="0.59789" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ffb5c3e2"  /></linearGradient></defs><path transform="translate(-81.0, -212.0)" d="M 513.5 0 C 797.0982055664062 0 1027 235.0505065917969 1027 525 C 1027 814.949462890625 810.3135986328125 983.9443359375 526.7153930664062 983.9443359375 C 403.9173583984375 983.9443359375 239.5424194335938 908.4990844726562 157.8780822753906 853.68603515625 C 51.26186370849609 782.1254272460938 32.13705444335938 777.7958984375 32.13705444335938 613.39453125 C 32.13705444335938 508.1428527832031 13.97368240356445 359.6548156738281 60.75470352172852 262.614990234375 C 68.71327209472656 246.106201171875 57.71491241455078 215.8832855224609 67.75968170166016 200.606689453125 C 159.6092681884766 60.91526031494141 350.3712158203125 0 513.5 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hp4zgj =
    '<svg viewBox="151.2 747.6 50.6 45.9" ><path transform="translate(147.8, 744.26)" d="M 51.16246795654297 12.53848457336426 L 45.70444107055664 17.51151275634766 C 45.59551620483398 17.61031341552734 45.42435836791992 17.65422630310059 45.27913665771484 17.63227081298828 L 39.63956832885742 16.70541572570801 C 39.4442024230957 16.6724796295166 39.28688049316406 16.5281982421875 39.25057601928711 16.3525505065918 L 38.24091339111328 11.23680782318115 C 38.21670913696289 11.09409427642822 38.26511764526367 10.9498119354248 38.37404251098633 10.85100936889648 L 43.81996917724609 5.88895845413208 C 44.24527359008789 5.503160953521729 44.18476486206055 4.863300323486328 43.69895172119141 4.554348468780518 C 42.47145843505859 3.760797262191772 41.01229095458984 3.374999523162842 39.83319854736328 3.374999523162842 C 39.74848556518555 3.374999523162842 39.66377639770508 3.374999523162842 39.58942794799805 3.385977506637573 C 38.06975555419922 3.462823629379272 34.81256866455078 4.234419345855713 32.29533767700195 6.660553932189941 C 29.85244941711426 8.998867034912109 27.29891014099121 13.3430118560791 29.56026649475098 18.18430519104004 C 29.8282413482666 18.7692756652832 30.13079452514648 19.54087066650391 29.23178100585938 20.35637855529785 C 28.30857086181641 21.17188453674316 4.956754684448242 41.12046432495117 4.956754684448242 41.12046432495117 C 2.76800799369812 42.82989501953125 2.927063226699829 45.99468994140625 4.944652080535889 47.83585357666016 C 5.978515625 48.76271057128906 7.37544059753418 49.24731063842773 8.749890327453613 49.24731063842773 C 10.0984058380127 49.24731063842773 11.41234683990479 48.78466796875 12.34766578674316 47.80292129516602 C 12.34766578674316 47.80292129516602 34.15560531616211 26.72988891601562 35.22577667236328 25.77166748046875 C 35.71158981323242 25.34195899963379 36.16109466552734 25.20865440368652 36.57429122924805 25.20865440368652 C 36.97538757324219 25.20865440368652 37.34018325805664 25.34038925170898 37.62025451660156 25.47369384765625 C 38.82354736328125 26.03670692443848 40.17378997802734 26.28920364379883 41.55861663818359 26.28920364379883 C 44.81579971313477 26.28920364379883 48.24414443969727 24.92166137695312 50.33607864379883 23.02560234069824 C 53.30281066894531 20.33442878723145 53.84913635253906 17.73264312744141 53.9338493347168 16.39803504943848 C 54.00646591186523 15.30650997161865 53.66588592529297 13.90603160858154 52.63373565673828 12.62631130218506 C 52.28104782104492 12.20757865905762 51.58777618408203 12.16366672515869 51.16246795654297 12.53848743438721 Z M 10.00158882141113 45.42069625854492 C 9.332517623901367 46.01664352416992 8.251976013183594 46.01664352416992 7.582903385162354 45.42069625854492 C 6.925933837890625 44.81377410888672 6.925933837890625 43.83359527587891 7.582903385162354 43.22666549682617 C 8.251976013183594 42.63072204589844 9.332517623901367 42.63072204589844 10.00158882141113 43.22666549682617 C 10.65856075286865 43.84456634521484 10.65856075286865 44.82631683349609 10.00158882141113 45.42069625854492 Z" fill="#C3BABA" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_15ia88 =
    '<svg viewBox="296.2 655.4 35.4 36.2" ><path transform="translate(290.23, 649.44)" d="M 23.70994567871094 10.29697704315186 C 26.27788734436035 10.29697704315186 28.35880470275879 12.42284870147705 28.35880470275879 15.0462646484375 C 28.35880470275879 17.66968154907227 26.27788734436035 19.79555320739746 23.70994567871094 19.79555320739746 C 21.14200401306152 19.79555320739746 19.06108474731445 17.66968154907227 19.06108474731445 15.0462646484375 C 19.06108474731445 12.42284870147705 21.14200401306152 10.29697704315186 23.70994567871094 10.29697704315186 M 23.70994567871094 30.65107345581055 C 30.28476333618164 30.65107345581055 37.21377944946289 33.95296096801758 37.21377944946289 35.40036010742188 L 37.21377944946289 37.88808441162109 L 10.20611190795898 37.88808441162109 L 10.20611190795898 35.40036010742188 C 10.20611190795898 33.95296096801758 17.13512802124023 30.65107345581055 23.70994567871094 30.65107345581055 M 23.70994567871094 6 C 18.81757354736328 6 14.85497283935547 10.04820442199707 14.85497283935547 15.0462646484375 C 14.85497283935547 20.04432678222656 18.81757164001465 24.092529296875 23.70994567871094 24.092529296875 C 28.60231781005859 24.092529296875 32.56491851806641 20.04432678222656 32.56491851806641 15.0462646484375 C 32.56491851806641 10.04820251464844 28.60231781005859 6 23.70994567871094 6 Z M 23.70994567871094 26.35409545898438 C 17.79924964904785 26.35409545898438 6 29.38459396362305 6 35.40036010742188 L 6 42.18505859375 L 41.41989135742188 42.18505859375 L 41.41989135742188 35.40036010742188 C 41.41989135742188 29.38459396362305 29.62063980102539 26.35409545898438 23.70994567871094 26.35409545898438 Z" fill="#C3BABA" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j0bnl7 =
    '<svg viewBox="74.0 683.0 73.0 58.6" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path transform="translate(74.0, 680.75)" d="M 72.9678955078125 16.9124755859375 L 72.9678955078125 54.61598587036133 C 72.9678955078125 58.08523178100586 69.90380859375 60.89990234375 66.12715911865234 60.89990234375 L 6.840740203857422 60.89990234375 C 3.064081430435181 60.89990234375 0 58.08523178100586 0 54.61598587036133 L 0 16.9124755859375 C 0 13.44322872161865 3.064081430435181 10.62855815887451 6.840740203857422 10.62855815887451 L 19.3820972442627 10.62855815887451 L 21.13503646850586 6.321455478668213 C 22.13264465332031 3.873345851898193 24.68367004394531 2.250000238418579 27.53397750854492 2.250000238418579 L 45.41965866088867 2.250000238418579 C 48.26996994018555 2.250000238418579 50.82099533081055 3.873345851898193 51.818603515625 6.321455478668213 L 53.58579635620117 10.62855815887451 L 66.12715911865234 10.62855815887451 C 69.90380859375 10.62855815887451 72.9678955078125 13.44322872161865 72.9678955078125 16.9124755859375 Z M 53.58579635620117 35.76422500610352 C 53.58579635620117 27.0976619720459 45.9184684753418 20.05443382263184 36.48394775390625 20.05443382263184 C 27.04942512512207 20.05443382263184 19.3820972442627 27.0976619720459 19.3820972442627 35.76422500610352 C 19.3820972442627 44.43080520629883 27.04942512512207 51.47402954101562 36.48394775390625 51.47402954101562 C 45.9184684753418 51.47402954101562 53.58579635620117 44.43080520629883 53.58579635620117 35.76422500610352 Z M 49.02530288696289 35.76422500610352 C 49.02530288696289 42.11360549926758 43.39594650268555 47.28474807739258 36.48394775390625 47.28474807739258 C 29.57195091247559 47.28474807739258 23.94259262084961 42.11360549926758 23.94259262084961 35.76422500610352 C 23.94259262084961 29.41485595703125 29.57195091247559 24.24371337890625 36.48394775390625 24.24371337890625 C 43.39594650268555 24.24371337890625 49.02530288696289 29.41485595703125 49.02530288696289 35.76422500610352 Z" fill="#C3BABA" fill-opacity="0.8" stroke="none" stroke-width="1" stroke-opacity="0.8" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
const String _svg_wl43uz =
    '<svg viewBox="15.0 201.0 26.4 30.8" ><path transform="translate(10.23, 198.8)" d="M 16.02819442749023 20.76079368591309 C 16.01674652099609 20.79521751403809 15.94501781463623 20.79234504699707 15.81300735473633 20.75217819213867 C 15.68099689483643 20.71201133728027 15.500244140625 20.64602661132812 15.27074813842773 20.55422401428223 L 14.92644309997559 20.39928817749023 C 14.42147922515869 20.16975212097168 13.9222583770752 19.88858032226562 13.42878246307373 19.55577278137207 C 13.34844779968262 19.49839401245117 13.11317729949951 19.31764030456543 12.72297191619873 19.01351356506348 C 12.33276653289795 18.70938682556152 12.11471843719482 18.54584503173828 12.06882667541504 18.52289009094238 C 11.29990291595459 19.7049560546875 10.53099918365479 20.74357223510742 9.762115478515625 21.63874244689941 C 8.832502365112305 22.72900390625 8.229991912841797 23.36020469665527 7.954584121704102 23.5323429107666 C 7.908652782440186 23.5552978515625 7.796746253967285 23.57825469970703 7.618865489959717 23.60120964050293 C 7.440984725952148 23.62416458129883 7.334842205047607 23.62416458129883 7.30043888092041 23.60120964050293 C 7.369286060333252 23.5552978515625 7.839806079864502 23.02738952636719 8.711999893188477 22.01748085021973 C 8.953003883361816 21.7420539855957 9.443618774414062 21.08216285705566 10.18384265899658 20.03781127929688 C 10.9240665435791 18.99345970153809 11.37451362609863 18.31634712219238 11.53518295288086 18.00647735595703 C 11.73027610778809 17.66218376159668 12.02292537689209 17.09696769714355 12.41313076019287 16.31083297729492 C 12.80333614349365 15.52469730377197 13.00990676879883 15.07998466491699 13.0328426361084 14.97669410705566 C 12.94106006622314 14.96522617340088 12.30986022949219 15.15458583831787 11.13924217224121 15.54477119445801 C 11.04745960235596 15.56772708892822 10.88966274261475 15.61076641082764 10.66584968566895 15.67388916015625 C 10.44203662872314 15.73701190948486 10.24407196044922 15.79152965545654 10.07195472717285 15.83744049072266 C 9.899837493896484 15.88335132598877 9.802290916442871 15.91204071044922 9.779314994812012 15.923508644104 C 9.756359100341797 15.94646453857422 9.744881629943848 16.00671577453613 9.744881629943848 16.10426139831543 C 9.744881629943848 16.20180702209473 9.739157676696777 16.25632476806641 9.727709770202637 16.26781272888184 C 9.670310974121094 16.38257026672363 9.492419242858887 16.4686393737793 9.194036483764648 16.5260181427002 C 8.930076599121094 16.60635375976562 8.660383224487305 16.60635375976562 8.384955406188965 16.5260181427002 C 8.178375244140625 16.48010635375977 8.017705917358398 16.35960578918457 7.902946949005127 16.16451263427734 C 7.857035636901855 16.09564590454102 7.828346252441406 15.96366596221924 7.816878318786621 15.76857280731201 C 7.885765552520752 15.7456169128418 8.026350975036621 15.71692752838135 8.238636016845703 15.68250465393066 C 8.450921058654785 15.64808177947998 8.620196342468262 15.61364841461182 8.746461868286133 15.57920455932617 C 9.412095069885254 15.39557933807373 10.01460552215576 15.21195411682129 10.55399322509766 15.02832889556885 C 11.70163440704346 14.62665557861328 12.28693389892578 14.42581844329834 12.309889793396 14.42581844329834 C 12.42464828491211 14.40286254882812 12.67138576507568 14.29096698760986 13.05010414123535 14.09012985229492 C 13.42882251739502 13.88929271697998 13.68130397796631 13.76591873168945 13.80755043029785 13.72000789642334 C 13.91084098815918 13.68558502197266 14.03421497344971 13.63968372344971 14.17767238616943 13.58230400085449 C 14.32112979888916 13.52492427825928 14.40433692932129 13.49336338043213 14.4272928237915 13.48761940002441 C 14.45024871826172 13.4818754196167 14.48469257354736 13.48474788665771 14.53062343597412 13.49623489379883 C 14.55355930328369 13.63394832611084 14.54781532287598 13.82330799102783 14.51339149475098 14.06431198120117 C 14.51339149475098 14.08726787567139 14.44166278839111 14.24220275878906 14.29820442199707 14.52911853790283 C 14.15474605560303 14.8160343170166 14.00268268585205 15.12302303314209 13.84201335906982 15.45008563995361 C 13.6813440322876 15.77714824676514 13.5837984085083 15.96937942504883 13.54937553405762 16.02677917480469 C 13.26245975494385 16.60058975219727 12.82061862945557 17.35229110717773 12.22385215759277 18.28188514709473 L 13.3255729675293 18.76389312744141 C 13.46328639984131 18.83275985717773 13.89077758789062 19.01638412475586 14.60804653167725 19.31476783752441 C 15.32531547546387 19.61315155029297 15.71263885498047 19.7738208770752 15.77001762390137 19.79677581787109 C 15.81592845916748 19.8082447052002 15.87617969512939 19.95456314086914 15.95077037811279 20.2357349395752 C 16.02536010742188 20.51690673828125 16.05117797851562 20.69192504882812 16.02822303771973 20.76079177856445 Z M 12.49919986724854 12.3945140838623 C 12.53362274169922 12.56665134429932 12.51066780090332 12.72732067108154 12.43033313751221 12.87652206420898 C 12.2926197052002 13.14048194885254 12.00572395324707 13.35853004455566 11.56964683532715 13.53066730499268 C 11.22531223297119 13.668381690979 10.88099765777588 13.73723888397217 10.53670310974121 13.73723888397217 C 10.23832035064697 13.70281600952148 9.957148551940918 13.55362415313721 9.693188667297363 13.28966426849365 C 9.532519340515137 13.11752700805664 9.429228782653809 12.88225746154785 9.383317947387695 12.58385372161865 L 9.400519371032715 12.53221893310547 C 9.434942245483398 12.56664180755615 9.546838760375977 12.5953311920166 9.736207962036133 12.61828708648682 C 9.925577163696289 12.64124298095703 10.07764053344727 12.64124298095703 10.19239902496338 12.61828708648682 C 10.30715751647949 12.5953311920166 10.63997364044189 12.50351905822754 11.19084930419922 12.34284973144531 C 11.60399055480957 12.2051362991333 11.91960525512695 12.12480163574219 12.13769435882568 12.10184574127197 C 12.33276748657227 12.10184574127197 12.45326900482178 12.19939231872559 12.49920082092285 12.39448547363281 Z M 24.51500701904297 14.61518669128418 L 25.59952545166016 18.52288818359375 L 23.20668601989746 17.79987525939941 L 24.51500701904297 14.61518669128418 Z M 5.441271781921387 28.3868579864502 L 17.38815116882324 24.39308738708496 L 17.38815116882324 6.627645015716553 L 5.441271781921387 10.63864803314209 L 5.441271781921387 28.38689041137695 Z M 26.8045768737793 22.92983055114746 L 28.56047248840332 23.46347427368164 L 25.44462013244629 12.15347957611084 L 23.72315788269043 11.61983585357666 L 20.00476264953613 20.84686279296875 L 21.76065826416016 21.38050651550293 L 22.53530502319336 19.48690605163574 L 26.16757202148438 20.60585784912109 L 26.8045768737793 22.92983055114746 Z M 18.14559745788574 6.369409084320068 L 28.00959777832031 9.536896705627441 L 28.00959777832031 2.99535059928894 L 18.14559745788574 6.369409084320068 Z M 23.49932479858398 29.1443042755127 L 26.21923828125 29.36810684204102 L 25.2896556854248 32.12245178222656 L 24.60107612609863 30.98629760742188 C 23.10913848876953 31.9388484954834 21.52540016174316 32.55857086181641 19.8498592376709 32.84546279907227 C 19.18422698974609 32.98317718505859 18.66205024719238 33.05203247070312 18.28333282470703 33.05203247070312 L 16.83730697631836 33.05203247070312 C 15.93066883087158 33.05203247070312 14.78589916229248 32.82823944091797 13.40299701690674 32.38065338134766 C 12.020094871521 31.93306732177734 10.96713733673096 31.44532585144043 10.24412536621094 30.91742706298828 C 10.15234279632568 30.83709144592285 10.10645198822021 30.74527931213379 10.10645198822021 30.64198875427246 C 10.10645198822021 30.55018615722656 10.1351318359375 30.47272491455078 10.19249057769775 30.40960121154785 C 10.24984931945801 30.34647750854492 10.32446098327637 30.31491661071777 10.4163236618042 30.31491661071777 C 10.46221542358398 30.31491661071777 10.56549549102783 30.35795593261719 10.72616481781006 30.44403457641602 C 10.88683414459229 30.53011322021484 11.06186389923096 30.62479782104492 11.25125312805176 30.72808837890625 C 11.44064235687256 30.83137893676758 11.55826282501221 30.89450263977051 11.60411357879639 30.91745758056641 C 12.44188404083252 31.34208679199219 13.35712718963623 31.69498634338379 14.34984397888184 31.97615814208984 C 15.34256076812744 32.25732803344727 16.2463264465332 32.39791488647461 17.06114196777344 32.39791488647461 C 18.15140533447266 32.39791488647461 19.10969734191895 32.3147087097168 19.93601989746094 32.14829635620117 C 20.76234245300293 31.98188400268555 21.6632251739502 31.69210624694824 22.638671875 31.27896499633789 C 22.8108081817627 31.19862937927246 22.98583793640137 31.10968971252441 23.16375923156738 31.01214408874512 C 23.3416805267334 30.91459846496582 23.53677368164062 30.80557441711426 23.74903869628906 30.68507194519043 C 23.9613037109375 30.5645694732666 24.12484550476074 30.46988487243652 24.23966217041016 30.4010181427002 L 23.49932479858398 29.1443042755127 Z M 31.21145820617676 10.56974983215332 L 31.21145820617676 29.14427375793457 L 17.88736152648926 24.90950012207031 C 17.72669219970703 24.97836685180664 15.57486534118652 25.70998573303223 11.43188381195068 27.10435485839844 C 7.288901805877686 28.49872398376465 5.177253246307373 29.19591903686523 5.09693717956543 29.1959400177002 C 4.94773530960083 29.1959400177002 4.84444522857666 29.12133979797363 4.787065982818604 28.97213745117188 C 4.787065982818604 28.96066856384277 4.781342029571533 28.94345664978027 4.769894599914551 28.92050170898438 L 4.769894599914551 10.36318016052246 C 4.804297924041748 10.25988960266113 4.827243804931641 10.20251083374023 4.838731288909912 10.19104290008545 C 4.896110534667969 10.12217617034912 5.010888576507568 10.05905342102051 5.183065891265869 10.00167369842529 C 6.399534225463867 9.600000381469727 7.254517078399658 9.313094139099121 7.748013496398926 9.140956878662109 L 7.748013496398926 2.53054404258728 L 17.3537483215332 5.93903636932373 C 17.3767032623291 5.93903636932373 18.29768180847168 5.623431205749512 20.11668014526367 4.992221355438232 C 21.93567848205566 4.361011505126953 23.74894523620605 3.738417148590088 25.55647659301758 3.124438762664795 C 27.3640079498291 2.510460376739502 28.29072952270508 2.203471183776855 28.33664131164551 2.203471422195435 C 28.56619834899902 2.203471422195435 28.68097686767578 2.323973417282104 28.68097686767578 2.564977645874023 L 28.68097686767578 9.760669708251953 L 31.21145820617676 10.56974983215332 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9tnfh8 =
    '<svg viewBox="16.0 254.7 27.0 33.0" ><path transform="translate(11.5, 253.22)" d="M 18 1.5 L 4.5 7.5 L 4.5 16.5 C 4.5 24.82500076293945 10.26000022888184 32.61000061035156 18 34.5 C 25.73999977111816 32.61000061035156 31.5 24.82500076293945 31.5 16.5 L 31.5 7.5 L 18 1.5 Z M 18 17.98500061035156 L 28.5 17.98500061035156 C 27.70499992370605 24.16500091552734 23.57999992370605 29.67000198364258 18 31.39500045776367 L 18 18 L 7.5 18 L 7.5 9.449999809265137 L 18 4.784999847412109 L 18 17.98500061035156 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_7s82km =
    '<svg viewBox="16.2 324.1 27.5 29.2" ><path transform="translate(15.62, 323.51)" d="M 28.05023193359375 15.16949462890625 C 28.05023193359375 23.23850631713867 21.89636039733887 29.7764892578125 14.30636501312256 29.7764892578125 C 6.716371059417725 29.7764892578125 0.5625 23.23850440979004 0.5625 15.16949462890625 C 0.5625 7.105196475982666 6.716371059417725 0.5625 14.30636501312256 0.5625 C 21.89636039733887 0.5625 28.05023193359375 7.105197429656982 28.05023193359375 15.16949462890625 Z M 14.67517757415771 5.392232418060303 C 11.65501880645752 5.392232418060303 9.728772163391113 6.744380950927734 8.216170310974121 9.147525787353516 C 8.020209312438965 9.458867073059082 8.085769653320312 9.878759384155273 8.366632461547852 10.1051082611084 L 10.28960990905762 11.65474605560303 C 10.57806491851807 11.88722133636475 10.98905086517334 11.8319149017334 11.21316432952881 11.52976226806641 C 12.20316600799561 10.19522476196289 12.88199234008789 9.421348571777344 14.38882923126221 9.421348571777344 C 15.52098083496094 9.421348571777344 16.92135810852051 10.19575500488281 16.92135810852051 11.36254787445068 C 16.92135810852051 12.24462127685547 16.23621559143066 12.69761562347412 15.11836338043213 13.3637056350708 C 13.81469058990479 14.14040851593018 12.08961296081543 15.10712051391602 12.08961296081543 17.52546119689941 L 12.08961296081543 17.76105880737305 C 12.08961296081543 18.1513843536377 12.38737869262695 18.46784782409668 12.754638671875 18.46784782409668 L 15.85809230804443 18.46784782409668 C 16.2253532409668 18.46784782409668 16.52311897277832 18.1513843536377 16.52311897277832 17.76105880737305 L 16.52311897277832 17.68254470825195 C 16.52311897277832 16.00615692138672 21.13318824768066 15.93636131286621 21.13318824768066 11.39994812011719 C 21.13318824768066 7.983677387237549 17.79891586303711 5.392232418060303 14.67517757415771 5.392232418060303 Z M 14.30636501312256 19.99922752380371 C 12.90066814422607 19.99922752380371 11.75710010528564 21.21461296081543 11.75710010528564 22.70858955383301 C 11.75710010528564 24.20250701904297 12.90066814422607 25.4179515838623 14.30636501312256 25.4179515838623 C 15.71206283569336 25.4179515838623 16.85563278198242 24.20250701904297 16.85563278198242 22.70858955383301 C 16.85563278198242 21.21461296081543 15.71206283569336 19.99922752380371 14.30636501312256 19.99922752380371 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mv1ywq =
    '<svg viewBox="15.0 480.6 32.0 35.4" ><path transform="translate(10.5, 476.07)" d="M 20.5 4.5 C 11.66444492340088 4.5 4.5 12.424880027771 4.5 22.1982421875 C 4.5 31.97160339355469 11.66444492340088 39.896484375 20.5 39.896484375 C 21.97555541992188 39.896484375 23.16666603088379 38.57894897460938 23.16666603088379 36.94677734375 C 23.16666603088379 36.17985534667969 22.89999961853027 35.4915885925293 22.47333335876465 34.96064376831055 C 22.06444549560547 34.44935989379883 21.79777908325195 33.76109313964844 21.79777908325195 33.01383590698242 C 21.79777908325195 31.38166427612305 22.98888969421387 30.06412887573242 24.46444511413574 30.06412887573242 L 27.61111068725586 30.06412887573242 C 32.51778030395508 30.06412887573242 36.5 25.65923118591309 36.5 20.23177146911621 C 36.5 11.53996753692627 29.3355541229248 4.5 20.5 4.5 Z M 10.72222232818604 22.1982421875 C 9.24666690826416 22.1982421875 8.055556297302246 20.88070678710938 8.055556297302246 19.24853515625 C 8.055556297302246 17.61636352539062 9.24666690826416 16.298828125 10.72222232818604 16.298828125 C 12.19777774810791 16.298828125 13.38888931274414 17.61636352539062 13.38888931274414 19.24853515625 C 13.38888931274414 20.88070487976074 12.19777774810791 22.1982421875 10.72222232818604 22.1982421875 Z M 16.05555534362793 14.33235740661621 C 14.58000087738037 14.33235740661621 13.38888931274414 13.01482105255127 13.38888931274414 11.38264942169189 C 13.38888931274414 9.750478744506836 14.58000087738037 8.432942390441895 16.05555534362793 8.432942390441895 C 17.5311107635498 8.432942390441895 18.72222137451172 9.750478744506836 18.72222137451172 11.38264942169189 C 18.72222137451172 13.01482105255127 17.5311107635498 14.33235740661621 16.05555534362793 14.33235740661621 Z M 24.94444465637207 14.33235740661621 C 23.46888732910156 14.33235740661621 22.27777671813965 13.01482105255127 22.27777671813965 11.38264942169189 C 22.27777671813965 9.750478744506836 23.46888732910156 8.432942390441895 24.94444465637207 8.432942390441895 C 26.42000007629395 8.432942390441895 27.61111068725586 9.750478744506836 27.61111068725586 11.38264942169189 C 27.61111068725586 13.01482105255127 26.42000007629395 14.33235740661621 24.94444465637207 14.33235740661621 Z M 30.27777671813965 22.1982421875 C 28.80222129821777 22.1982421875 27.61111068725586 20.88070678710938 27.61111068725586 19.24853515625 C 27.61111068725586 17.61636352539062 28.80222129821777 16.298828125 30.27777671813965 16.298828125 C 31.75333213806152 16.298828125 32.9444465637207 17.61636352539062 32.9444465637207 19.24853515625 C 32.9444465637207 20.88070487976074 31.75333213806152 22.1982421875 30.27777671813965 22.1982421875 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hkjrup =
    '<svg viewBox="15.0 389.1 34.0 42.1" ><path transform="translate(10.5, 387.16)" d="M 37.28449249267578 7.189043998718262 L 26.35590171813965 7.189043998718262 C 26.35590171813965 4.283486366271973 24.18134498596191 1.928033828735352 21.49875640869141 1.928033828735352 C 18.81624412536621 1.928033828735352 16.6416072845459 4.283486366271973 16.6416072845459 7.189043998718262 L 5.713022232055664 7.189043998718262 C 5.042431354522705 7.189043998718262 4.498734474182129 7.777948379516602 4.498734474182129 8.504297256469727 L 4.498734474182129 42.70086669921875 C 4.498734474182129 43.42729949951172 5.042431354522705 44.01611709594727 5.713022232055664 44.01611709594727 L 37.28449249267578 44.01611709594727 C 37.95515823364258 44.01611709594727 38.498779296875 43.42728805541992 38.498779296875 42.70086669921875 L 38.498779296875 8.504297256469727 C 38.498779296875 7.777947425842285 37.95515823364258 7.189043521881104 37.28449249267578 7.189043521881104 Z M 21.49875640869141 4.558538913726807 C 22.84001541137695 4.558538913726807 23.92732810974121 5.736266136169434 23.92732810974121 7.189043998718262 C 23.92732810974121 8.641822814941406 22.84001541137695 9.819548606872559 21.49875640869141 9.819548606872559 C 20.15749549865723 9.819548606872559 19.0701789855957 8.641822814941406 19.0701789855957 7.189043998718262 C 19.0701789855957 5.736266136169434 20.15749549865723 4.558538913726807 21.49875640869141 4.558538913726807 Z M 36.07020568847656 41.38561248779297 L 6.927308082580566 41.38561248779297 L 6.927308082580566 9.819548606872559 L 11.78445816040039 9.819548606872559 L 11.78445816040039 13.76530742645264 C 11.78445816040039 14.49165439605713 12.32815551757812 15.08055973052979 12.99874305725098 15.08055973052979 L 29.9987621307373 15.08055973052979 C 30.6694278717041 15.08055973052979 31.21305084228516 14.49165439605713 31.21305084228516 13.76530742645264 L 31.21305084228516 9.819548606872559 L 36.0702018737793 9.819548606872559 L 36.0702018737793 41.38561248779297 Z M 19.07018280029297 37.21420288085938 L 11.2815523147583 27.46267890930176 L 13.5017261505127 25.05782318115234 L 19.07018280029297 29.77398681640625 L 29.49567222595215 19.79681015014648 L 31.71606826782227 22.20158576965332 L 19.07018280029297 37.21420288085938 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pclm24 =
    '<svg viewBox="18.0 528.7 23.7 37.5" ><path transform="translate(10.5, 527.16)" d="M 21.02455520629883 11.72727489471436 L 17.64341735839844 11.72727489471436 L 17.64341735839844 15.13636302947998 L 21.02455520629883 15.13636302947998 L 21.02455520629883 11.72727489471436 Z M 21.02455520629883 18.54545593261719 L 17.64341735839844 18.54545593261719 L 17.64341735839844 28.77272605895996 L 21.02455520629883 28.77272605895996 L 21.02455520629883 18.54545593261719 Z M 27.78683090209961 1.517045736312866 L 10.88113784790039 1.49999988079071 C 9.021512985229492 1.49999988079071 7.5 3.034090757369995 7.5 4.909091472625732 L 7.5 35.59091186523438 C 7.5 37.46591567993164 9.021512985229492 39.00000381469727 10.88113784790039 39.00000381469727 L 27.78683090209961 39.00000381469727 C 29.64645767211914 39.00000381469727 31.16796875 37.46591567993164 31.16796875 35.59091186523438 L 31.16796875 4.909091472625732 C 31.16796875 3.034090757369995 29.64645767211914 1.517045497894287 27.78683090209961 1.517045497894287 Z M 27.78683090209961 32.18181991577148 L 10.88113784790039 32.18181991577148 L 10.88113784790039 8.318181991577148 L 27.78683090209961 8.318181991577148 L 27.78683090209961 32.18181991577148 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
