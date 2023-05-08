import 'package:flutter/material.dart';
import 'package:procollab_web/CRUD/main.dart';
import 'package:procollab_web/signup/credentials.dart';
import '../authentication/singin.dart';

import '../authentication/singin.dart';

class header extends StatefulWidget {
  const header({Key? key}) : super(key: key);

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFamily = "DM Sans";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Row(
            children: [
              Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.5,
                      color:  mainColor,

                      child: CustomPaint(
                        painter: CurvePainter(),
                      ),
                    ),
                  ),
                  Positioned(
                      top : MediaQuery.of(context).size.height*0.03,
                      left: MediaQuery.of(context).size.width*0.18,

                      child: const Text("PROCOLLAB",
                        style: TextStyle(color: Colors.white,fontFamily: fontFamily, fontSize: 25, fontWeight: FontWeight.bold),)),

                  Positioned(
                    top : MediaQuery.of(context).size.height*0.03,
                    left: MediaQuery.of(context).size.width*0.685,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: mainColor,side: const BorderSide(width: 1.0, color: Colors.white,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),), padding: const EdgeInsets.only(left:20, right: 20)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
                      },

                      child: const Text("Login"),
                    ),
                  ),
                  Positioned(
                    top : MediaQuery.of(context).size.height*0.03,
                    left: MediaQuery.of(context).size.width*0.75,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: mainColor,side: const BorderSide(width: 1.0, color: Colors.white,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                      },

                      child: const Text("Sign Up"),
                    ),
                  ),
                  Positioned(
                    top : MediaQuery.of(context).size.height*0.15,
                    left: MediaQuery.of(context).size.width*0.175,

                    child: const CircleAvatar(
                      backgroundImage: AssetImage("happy-bearded-young-man.jpg"),
                      radius: 50,
                    ),
                  ),
                  Positioned(
                      top : MediaQuery.of(context).size.height*0.20,
                      left: MediaQuery.of(context).size.width*0.25,

                      child: Container(
                        height: MediaQuery.of(context).size.height*0.075,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 10.0, left: 30.0, right: 30.0),
                          child: Center(child: Text("Welcome!",style: (TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          )),)),
                        ),
                      )
                  ),
                  Positioned(
                      top : MediaQuery.of(context).size.height*0.30,
                      left: MediaQuery.of(context).size.width*0.175,

                      child: Container(
                        height: MediaQuery.of(context).size.height*0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 40.0, right: 40.0),
                          child: Center(child: Text("Work Better Together",style: (TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )),)),
                        ),
                      )
                  ),
                  Positioned(
                      top : MediaQuery.of(context).size.height*0.375,
                      left: MediaQuery.of(context).size.width*0.175,

                      child: Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: mainColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 20.0, right: 20.0),
                          child: Center(child: Text("Let's Begin",style: (TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          )),)),
                        ),
                      )
                  ),
                  Positioned(
                    top : MediaQuery.of(context).size.height*0.13,
                    left: MediaQuery.of(context).size.width*0.635,

                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("logo.png"),
                      radius: 120,
                    ),
                  ),
                ],
              ),
            ],
          ),


        ),

      ),
    );
  }


}

class CurvePainter extends CustomPainter {
  static const secondaryColor = Color(0xFF7886CB);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = secondaryColor;
    paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.04,
        size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.65);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
    }
}
