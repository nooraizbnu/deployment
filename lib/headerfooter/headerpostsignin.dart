// import 'package:flutter/material.dart';
// import 'package:procollab_web/allposts/posts.dart';
// import 'package:procollab_web/earnings/Earnings.dart';
// import 'package:procollab_web/progress/editpage.dart';
// import 'package:procollab_web/chat/chathome.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../earnings/earningshome.dart';
// import '../profile/profilehome.dart';
// import '../tasks/taskshome.dart';
//
// class headerpostsu extends StatefulWidget {
//   const headerpostsu({Key? key}) : super(key: key);
//
//   @override
//   State<headerpostsu> createState() => _headerpostsuState();
// }
//
// class _headerpostsuState extends State<headerpostsu> {
//
//   static const mainColor = Color(0xFF5364B8);
//   static const secondaryColor = Color(0xFF7886CB);
//   static const fontFamily = "DM Sans";
//
//   final user = FirebaseAuth.instance.currentUser;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Container(
//
//           child: Row(
//
//             children: [
//               Stack(
//
//                 children: <Widget>[
//                   Positioned(
//
//                     child: Container(
//                        width: MediaQuery.of(context).size.width,
//                        height: MediaQuery.of(context).size.height*0.5,
//                       color:  mainColor,
//
//                       child: CustomPaint(
//                         painter: CurvePainter(),
//                       ),
//                     ),
//                   ),
//
//                   Positioned(
//                       top : MediaQuery.of(context).size.height*0.03,
//                       left: MediaQuery.of(context).size.width*0.17,
//
//                       child: const Text("PROCOLLAB",
//                         style: TextStyle(color: Colors.white,fontFamily: fontFamily, fontSize: 25, fontWeight: FontWeight.bold),)
//                   ),
//
//                   Positioned(
//                     top : MediaQuery.of(context).size.height*0.035,
//                     left: MediaQuery.of(context).size.width*0.33,
//
//                     child: InkWell(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> PostsMain()));
//                         setState(() {
//
//                         });
//                       },
//                       child: const Text("Projects", style: (TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       )),),
//                     ),
//                   ),
//
//                   Positioned(
//                     top : MediaQuery.of(context).size.height*0.035,
//                     left: MediaQuery.of(context).size.width*0.39,
//
//                     child: InkWell(
//                       onTap: (){
//                         setState(() {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=> SProgress2()));
//
//                         });
//                       },
//                       child: const Text("Progress", style: (TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       )),),
//                     ),
//                   ),
//
//                   Positioned(
//                     top : MediaQuery.of(context).size.height*0.035,
//                     left: MediaQuery.of(context).size.width*0.455,
//
//                     child: InkWell(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskHome(documentId: "ehw5L2rIulFQLIKMVq2p")));
//                         setState(() {
//
//                         });
//                       },
//                       child: const Text("Tickets", style: (TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       )),),
//                     ),
//                   ),
//
//                   Positioned(
//                     top : MediaQuery.of(context).size.height*0.035,
//                     left: MediaQuery.of(context).size.width*0.515,
//
//                     child: InkWell(
//                       onTap: (){
//                         setState(() {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=> chatHome()));
//
//                         });
//                       },
//                       child: const Text("Chat", style: (TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       )),),
//                     ),
//                   ),
//
//                   Positioned(
//                     top : MediaQuery.of(context).size.height*0.035,
//                     left: MediaQuery.of(context).size.width*0.565,
//
//                     child: InkWell(
//                       onTap: (){
//                         setState(() {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=> earningsMain()));
//                         });
//                       },
//                       child: const Text("Earnings", style: (TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       )),),
//                     ),
//                   ),
//
//                   Positioned(
//                       top : MediaQuery.of(context).size.height*0.0331,
//                       left: MediaQuery.of(context).size.width*0.685,
//
//                       child: InkWell(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileMain()));
//                         },
//                         child: Text(user!.email!,
//                           style: TextStyle(color: Colors.white,fontFamily: fontFamily, fontSize: MediaQuery.of(context).size.height*0.020, fontWeight: FontWeight.bold),),
//                       )
//                   ),
//
//                   Positioned(
//                     top : MediaQuery.of(context).size.height*0.008,
//                     left: MediaQuery.of(context).size.width*0.805,
//
//                     child: InkWell(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileMain()));
//                       },
//                       child: const CircleAvatar(
//                         backgroundImage: AssetImage("happy-bearded-young-man.jpg"),
//                         radius: 40,
//                       ),
//                     ),
//                   ),
//
//                   Positioned(
//                     top : MediaQuery.of(context).size.height*0.15,
//                     left: MediaQuery.of(context).size.width*0.17,
//
//                     child: const CircleAvatar(
//                       backgroundImage: AssetImage("happy-bearded-young-man.jpg"),
//                       radius: 50,
//                     ),
//                   ),
//
//                   Positioned(
//                       top : MediaQuery.of(context).size.height*0.18,
//                       left: MediaQuery.of(context).size.width*0.23,
//
//                       child: Container(
//                         height: MediaQuery.of(context).size.height*0.05,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.white,
//                         ),
//
//                         child: const Padding(
//                           padding: EdgeInsets.only(top: 8.0, bottom: 10.0, left: 30.0, right: 30.0),
//
//                           child: Center(child: Text("Welcome!",style: (TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 30,
//                           )),)),
//                         ),
//                       )
//                   ),
//
//                   Positioned(
//                       top : MediaQuery.of(context).size.height*0.28,
//                       left: MediaQuery.of(context).size.width*0.17,
//
//                       child: Container(
//                         height: MediaQuery.of(context).size.height*0.05,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white,
//                         ),
//
//                         child: const Padding(
//                           padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 40.0, right: 40.0),
//
//                           child: Center(child: Text("Work Better Together",style: (TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                           )),)),
//                         ),
//                       )
//                   ),
//
//                   Positioned(
//                       top : MediaQuery.of(context).size.height*0.335,
//                       left: MediaQuery.of(context).size.width*0.17,
//
//                       child: Container(
//                         height: MediaQuery.of(context).size.height*0.05,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: mainColor,
//                         ),
//
//                         child: const Padding(
//                           padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 20.0, right: 20.0),
//
//                           child: Center(child: Text("Let's Begin",style: (TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.white,
//                           )),)),
//                         ),
//                       )
//                   ),
//
//                   Positioned(
//                     top : MediaQuery.of(context).size.height*0.13,
//                     left: MediaQuery.of(context).size.width*0.7,
//
//                     child: const CircleAvatar(
//                       backgroundColor: Colors.white,
//                       backgroundImage: AssetImage("logo.png"),
//                       radius: 150,
//                     ),
//                   ),
//                 ],
//               ),
//
//             ],
//           ),
//
//
//         ),
//
//       ),
//     );
//       }
//
//
// }
//
//
//
//
// class CurvePainter extends CustomPainter {
//   static const secondaryColor = Color(0xFF7886CB);
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint();
//     paint.color = secondaryColor;
//     paint.style = PaintingStyle.stroke;
//     paint.style = PaintingStyle.fill;
//
//     var path = Path();
//
//     path.moveTo(0, size.height * 0.5);
//     path.quadraticBezierTo(size.width * 0.25, size.height * 0.04,
//         size.width * 0.5, size.height * 0.5);
//     path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
//         size.width * 1.0, size.height * 0.65);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
import 'package:flutter/material.dart';
import 'package:procollab_web/about/about.dart';
import 'package:procollab_web/allposts/posts.dart';
import 'package:procollab_web/earnings/Earnings.dart';
import 'package:procollab_web/progress/editpage.dart';
import 'package:procollab_web/chat/chathome.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../earnings/earningshome.dart';
import '../profile/profilehome.dart';
import '../progress/home.dart';
import '../progress/progresshome.dart';
import '../tasks/taskshome.dart';

class headerpostsu extends StatefulWidget {
  const headerpostsu({Key? key}) : super(key: key);

  @override
  State<headerpostsu> createState() => _headerpostsuState();
}

class _headerpostsuState extends State<headerpostsu> {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFamily = "DM Sans";

  final user = FirebaseAuth.instance.currentUser;

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
                        height: MediaQuery.of(context).size.height*0.1,
                        color:  mainColor,

                      ),
                    ),

                    Positioned(
                        top : MediaQuery.of(context).size.height*0.03,
                        left: MediaQuery.of(context).size.width*0.17,

                        child: const Text("PROCOLLAB",
                          style: TextStyle(color: Colors.white,fontFamily: fontFamily, fontSize: 25, fontWeight: FontWeight.bold),)
                    ),

                    Positioned(
                      top : MediaQuery.of(context).size.height*0.035,
                      left: MediaQuery.of(context).size.width*0.33,

                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> PostsMain()));
                          setState(() {

                          });
                        },
                        child: const Text("Projects", style: (TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),),
                      ),
                    ),

                    Positioned(
                      top : MediaQuery.of(context).size.height*0.035,
                      left: MediaQuery.of(context).size.width*0.39,

                      child: InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProgresssMain()));

                          });
                        },
                        child: const Text("Progress", style: (TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),),
                      ),
                    ),

                    Positioned(
                      top : MediaQuery.of(context).size.height*0.035,
                      left: MediaQuery.of(context).size.width*0.455,

                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskHome(documentId: "ehw5L2rIulFQLIKMVq2p")));
                          setState(() {

                          });
                        },
                        child: const Text("Tickets", style: (TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),),
                      ),
                    ),

                    Positioned(
                      top : MediaQuery.of(context).size.height*0.035,
                      left: MediaQuery.of(context).size.width*0.515,

                      child: InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> chatHome()));

                          });
                        },
                        child: const Text("Chat", style: (TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),),
                      ),
                    ),

                    Positioned(
                      top : MediaQuery.of(context).size.height*0.035,
                      left: MediaQuery.of(context).size.width*0.565,

                      child: InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> earningsMain()));
                          });
                        },
                        child: const Text("Earnings", style: (TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),),
                      ),
                    ),

                    Positioned(
                        top : MediaQuery.of(context).size.height*0.035,
                        left: MediaQuery.of(context).size.width*0.685,

                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileMain()));
                          },
                          child: Text(user!.email!,
                            style: TextStyle(color: Colors.white,fontFamily: fontFamily, fontSize: MediaQuery.of(context).size.height*0.020, fontWeight: FontWeight.bold),),
                        )
                    ),

                    Positioned(
                      top : MediaQuery.of(context).size.height*0.008,
                      left: MediaQuery.of(context).size.width*0.805,

                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileMain()));
                        },
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("happy-bearded-young-man.jpg"),
                          radius: 30,
                        ),
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
