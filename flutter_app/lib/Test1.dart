import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test1 extends StatelessWidget {
  Test1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-110.0, -230.0), //y= up increase down decrease   x= left increase right decrease
            child: SvgPicture.string(
              _svg_dpe9pm,
              allowDrawingOutsideViewBox: true,
            ),
          ), //----------Background----------
          Transform.translate(
            offset: Offset(18.0, 76.0),
            // Group: Group 6
            child: Container(
              alignment: Alignment(-0.78, -0.37),
              width: 343.0,
              height: 56.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: Colors.white.withOpacity(0.72),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFF707070).withOpacity(0.72),
                ),
              ),
              child: Text(
                'Ishihara Test',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 30.0,
                  color: const Color(0xFF6981B5).withOpacity(0.72),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ), //----------Header----------
          Transform.translate(
            offset: Offset(270.0, 60.0),
            child:
            Container(
              width: 90.0,
              height: 85.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(178.0),
                image: DecorationImage(
                  image: const AssetImage('images/ISee.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ), //----------ISee logo----------

          Transform.translate(
            offset: Offset(170.0, 160.0),
            child: SizedBox(
              width: 100.0,
              height: 50.0,
              child: Text(
                '1/12 ',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ), //----------Plate Number----------
          Transform.translate(
            offset: Offset(45.0, 200.0),
            child: // Group: Group 38
                Container(
              alignment: Alignment(0.0, 0.02),
              width: 313.0,
              height: 338.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
                color: Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFF707070),
                ),
              ),
              child: Container(
                width: 297.0,
                height: 277.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ), //----------Plate ----------
          Transform.translate(
            offset: Offset(70.0, 570.0),
            child: Text(
              '1st Number',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
          ), //----------1st Enter ----------
          Transform.translate(
            offset: Offset(70.0, 620.0),
            child: Text(
              '2nd Number',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
          ), //----------2nd Enter ----------
          Transform.translate(
            offset: Offset(330.0, 650.0),
            child: SizedBox(
              width: 90.11,
              height: 39.91,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      //TODO: onTap Icon material-navigate-next
                      print('onTap Icon material-navigate-next');
                    },
                    child: SvgPicture.string(
                      // Icon material-navigate-next
                      '<svg viewBox="314.99 567.0 28.12 39.91" ><path transform="translate(302.11, 558.0)" d="M 18.2367000579834 9 L 12.8850040435791 13.68938636779785 L 30.26852989196777 28.954833984375 L 12.88500022888184 44.22028350830078 L 18.2367000579834 48.90967178344727 L 41.00988006591797 28.954833984375 L 18.2367000579834 9 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                      width: 28.12,
                      height: 39.91,
                    ),
                  ),
                ],
              ),
            ),
          ), //----------Next Button ----------
          Transform.translate(
            offset: Offset(20.0, 650.0),
            child: SizedBox(
              width: 100.01,
              height: 39.91,
              child: Stack(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      //TODO: onTap Icon material-navigate-next
                      print('onTap Icon material-navigate-next');
                    },
                    child: SvgPicture.string(
                      // Icon material-navigate-next
                      '<svg viewBox="33.99 567.0 28.12 39.91" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 75.0, 615.91)" d="M 18.2367000579834 9 L 12.8850040435791 13.68938636779785 L 30.26852989196777 28.954833984375 L 12.88500022888184 44.22028350830078 L 18.2367000579834 48.90967178344727 L 41.00988006591797 28.954833984375 L 18.2367000579834 9 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                      width: 28.12,
                      height: 39.91,
                    ),
                  ),
                ],
              ),
            ),
          ), //----------Back Button ----------
          Transform.translate(
            offset: Offset(20.0, 720.0),
            child: InkWell(
              onTap: () {
                //TODO: onTap cancel
                print('onTap cancel');
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 14.0,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ), //----------Cancel Button ----------
        ],
      ),
    );
  }
}

const String _svg_dpe9pm =
    '<svg viewBox="-132.8 -212.0 250.3 250.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  /><stop offset="0.047428" stop-color="#ff321387"  /><stop offset="0.133932" stop-color="#ffb4b4d3"  /><stop offset="0.211895" stop-color="#ffdce4f3"  /><stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ff6a77ab"  /></linearGradient></defs><path transform="translate(-100.26, -233.0)" d="M 932.4722900390625 95.21127319335938 C 715.0507202148438 95.21127319335938 295.9188232421875 69.95317840576172 93.37493896484375 228.1106872558594 C 23.73117065429688 282.4923706054688 -24.022705078125 449.0497741699219 -24.022705078125 522.7361450195312 C -24.022705078125 685.9822998046875 -68.51026916503906 865.0326538085938 46.0013427734375 963.8968505859375 C 78.24923706054688 991.7384033203125 34.607666015625 994.908935546875 70.93707275390625 1011.32470703125 C 84.87640380859375 1017.623474121094 74.25277709960938 1038.3515625 93.37493896484375 1043.91162109375 C 119.2852478027344 1052.81298828125 364.1560974121094 1056.273681640625 398.1963500976562 1058.5244140625 C 435.2300720214844 1060.973388671875 473.1695861816406 1043.91162109375 505.1127319335938 1043.91162109375 C 580.9110717773438 1043.91162109375 656.1889038085938 1005.343017578125 735.28759765625 963.8968505859375 C 771.1249389648438 945.1187744140625 820.5877685546875 927.4923706054688 848.7631225585938 909.5341796875 C 880.033935546875 889.6029663085938 918.8973388671875 853.3441162109375 941.8712768554688 822.8403930664062 C 971.9507446289062 782.9025268554688 982.9915161132812 747.07763671875 998.2335205078125 713.11376953125 C 1026.332885742188 650.499755859375 1028.603393554688 617.8158569335938 998.2335205078125 531.9896850585938 C 903.0227661132812 262.921875 1224.705688476562 95.21127319335938 932.4722900390625 95.21127319335938 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.68412" y1="0.157539" x2="0.24164" y2="0.93267"><stop offset="0.0" stop-color="#ffffffff"  /><stop offset="0.08674" stop-color="#ff8996c2"  /><stop offset="0.158918" stop-color="#ff7a87b7"  /><stop offset="0.59789" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ffb5c3e2"  /></linearGradient></defs><path transform="translate(-81.0, -212.0)" d="M 513.5 0 C 797.0982055664062 0 1027 235.0505065917969 1027 525 C 1027 814.949462890625 810.3135986328125 983.9443359375 526.7153930664062 983.9443359375 C 403.9173583984375 983.9443359375 239.5424194335938 908.4990844726562 157.8780822753906 853.68603515625 C 51.26186370849609 782.1254272460938 32.13705444335938 777.7958984375 32.13705444335938 613.39453125 C 32.13705444335938 508.1428527832031 13.97368240356445 359.6548156738281 60.75470352172852 262.614990234375 C 68.71327209472656 246.106201171875 57.71491241455078 215.8832855224609 67.75968170166016 200.606689453125 C 159.6092681884766 60.91526031494141 350.3712158203125 0 513.5 0 Z" fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x0z2si =
    '<svg viewBox="9.4 11.6 17.1 12.7" ><path  d="M 17.92200088500977 22.24399948120117 L 15.80100059509277 24.36499977111816 L 9.435000419616699 18 L 15.80000019073486 11.63500022888184 L 17.92099952697754 13.75800037384033 L 15.18000030517578 16.5 L 26.48600006103516 16.5 L 26.48600006103516 19.5 L 15.18000030517578 19.5 L 17.92200088500977 22.24399948120117 Z" fill="#6981b5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j6ljpj =
    '<svg viewBox="1.5 1.5 33.0 33.0" ><path  d="M 34.5 28.5 C 34.5 31.8137092590332 31.8137092590332 34.5 28.5 34.5 L 7.5 34.5 C 4.186291217803955 34.5 1.5 31.8137092590332 1.5 28.5 L 1.5 7.5 C 1.5 4.186291217803955 4.18629264831543 1.499999046325684 7.500000953674316 1.5 L 28.5 1.5 C 31.8137092590332 1.5 34.5 4.186291694641113 34.5 7.500000476837158 L 34.5 28.5 Z M 28.5 31.5 L 7.5 31.5 C 5.843145370483398 31.5 4.5 30.1568546295166 4.5 28.5 L 4.5 7.5 C 4.5 5.843145370483398 5.843146324157715 4.499999523162842 7.500000476837158 4.5 L 28.5 4.5 C 30.1568546295166 4.5 31.5 5.843145847320557 31.5 7.5 L 31.5 28.5 C 31.5 30.1568546295166 30.1568546295166 31.5 28.5 31.5 Z" fill="#6981b5" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
