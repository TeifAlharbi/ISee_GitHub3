import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/AboutISee.dart';
import 'package:flutter_app/SignUp.dart';
import 'package:flutter_app/Camera.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn2 extends StatefulWidget {
  @override
  _SignIn2 createState() => _SignIn2();
}

class _SignIn2 extends State<SignIn2> {
  void initState() {
    super.initState();
  }

  //variables
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-120.3, -250.0),
            child: SvgPicture.string(
              _svg_z0kqo3,
              allowDrawingOutsideViewBox: true,
            ),
          ), //----------Background----------
          Transform.translate(
            offset: Offset(50.0, 80.0),
            child:
                // Adobe XD layer: 'Picture11' (shape)
                Container(
              //###CHANGE width,height
              width: 270.0,
              height: 270.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(178.0),
                image: DecorationImage(
                  //###CHANGE path
                  image: const AssetImage('images/ISee2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ), //----------ISee LOGO----------

          Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(top: 390.0, left: 50.0),
                    // symmetric(
                    //     vertical: 25.0, horizontal: 10.0),
                    hintText: 'Email',
                  ),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Email Input';
                    }
                  },
                ), //----------Text UserName----------
                TextFormField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(top: 30.0, left: 50.0),
                    hintText: 'Password',
                  ),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Fill Email Input';
                    }
                  },
                ), //----------Text Password----------

                RaisedButton(
                  color: const Color(0xff6981b5),
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      var result = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailcontroller.text,
                              password: _passwordcontroller.text);

                      if (result != null) {
                        // pushReplacement

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Camera()),
                          //DashboardScreen screen to move to it
                        );
                      } else {
                        print('user not found');
                      }
                    }
                  },
                ), //----------SignIn Button----------
                RaisedButton(
                  color: const Color(0xff6981b5),
                  child: Text(
                    'Or Sign Up Here',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                ), //----------Sign Up----------

                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutISee()));
                  },
                  child: SvgPicture.string(
                    // Icon material-perm-device-information b5c3e2
                    '<svg viewBox="17.0 766.5 21.0 33.0" ><path transform="translate(9.5, 765.0)" d="M 19.5 10.5 L 16.5 10.5 L 16.5 13.5 L 19.5 13.5 L 19.5 10.5 Z M 19.5 16.5 L 16.5 16.5 L 16.5 25.5 L 19.5 25.5 L 19.5 16.5 Z M 25.5 1.515000343322754 L 10.5 1.5 C 8.850000381469727 1.5 7.5 2.849999904632568 7.5 4.5 L 7.5 31.5 C 7.5 33.15000152587891 8.850000381469727 34.5 10.5 34.5 L 25.5 34.5 C 27.14999961853027 34.5 28.5 33.15000152587891 28.5 31.5 L 28.5 4.5 C 28.5 2.849999904632568 27.14999961853027 1.515000104904175 25.5 1.515000104904175 Z M 25.5 28.5 L 10.5 28.5 L 10.5 7.5 L 25.5 7.5 L 25.5 28.5 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    width: 21.0,
                    height: 33.0,
                  ),
                )
                //----------About Icon----------
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_z0kqo3 =
    '<svg viewBox="-124.3 -263.0 250.3 250.1" ><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  />'
    '<stop offset="0.053559" stop-color="#ff321387"  /><stop offset="0.116661" stop-color="#ffb4b4d3"  /><stop offset="0.396409" stop-color="#ffdce4f3"  />'
    '<stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ff6a77ab"  /></linearGradient></defs><path transform="translate(-100.26, -248.0)" d="M 932.4722900390625 95.236328125 C 715.0507202148438 95.236328125 295.9188232421875 69.55056762695312 93.37493896484375 230.385986328125 C 23.73117065429688 285.6884765625 -24.022705078125 455.0660095214844 -24.022705078125 530 C -24.022705078125 761.5343627929688 65.29049682617188 970.99853515625 304.8984985351562 1041.84765625 C 330.8088073730469 1050.899658203125 365.7186889648438 1057.711059570312 399.7589416503906 1060 C 436.7926635742188 1062.490356445312 473.1695861816406 1060 505.1127319335938 1060 C 580.9110717773438 1060 656.1889038085938 1020.7783203125 735.28759765625 978.63037109375 C 771.1249389648438 959.5343017578125 820.5877685546875 941.6094970703125 848.7631225585938 923.34716796875 C 880.033935546875 903.0784912109375 918.8973388671875 866.2056884765625 941.8712768554688 835.185546875 C 971.9507446289062 794.5714721679688 982.9915161132812 758.1400146484375 998.2335205078125 723.60107421875 C 1026.332885742188 659.9268188476562 1028.603393554688 626.6895141601562 998.2335205078125 539.41015625 C 903.0227661132812 265.78662109375 1224.705688476562 95.236328125 932.4722900390625 95.236328125 Z" '
    'fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><defs><linearGradient id="gradient" x1="0.5" y1="0.0" x2="0.5" y2="1.0"><stop offset="0.0" stop-color="#ff6a77ab"  /><stop offset="0.733603" stop-color="#ffb5c3e2"  /><stop offset="1.0" stop-color="#ffb5c3e2"  /></linearGradient></defs><path transform="translate(-82.0, -263.0)" d="M 513.5 0 C 797.0982055664062 0 1027 235.0505065917969 1027 525 C 1027 814.949462890625 797.0982055664062 1050 513.5 1050 C 390.7019653320312 1050 304.149658203125 999.5283813476562 222.4853210449219 944.71533203125 C 115.8691024780273 873.1547241210938 32.13705444335938 777.7958984375 32.13705444335938 613.39453125 C 32.13705444335938 506.4031677246094 59.06489562988281 394.8510131835938 107.3237609863281 296.6170654296875 C 189.7745971679688 128.783203125 334.5495300292969 0 513.5 0 Z" '
    'fill="url(#gradient)" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
