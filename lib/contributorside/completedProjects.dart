import 'dart:html';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:procollab_web/ContributorProfile/completedProjects.dart';
import 'package:procollab_web/allposts/posts.dart';
import '../headerfooter/footer.dart';
import '../headerfooter/headerpostsignin.dart';
import "package:firebase_auth/firebase_auth.dart";

class CompProjs extends StatefulWidget {
  final String documentId;

  CompProjs({required this.documentId});

  @override
  State<CompProjs> createState() => _CompProjsState(documentId: documentId);
}

class _CompProjsState extends State<CompProjs> {
  final String documentId;

  _CompProjsState({required this.documentId});

  @override
  Widget build(BuildContext context) {
    var mainColor = Color(0xFF5364B8);
    var secondaryColor = Color(0xFF7886CB);
    var fontFam = "DM Sans";
    var name = "Arham Latif";
    List<String> colnames = [];
    print("Document: $documentId");

    CollectionReference posts = FirebaseFirestore.instance.collection("posts");
    return SafeArea(
      child: FutureBuilder<DocumentSnapshot>(
          future: posts.doc(documentId).get(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              //var taskslen = 3;
              var collaboratorslen = data['Collaborators'].length;

              List.generate(collaboratorslen, (index) {
                colnames.add("${data['Collaborators'][index]}");
                print("NAAM: ${colnames[index]}");
              });

              if ("${data['ProjectStatus']}" == "Completed" &&
                  data['CollaboratorsEmail'].contains(FirebaseAuth.instance.currentUser!.email) || "${data['email']}" == FirebaseAuth.instance.currentUser!.email ) {
                return SizedBox(
                  child: Container(
                    //margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.1, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.00),
                          width: MediaQuery.of(context).size.width * 0.65,
                          //height: 1300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: mainColor,
                                width: 2.5,
                              )),

                          child: Column(
                            children: [
                              Row(children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width *
                                            0.28,
                                        MediaQuery.of(context).size.height *
                                            0.05,
                                        0,
                                        0),
                                    child: Text(
                                      "${data['projectname']}",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: "DM Sans",
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        color: mainColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ]),

                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),

                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.320,
                                          MediaQuery.of(context).size.height *
                                              0.025,
                                          0,
                                          0),
                                      child: Text(
                                        "Collaborators",
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "DM Sans",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          color: mainColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ],
                              ),

                              //ROW WITH THE NAMES OF COLLABORATORS
                              Container(
                                padding: const EdgeInsets.only(left: 225.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      List.generate(collaboratorslen, (index) {
                                    return Container(
                                      margin: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.025,
                                          MediaQuery.of(context).size.height *
                                              0.025,
                                          0,
                                          0),
                                      child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025,
                                              0,
                                              0,
                                              0),
                                          child: Text(
                                            "| ${data['Collaborators'][index]} |",
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontFamily: "DM Sans",
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.025,
                                                color: mainColor,
                                                fontWeight: FontWeight.w400),
                                          )),
                                    );
                                  }),
                                ),
                              ),

                              //YOUR PROGRESS HEADING
                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.30,
                                          MediaQuery.of(context).size.height *
                                              0.025,
                                          0,
                                          0),
                                      child: Text(
                                        "Project Progress",
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "DM Sans",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          color: mainColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ],
                              ),

                              SizedBox(
                                height: 25,
                              ),

                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.30,
                                          0,
                                          0,
                                          0),
                                      child: CircularPercentIndicator(
                                        radius: 120.0,
                                        lineWidth: 5.0,
                                        percent: 1,
                                        center: Center(
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                              child: Center(
                                                child: Text(
                                                  "100%",
                                                  style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: "DM Sans",
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0325,
                                                    color: mainColor,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              )),
                                        ),
                                        progressColor: mainColor,
                                      )),
                                ],
                              ),

                              SizedBox(
                                height: 50,
                              ),

                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height * 0.03,
                                    MediaQuery.of(context).size.height * 0.02,
                                    0,
                                    0),
                                child: Text("AMOUNT EARNED",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 25,
                                        color: mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: fontFam)),
                              ),

                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.height *
                                            0.15,
                                        MediaQuery.of(context).size.width *
                                            0.025,
                                        0,
                                        MediaQuery.of(context).size.width *
                                            0.025),
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.25,
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        border: Border.all(
                                          color: mainColor,
                                          width: 2.5,
                                        )),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.1,
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.1,
                                                  0,
                                                  0),
                                              child: Text("Project Status",
                                                  style: TextStyle(
                                                      decoration:
                                                      TextDecoration.none,
                                                      fontSize: 20,
                                                      color: mainColor,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      fontFam)),
                                            ),
                                            Positioned(
                                              child: Container(
                                                margin:
                                                const EdgeInsets.fromLTRB(
                                                    95, 20, 0, 0),
                                                child: Center(
                                                    child: Text(
                                                      "${data['ProjectStatus']}",
                                                      style: const TextStyle(
                                                          decoration:
                                                          TextDecoration.none,
                                                          fontFamily: "DM Sans",
                                                          fontSize: 20,
                                                          color: Colors.green,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),

                                        // SizedBox(
                                        //   width: MediaQuery.of(context).size.width*0.020,
                                        // ),
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                              const EdgeInsets.fromLTRB(
                                                  80, 0, 0, 0),
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.244,
                                              width: 2.5,
                                              decoration: BoxDecoration(
                                                color: mainColor,
                                                // border: Border.all(color: mainColor, width: 2.5),
                                                //borderRadius: new BorderRadius.circular(0),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(
                                        //   height: MediaQuery.of(context).size.height*0.020,
                                        // ),
                                        Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.1,
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.1,
                                                  0,
                                                  0),
                                              child: Text("Amount Earned",
                                                  style: TextStyle(
                                                      decoration:
                                                      TextDecoration.none,
                                                      fontSize: 20,
                                                      color: mainColor,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      fontFam)),
                                            ),
                                            Positioned(
                                              child: Container(
                                                margin:
                                                const EdgeInsets.fromLTRB(
                                                    80, 20, 0, 0),
                                                child: Center(
                                                    child: Text(
                                                      "${data['AmountEarned']}",
                                                      style: TextStyle(
                                                          decoration:
                                                          TextDecoration.none,
                                                          fontFamily: "DM Sans",
                                                          fontSize: 20,
                                                          color: Colors.green,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                              const EdgeInsets.fromLTRB(
                                                  80, 0, 0, 0),
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.244,
                                              width: 2.5,
                                              decoration: BoxDecoration(
                                                color: mainColor,
                                                // border: Border.all(color: mainColor, width: 2.5),
                                                //borderRadius: new BorderRadius.circular(0),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.1,
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.1,
                                                  0,
                                                  0),
                                              child: Text("Amount Due",
                                                  style: TextStyle(
                                                      decoration:
                                                      TextDecoration.none,
                                                      fontSize: 20,
                                                      color: mainColor,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      fontFam)),
                                            ),
                                            Positioned(
                                              child: Container(
                                                margin:
                                                const EdgeInsets.fromLTRB(
                                                    80, 20, 0, 0),
                                                child: Center(
                                                    child: Text(
                                                      "\$0",
                                                      style: const TextStyle(
                                                          decoration:
                                                          TextDecoration.none,
                                                          fontFamily: "DM Sans",
                                                          fontSize: 20,
                                                          color: Colors.green,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
            //return Text("Fetching Data from Database..");
            return Text("");
          })),
    );
  }
}
