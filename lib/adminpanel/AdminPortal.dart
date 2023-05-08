import 'package:flutter/material.dart';
import 'package:procollab_web/adminpanel/lineChart.dart';
import 'package:procollab_web/allposts/allposts.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpostsignin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chart/fl_chart.dart';

import 'AdminFooter.dart';
import 'AdminHeader.dart';
import 'AdminAllPosts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
    projectId: "fir-authentication-ef41b",
    messagingSenderId: "712311594484",
    appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
  ));
  runApp(Adminportal());
}

class Adminportal extends StatefulWidget {
  const Adminportal({Key? key}) : super(key: key);

  @override
  State<Adminportal> createState() => _AdminportalState();
}

class _AdminportalState extends State<Adminportal> {
  var mainColor = const Color(0xFF1C5D8B);
  var secondaryColor = const Color(0xFF3F83B4);
  var sec2Color = const Color(0xFFD8EAFF);
  var sec3Color = const Color(0xFF5381B8);
  var totalusers = 0;
  var totalposts = 0;
  var temp = 0;
  final user = FirebaseAuth.instance.currentUser;

  List<String> docIDs = [];

  Future getTotalUsers() async {
    await FirebaseFirestore.instance.collection("users").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
    totalusers = docIDs.length;
    totalusers = (totalusers / 2) as int;
  }

  Future getTotalPosts() async {
    await FirebaseFirestore.instance.collection("posts").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
    totalposts = docIDs.length;
  }

  @override
  void initState() {
    // TODO: implement initState
    getTotalPosts();
    getTotalUsers();
  }

  CollectionReference users = FirebaseFirestore.instance.collection("stats");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Adminheaderpostsu(),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.height * 0.37,
                                MediaQuery.of(context).size.height * 0.10,
                                0,
                                0),
                            height: MediaQuery.of(context).size.height * 0.13,
                            width: MediaQuery.of(context).size.width * 0.65,
                            decoration: BoxDecoration(
                              color: sec2Color,
                              border: Border.all(
                                color: mainColor,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              "Admin Portal",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.06,
                                  color: mainColor),
                            )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.height * 0.75,
                                MediaQuery.of(context).size.height * 0.10,
                                0,
                                0),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                              color: sec2Color,
                              border: Border.all(
                                color: mainColor,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              "Website Analytics",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05,
                                  color: mainColor),
                            )),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height * 0.32,
                                    MediaQuery.of(context).size.height * 0.10,
                                    0,
                                    0),
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                width: MediaQuery.of(context).size.width * 0.30,
                                decoration: BoxDecoration(
                                  color: sec3Color,
                                  borderRadius: BorderRadius.circular(20),
                                ),
//child: Center(child: Text("Website Analytics",style: TextStyle(decoration:TextDecoration.none,fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: mainColor),)),
                                child: FutureBuilder<DocumentSnapshot>(
                                  future: users.doc("docvisitors").get(),
                                  builder: ((context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      Map<String, dynamic> data = snapshot.data!
                                          .data() as Map<String, dynamic>;
                                      // return Text(
                                      //   "${data["visitors"]}",
                                      //   style: TextStyle(
                                      //       color: Colors.white, fontSize: 35),
                                      // );
                                      return Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.033,
                                                0,
                                                0),
                                            child: Text(
                                              "VISITORS",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 35),
                                            ),
                                            // );
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.06,
                                                0,
                                                0),
                                            child: Text(
                                              "${data["visitors"]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 55),
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                    return Text("");
                                  }),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.height * 0.05,
                                      MediaQuery.of(context).size.height * 0.10,
                                      0,
                                      0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  decoration: BoxDecoration(
                                    color: sec3Color,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
//child: Center(child: Text("Website Analytics",style: TextStyle(decoration:TextDecoration.none,fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: mainColor),)),

                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0,
                                            MediaQuery.of(context).size.height *
                                                0.033,
                                            0,
                                            0),
                                        child: Text(
                                          "TOTAL USERS",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                        // );
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0,
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                            0,
                                            0),
                                        child: Text(
                                          totalusers.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 55),
                                        ),
                                      )
                                    ],
                                  )

                                  // child: Text(
                                  //   totalusers.toString(),
                                  //   style: TextStyle(
                                  //       color: Colors.white, fontSize: 35),
                                  // ),
                                  ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height * 0.32,
                                    MediaQuery.of(context).size.height * 0.10,
                                    0,
                                    0),
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                width: MediaQuery.of(context).size.width * 0.30,
                                decoration: BoxDecoration(
                                  color: sec3Color,
                                  borderRadius: BorderRadius.circular(20),
                                ),
//child: Center(child: Text("Website Analytics",style: TextStyle(decoration:TextDecoration.none,fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: mainColor),)),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  height: 300,
                                  child: LineChart(
                                    LineChartData(
                                        borderData: FlBorderData(show: false),
                                        lineBarsData: [
                                          LineChartBarData(spots: [
                                            const FlSpot(0, 1),
                                            const FlSpot(1, 3),
                                            const FlSpot(2, 10),
                                            const FlSpot(3, 7),
                                            const FlSpot(4, 14),
                                          ])
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.height * 0.05,
                                      MediaQuery.of(context).size.height * 0.10,
                                      0,
                                      0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  decoration: BoxDecoration(
                                    color: sec3Color,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
//child: Center(child: Text("Website Analytics",style: TextStyle(decoration:TextDecoration.none,fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: mainColor),)),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0,
                                            MediaQuery.of(context).size.height *
                                                0.033,
                                            0,
                                            0),
                                        child: Text(
                                          "TOTAL POSTS",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                        // );
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0,
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                            0,
                                            0),
                                        child: Text(
                                          totalposts.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 55),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                      AdminHome(),

                      Adminfooter(),
                      // Footer
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
