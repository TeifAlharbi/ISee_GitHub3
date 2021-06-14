import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Test.dart';
import 'package:flutter_app/testPlate1.dart';
import 'package:flutter_svg/flutter_svg.dart';

class testInstructions extends StatefulWidget {
  @override
  _testInstructions createState() => _testInstructions();
}

class _testInstructions extends State<testInstructions> {
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeidth = MediaQuery.of(context).size.width;
    double screenText = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
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
                'Ishihara Test Instructions',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  //   fontSize: screenText * 12.0,
                  color: const Color(0xFFC3BABA).withOpacity(0.72),
                  fontWeight: FontWeight.w900,
                ),
                minFontSize: 20,
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
                top: screenHeight * 0.250,
                right: screenWeidth * 0.08),
            child: Container(
              alignment: Alignment.bottomCenter,
              width: screenWeidth,
              height: screenHeight / 02,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
                color: Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFF707070),
                ),
              ),
              child: SizedBox(
                width: 285.0,
                height: 327.0,
                child: AutoSizeText(
                  'How the test works: \n\n There are 12 Plates, for each one you have to identify the correct number. \n\n If you do not see anything just select nothing from the menu.',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: screenText * 24.0,
                    color: const Color(0xFFC3BABA),
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 9,
                ),
              ),
            ),
          ), //----------Description Box----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.70, top: screenHeight * 0.850),
            child: Container(
              child: SizedBox(
                width: screenWeidth * 0.70,
                height: screenHeight / 02,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: AutoSizeText(
                        'Start',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          //    fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        minFontSize: 16,
                        maxFontSize: 25,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //----------Start Text----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.08, top: screenHeight * 0.850),
            child: Container(
              child: SizedBox(
                width: screenWeidth / 04,
                height: screenHeight / 02,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 0,
                      child: AutoSizeText(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          //  fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        minFontSize: 16,
                        maxFontSize: 25,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //----------Cancel text----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.86, top: screenHeight * 0.840),
            child: Container(
              child: InkWell(
                child: SvgPicture.string(
                  // Icon material-navigate-next
                  '<svg viewBox="314.99 567.0 28.12 39.91" ><path transform="translate(302.11, 558.0)" d="M 18.2367000579834 9 L 12.8850040435791 13.68938636779785 L 30.26852989196777 28.954833984375 L 12.88500022888184 44.22028350830078 L 18.2367000579834 48.90967178344727 L 41.00988006591797 28.954833984375 L 18.2367000579834 9 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 28.12,
                  height: 39.91,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => testPlate1()));
                },
              ),
            ),
          ), //----------Next Icon----------
          Padding(
            padding: EdgeInsets.only(
                left: screenWeidth * 0.05, top: screenHeight * 0.840),
            child: Container(
              child: InkWell(
                child: SvgPicture.string(
                  // Icon material-navigate-next
                  '<svg viewBox="33.99 567.0 28.12 39.91" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 75.0, 615.91)" d="M 18.2367000579834 9 L 12.8850040435791 13.68938636779785 L 30.26852989196777 28.954833984375 L 12.88500022888184 44.22028350830078 L 18.2367000579834 48.90967178344727 L 41.00988006591797 28.954833984375 L 18.2367000579834 9 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 28.12,
                  height: 39.91,
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Test()));
                },
              ),
            ),
          ), //----------Back Icon----------
        ],
      ),
    );
  }
}

const String Background =
    '<svg viewBox="-132.8 -212.0 250.3 250.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  /><stop offset="0.047428" stop-color="#ff321387"  /><stop offset="0.133932" stop-color="#ffb4b4d3"  /><stop offset="0.211895" stop-color="#ffdce4f3"  /><stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ff6a77ab"  /></linearGradient></defs><path transform="translate(-100.26, -233.0)" d="M 932.4722900390625 95.21127319335938 C 715.0507202148438 95.21127319335938 295.9188232421875 69.95317840576172 93.37493896484375 228.1106872558594 C 23.73117065429688 282.4923706054688 -24.022705078125 449.0497741699219 -24.022705078125 522.7361450195312 C -24.022705078125 685.9822998046875 -68.51026916503906 865.0326538085938 46.0013427734375 963.8968505859375 C 78.24923706054688 991.7384033203125 34.607666015625 994.908935546875 70.93707275390625 1011.32470703125 C 84.87640380859375 1017.623474121094 74.25277709960938 1038.3515625 93.37493896484375 1043.91162109375 C 119.2852478027344 1052.81298828125 364.1560974121094 1056.273681640625 398.1963500976562 1058.5244140625 C 435.2300720214844 1060.973388671875 473.1695861816406 1043.91162109375 505.1127319335938 1043.91162109375 C 580.9110717773438 1043.91162109375 656.1889038085938 1005.343017578125 735.28759765625 963.8968505859375 C 771.1249389648438 945.1187744140625 820.5877685546875 927.4923706054688 848.7631225585938 909.5341796875 C 880.033935546875 889.6029663085938 918.8973388671875 853.3441162109375 941.8712768554688 822.8403930664062 C 971.9507446289062 782.9025268554688 982.9915161132812 747.07763671875 998.2335205078125 713.11376953125 C 1026.332885742188 650.499755859375 1028.603393554688 617.8158569335938 998.2335205078125 531.9896850585938 C 903.0227661132812 262.921875 1224.705688476562 95.21127319335938 932.4722900390625 95.21127319335938 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.68412" y1="0.157539" x2="0.24164" y2="0.93267"><stop offset="0.0" stop-color="#ffffffff"  /><stop offset="0.08674" stop-color="#ff8996c2"  /><stop offset="0.158918" stop-color="#ff7a87b7"  /><stop offset="0.59789" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ffb5c3e2"  /></linearGradient></defs><path transform="translate(-81.0, -212.0)" d="M 513.5 0 C 797.0982055664062 0 1027 235.0505065917969 1027 525 C 1027 814.949462890625 810.3135986328125 983.9443359375 526.7153930664062 983.9443359375 C 403.9173583984375 983.9443359375 239.5424194335938 908.4990844726562 157.8780822753906 853.68603515625 C 51.26186370849609 782.1254272460938 32.13705444335938 777.7958984375 32.13705444335938 613.39453125 C 32.13705444335938 508.1428527832031 13.97368240356445 359.6548156738281 60.75470352172852 262.614990234375 C 68.71327209472656 246.106201171875 57.71491241455078 215.8832855224609 67.75968170166016 200.606689453125 C 159.6092681884766 60.91526031494141 350.3712158203125 0 513.5 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
