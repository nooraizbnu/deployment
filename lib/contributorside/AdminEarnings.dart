import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../headerfooter/footer.dart';
import '../headerfooter/headerpostsignin.dart';

class SPPEarnings extends StatelessWidget {
  final String documentId = 'ehw5L2rIulFQLIKMVq2p';
  // final String documentId = 'vNXcWvF6cSymQrm2Nj9m';
  // final String documentId = 'RHNmhROxx9CYDAx1aWSk';

  @override
  Widget build(BuildContext context) {
    //print(documentId);
    var fontFam = "DM Sans";

    var mainColor = const Color(0xFF5364B8);
    var secondaryColor = const Color(0xFF7886CB);
    CollectionReference users = FirebaseFirestore.instance.collection("posts");
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
      return SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(documentId).get(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  var collaborators = data['Collaborators'].length;
                  // var taskslength = data['tasksname'].length;
                  // var taskslength = data['tasksname'].length;
                  return Container(
                    // height: MediaQuery.of(context).size.height,
                    //   width:MediaQuery.of(context).size.width,
                    //color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 75),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.13,
                                      width:
                                          MediaQuery.of(context).size.width *
                                              0.65,
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "All-TIME",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            color: Colors.white),
                                      )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0,
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                          0,
                                          0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3355,
                                      width:
                                          MediaQuery.of(context).size.width *
                                              0.65,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: secondaryColor,
                                            width: 5,
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
                                                child: Text("All-Time",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .none,
                                                        fontSize: 20,
                                                        color: mainColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: fontFam)),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .fromLTRB(95, 50, 0, 0),
                                                  child: Center(
                                                      child: Text(
                                                    "${data['AmountEarned']}",
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .none,
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

                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.020,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        80, 0, 0, 0),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1557,
                                                width: 3,
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
                                                child: Text("Last Month",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .none,
                                                        fontSize: 20,
                                                        color: mainColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: fontFam)),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .fromLTRB(80, 50, 0, 0),
                                                  child: Center(
                                                      child: Text(
                                                    "${data['AmountEarned']}",
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .none,
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
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.020,
                                          ),

                                          Column(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        80, 0, 0, 0),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1557,
                                                width: 3,
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
                                                child: Text("Remaining Dues",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .none,
                                                        fontSize: 20,
                                                        color: mainColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: fontFam)),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .fromLTRB(80, 50, 0, 0),
                                                  child: Center(
                                                      child: Text(
                                                    "${data['AmountDue']}",
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .none,
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
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 75),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.13,
                                      width:
                                          MediaQuery.of(context).size.width *
                                              0.65,
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "PROJECT-WISE",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            color: Colors.white),
                                      )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 50),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.75,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: secondaryColor,
                                                width: 5,
                                              )),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Positioned(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.50,
                                                          MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.03,
                                                          0,
                                                          0),
                                                      child: Center(
                                                          child: Text(
                                                        "${data['projectname']}",
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            fontFamily:
                                                                "DM Sans",
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.045,
                                                            color: mainColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.025,
                                              ),
                                              Row(children: [
                                                Container(
                                                  child: const Text(
                                                    "Amount Earned",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.015,
                                                        0,
                                                        0),
                                                    height: 3,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.60,
                                                    decoration: BoxDecoration(
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.025,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.03,
                                                        0,
                                                        0),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.3355,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.60,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color:
                                                              secondaryColor,
                                                          width: 5,
                                                        )),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
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
                                                                child: Text(
                                                                    "Project Status",
                                                                    style: TextStyle(
                                                                        decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                        fontSize:
                                                                            20,
                                                                        color:
                                                                            mainColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            fontFam)),
                                                              ),
                                                              Positioned(
                                                                child:
                                                                    Container(
                                                                  margin: const EdgeInsets
                                                                          .fromLTRB(
                                                                      95,
                                                                      50,
                                                                      0,
                                                                      0),
                                                                  child: Center(
                                                                      child:
                                                                          Text(
                                                                    "${data['ProjectStatus']}",
                                                                    style: const TextStyle(
                                                                        decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                        fontFamily:
                                                                            "DM Sans",
                                                                        fontSize:
                                                                            20,
                                                                        color: Colors
                                                                            .green,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        // SizedBox(
                                                        //   width: MediaQuery.of(context).size.width*0.020,
                                                        // ),
                                                        Column(
                                                          children: [
                                                            Container(
                                                              margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                  80,
                                                                  0,
                                                                  0,
                                                                  0),
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1557,
                                                              width: 3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    mainColor,
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
                                                              alignment:
                                                                  Alignment
                                                                      .center,
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
                                                              child: Text(
                                                                  "Amount Earned",
                                                                  style: TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      fontSize:
                                                                          20,
                                                                      color:
                                                                          mainColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          fontFam)),
                                                            ),
                                                            Positioned(
                                                              child:
                                                                  Container(
                                                                margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                    80,
                                                                    50,
                                                                    0,
                                                                    0),
                                                                child: Center(
                                                                    child:
                                                                        Text(
                                                                  "${data['AmountEarned']}",
                                                                  style: const TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      fontFamily:
                                                                          "DM Sans",
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .green,
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
                                                              margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                  80,
                                                                  0,
                                                                  0,
                                                                  0),
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1557,
                                                              width: 3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    mainColor,
                                                                // border: Border.all(color: mainColor, width: 2.5),
                                                                //borderRadius: new BorderRadius.circular(0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
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
                                                              child: Text(
                                                                  "Amount Due",
                                                                  style: TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      fontSize:
                                                                          20,
                                                                      color:
                                                                          mainColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          fontFam)),
                                                            ),
                                                            Positioned(
                                                              child:
                                                                  Container(
                                                                margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                    80,
                                                                    50,
                                                                    0,
                                                                    0),
                                                                child: Center(
                                                                    child:
                                                                        Text(
                                                                  "${data['AmountDue']}",
                                                                  style: const TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      fontFamily:
                                                                          "DM Sans",
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .green,
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                //return Text("Fetching Data from Database..");
                return const Text("");
              })),
        ),
      );
  }
}
