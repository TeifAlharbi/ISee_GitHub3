//ALL DONE
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_app/UserSettings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'globals.dart' as globals;

class language extends StatefulWidget {
  @override
  _language createState() => _language();
}

class _language extends State<language> {
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  String Language ;
  String ChooseLanguage;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;
    double screenText = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AutoSizeText((() {
            if (globals.language == 0) {
              setState(() {
                Language = "Language";
                ChooseLanguage = "Choose language";
              });
              return "";
            }else{
              setState(() {
                Language = 'اللغة';
                ChooseLanguage = "اختر اللغة";
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
          ), //----------Background----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.05 ,top: screenHeight  * 0.10 , right:screenWeidth * 0.10 , bottom:screenHeight  * 0.05  ),
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
                Language,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  //   fontSize: screenText * 12.0,
                  color: const Color(0xFF6981B5).withOpacity(0.72),
                  fontWeight: FontWeight.w900,
                ),

                minFontSize: 10,
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
            padding: EdgeInsets.only(left:screenWeidth * 0.08 ,top: screenHeight  * 0.300
                , right:screenWeidth * 0.08 , bottom: screenHeight  * 0.200),
            child: SvgPicture.string(
              _svg_32q5b6,
              allowDrawingOutsideViewBox: true,
            ),
          ), //----------Choose Language Rectangle----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.15 ,top: screenHeight  * 0.320
                , right:screenWeidth * 0.08 , bottom: screenHeight  * 0.200),
            child: AutoSizeText(
             ChooseLanguage,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                // fontSize: 24,
                color: const Color(0xff6a77ab),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              minFontSize: 20,
              maxFontSize: 30,
            ),
          ), //----------Choose Language Text----------
          Padding(
            padding: EdgeInsets.only(left:screenWeidth * 0.15 ,top: screenHeight  * 0.450
                , right:screenWeidth * 0.08 , bottom: screenHeight  * 0.200),
            child: SizedBox(
              width: 259.0,
              height: 143.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 258.9, 143.0),
                    size: Size(258.9, 143.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: SingleChildScrollView(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 20,
                        runSpacing: 20,
                        children: [{}, {}].map((map) {
                          return SizedBox(
                            width: 259.0,
                            height: 56.0,
                            child: Stack(
                              children: <Widget>[
                                SvgPicture.string(
                                  _svg_gt4k1z,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                      bounds: Rect.fromLTWH(40.9, 20.0, 87.0, 24.0),
                      size: Size(258.9, 143.0),
                      pinTop: true,
                      fixedWidth: true,
                      fixedHeight: true,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            globals.language = 0;
                          });
                          print ("language number:" + globals.language.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => language()));
                        },
                        child: AutoSizeText(
                          'English',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            color: const Color(0xff6a77ab),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          minFontSize: 14,
                          maxFontSize: 25,
                        ),
                      )),
                  Pinned.fromSize(
                      bounds: Rect.fromLTWH(40.9, 91.0, 45.0, 29.0),
                      size: Size(258.9, 143.0),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: InkWell(
                        onTap: () {
                          globals.language++;
                          print ("language number:" + globals.language.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => language()));
                        },
                        child: AutoSizeText(
                          'عربي',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            color: const Color(0xff6a77ab),
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          minFontSize: 14,
                          maxFontSize: 25,
                        ),
                      )),
                ],
              ),
            ),
          ), //----------English/Arabic----------
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserSettings()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 150),
              child: SvgPicture.string(
                '<svg viewBox="109.0 151.62 13.37 23.76" ><path transform="translate(109.0, 148.02)" d="M 13.37402248382568 5.08489990234375 L 13.37402248382568 25.87349510192871 C 13.37402248382568 26.2755184173584 13.22707462310791 26.6236457824707 12.9331750869751 26.91787528991699 C 12.63927745819092 27.21210670471191 12.29089164733887 27.35894775390625 11.88802051544189 27.35839653015137 C 11.48514842987061 27.35784530639648 11.13676357269287 27.21100807189941 10.84286499023438 26.91787528991699 L 0.4408473968505859 16.52357864379883 C 0.1469491124153137 16.22934722900391 0 15.88122081756592 0 15.47919845581055 C 0 15.07717514038086 0.1469491124153137 14.72904777526855 0.4408473968505859 14.43481826782227 L 10.84286499023438 4.040519237518311 C 11.13676357269287 3.746838808059692 11.48514842987061 3.599998712539673 11.88802051544189 3.599998712539673 C 12.29089164733887 3.599998712539673 12.63927745819092 3.746838808059692 12.9331750869751 4.040519237518311 C 13.22707462310791 4.33419942855835 13.37402248382568 4.682325839996338 13.37402248382568 5.084898471832275 Z" fill="#6981b5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                width: 15.37,
                height: 23.76,
              ),
            ),
          ) //----------Back Icon----------
        ],
      ),
    );
  }
}

const String _svg_gt4k1z =
    '<svg viewBox="53.1 213.0 258.9 56.0" ><path transform="translate(60.0, 213.0)" d="M 0 0 L 224 0 C 239.4639739990234 0 252 12.53602600097656 252 28 C 252 43.46397399902344 239.4639739990234 56 224 56 L 0 56 C -15.46397399902344 56 0 43.46397399902344 0 28 C 0 12.53602600097656 -15.46397399902344 0 0 0 Z" fill="#ffffff" stroke="#134ecc" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String Background =
    '<svg viewBox="-132.8 -212.0 250.3 250.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  /><stop offset="0.047428" stop-color="#ff321387"  /><stop offset="0.133932" stop-color="#ffb4b4d3"  /><stop offset="0.211895" stop-color="#ffdce4f3"  /><stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ff6a77ab"  /></linearGradient></defs><path transform="translate(-100.26, -233.0)" d="M 932.4722900390625 95.21127319335938 C 715.0507202148438 95.21127319335938 295.9188232421875 69.95317840576172 93.37493896484375 228.1106872558594 C 23.73117065429688 282.4923706054688 -24.022705078125 449.0497741699219 -24.022705078125 522.7361450195312 C -24.022705078125 685.9822998046875 -68.51026916503906 865.0326538085938 46.0013427734375 963.8968505859375 C 78.24923706054688 991.7384033203125 34.607666015625 994.908935546875 70.93707275390625 1011.32470703125 C 84.87640380859375 1017.623474121094 74.25277709960938 1038.3515625 93.37493896484375 1043.91162109375 C 119.2852478027344 1052.81298828125 364.1560974121094 1056.273681640625 398.1963500976562 1058.5244140625 C 435.2300720214844 1060.973388671875 473.1695861816406 1043.91162109375 505.1127319335938 1043.91162109375 C 580.9110717773438 1043.91162109375 656.1889038085938 1005.343017578125 735.28759765625 963.8968505859375 C 771.1249389648438 945.1187744140625 820.5877685546875 927.4923706054688 848.7631225585938 909.5341796875 C 880.033935546875 889.6029663085938 918.8973388671875 853.3441162109375 941.8712768554688 822.8403930664062 C 971.9507446289062 782.9025268554688 982.9915161132812 747.07763671875 998.2335205078125 713.11376953125 C 1026.332885742188 650.499755859375 1028.603393554688 617.8158569335938 998.2335205078125 531.9896850585938 C 903.0227661132812 262.921875 1224.705688476562 95.21127319335938 932.4722900390625 95.21127319335938 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.68412" y1="0.157539" x2="0.24164" y2="0.93267"><stop offset="0.0" stop-color="#ffffffff"  /><stop offset="0.08674" stop-color="#ff8996c2"  /><stop offset="0.158918" stop-color="#ff7a87b7"  /><stop offset="0.59789" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ffb5c3e2"  /></linearGradient></defs><path transform="translate(-81.0, -212.0)" d="M 513.5 0 C 797.0982055664062 0 1027 235.0505065917969 1027 525 C 1027 814.949462890625 810.3135986328125 983.9443359375 526.7153930664062 983.9443359375 C 403.9173583984375 983.9443359375 239.5424194335938 908.4990844726562 157.8780822753906 853.68603515625 C 51.26186370849609 782.1254272460938 32.13705444335938 777.7958984375 32.13705444335938 613.39453125 C 32.13705444335938 508.1428527832031 13.97368240356445 359.6548156738281 60.75470352172852 262.614990234375 C 68.71327209472656 246.106201171875 57.71491241455078 215.8832855224609 67.75968170166016 200.606689453125 C 159.6092681884766 60.91526031494141 350.3712158203125 0 513.5 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_32q5b6 =
    '<svg viewBox="23.0 211.0 313.0 69.0" ><path transform="translate(23.0, 211.0)" d="M 44.5 0 L 268.5 0 C 293.07666015625 0 313 15.43994426727295 313 34.486083984375 C 313 53.5322265625 293.07666015625 68.97216796875 268.5 68.97216796875 L 44.5 68.97216796875 C 19.92332649230957 68.97216796875 0 53.5322265625 0 34.486083984375 C 0 15.43994426727295 19.92332649230957 0 44.5 0 Z" fill="#ffffff" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
