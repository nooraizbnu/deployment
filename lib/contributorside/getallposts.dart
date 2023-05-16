import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:procollab_web/ContributorProfile/completedProgress.dart';
// import 'package:procollab_web/ContributorProfile/completedProjects.dart';
import 'package:procollab_web/allposts/getfirebasedata.dart';
import 'package:procollab_web/contributorside/completedProjects.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFamily = "DM Sans";

  final user = FirebaseAuth.instance.currentUser;

  List<String> docIDs = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance.collection("posts").get().then(
          (snapshot) =>
          snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
    );
    print(docIDs);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.15,
              ),
              SizedBox(
                height: 4000, // +600
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                  ),
                  child: FutureBuilder(
                    future: getDocIds(),
                    builder: (context, snapshot){
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: docIDs.length,
                          itemBuilder: (context, index){
                            return Container(
                              child: Row(
                                children: [
                                  Row(children: [
                                    CompProjs(documentId: docIDs[index]),
                                  ],),
                                ],
                              ),

                            );
                          }
                      );
                    },
                  ),
                ),

              ),
            ],


          ),
        ),
      ),
    );
    //);
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