import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:procollab_web/ProjectCRUD/ProjectCRUD/page/addpage.dart';

class OngoingProjects extends StatefulWidget {
  final String documentId;

  OngoingProjects({required this.documentId});

  @override
  State<OngoingProjects> createState() =>
      _OngoingProjectsState(documentId: this.documentId);
}

class _OngoingProjectsState extends State<OngoingProjects> {
  final String documentId;
  _OngoingProjectsState({required this.documentId});

  @override
// List <String>statuses = ["Completed", "In Progress", "Pending"];
  List<String> taskstatuses = [];
  var status1 = "Completed";
  var status2 = "In Progress";
  var status3 = "Pending";
  var completedcounter = 0;
  double percent = 0;
  double percentage = 0;
  List<String> colnames = [];
  var temp;
  var temppercent;
  var concolor = Color(0xBBBBC100);
  var textcolor = Color(0xBBBBC100);
  var displaystatus = "";
  // var name="Saliha Shahzad";
  // var name="Nooraiz Asghar";

  Widget build(BuildContext context) {
    var mainColor = Color(0xFF5364B8);
    var secondaryColor = Color(0xFF7886CB);
    //print("Document: $documentId");
    var compBack = Color(0xFF71FF99);
    var compFront = Color(0xFF2FB856);

    var inpBack = Color(0xFFFCFF98);
    var inpFront = Color(0xFFBEC300);

    var pendBack = Color(0xFFFF9292);
    var pendFront = Color(0xFFFF1919);

    CollectionReference posts = FirebaseFirestore.instance.collection("posts");
    print("ongoingprojects");

    return SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
            future: posts.doc(documentId).get(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                if (data['CollaboratorsEmail'].contains(FirebaseAuth.instance.currentUser!.email) && ("${data['ProjectStatus']}" != "Completed") || ("${data['email']}" == FirebaseAuth.instance.currentUser!.email) ) {
                  var collaboratorslen = data['Collaborators'].length;
                  // var taskslen = data['tasksname'].length;
                  var taskslen = 3;
                  List.generate(collaboratorslen, (index) {
                    colnames.add("${data['Collaborators'][index]}");
                    print("NAAM: ${colnames[index]}");
                  });
                  var completedTasks = 0;
                  for(int i = 0; i< taskslen; i++){
                    if(data['taskstatuses'][i]=="Completed"){
                      completedTasks += 1;
                    }
                  }
                  var percent = completedTasks/taskslen;
                  print(percent);
                  print("Completed Tasks: $completedTasks");
                  var percentText = (percent*100).toStringAsFixed(1);
                  print("Text Percent $percentText");
                  return SizedBox(
                    // height: 3000,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.00,
                                top: MediaQuery.of(context).size.height * 0.1),
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
                                              0.23,
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                          0,
                                          0),
                                      child: Text(
                                        "${data['projectname']}",
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "DM Sans",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          color: mainColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ]),

                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),

                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.28,
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
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      List.generate(collaboratorslen, (index) {
                                    colnames
                                        .add("${data['Collaborators'][index]}");
                                    print("NAAM: ${colnames[index]}");
                                    return Container(
                                      margin: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.height *
                                              0.125,
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
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.275, MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.025, 0, 0),
                                        child: Text("YOUR PROGRESS", style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "DM Sans",
                                          fontSize: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.03,
                                          color: mainColor,
                                          fontWeight: FontWeight.w600,),)
                                    ),
                                  ],
                                ),

                                SizedBox(height: 25,),
                                Container(
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.15, 0, 0, 0),
                                  child: LinearPercentIndicator(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.35,
                                    animation: true,
                                    lineHeight: 20.0,
                                    animationDuration: 2500,
                                    percent: percent,
                                    center: Text("$percentText%"),
                                    linearStrokeCap:
                                    LinearStrokeCap.roundAll,
                                    progressColor: secondaryColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.27,
                                          MediaQuery.of(context).size.height *
                                              0.025,
                                          0,
                                          MediaQuery.of(context).size.width *
                                              0.025,
                                        ),
                                        child: Text(
                                          "Amount Earned",
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
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                          0,
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
                                                            AddPage.fontFam)),
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
                                                            AddPage.fontFam)),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          80, 20, 0, 0),
                                                  child: const Center(
                                                      child: Text(
                                                    "\$0",
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
                                                            AddPage.fontFam)),
                                              ),
                                              Positioned(
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          80, 20, 0, 0),
                                                  child: Center(
                                                      child: Text(
                                                    "\$" "${data['AmountDue']}",
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
                                // Container(
                                //     child: CircularPercentIndicator(
                                //       radius: 120.0,
                                //       lineWidth: 5.0,
                                //       percent: temp,
                                //       center: Center(
                                //         child: Container(
                                //             width: MediaQuery.of(context).size.width *
                                //                 0.04,
                                //             height:
                                //                 MediaQuery.of(context).size.height *
                                //                     0.08,
                                //             child: Center(
                                //               child: Text(
                                //                 "$temppercent%",
                                //                 style: TextStyle(
                                //                   decoration: TextDecoration.none,
                                //                   fontFamily: "DM Sans",
                                //                   fontSize: MediaQuery.of(context)
                                //                           .size
                                //                           .height *
                                //                       0.0325,
                                //                   color: mainColor,
                                //                   fontWeight: FontWeight.w600,
                                //                 ),
                                //               ),
                                //             )),
                                //       ),
                                //       progressColor: mainColor,
                                // )),
                                //
                                // Row(
                                //   children: [
                                //     Container(
                                //         margin: EdgeInsets.fromLTRB(
                                //           MediaQuery.of(context).size.width *
                                //               0.27,
                                //           MediaQuery.of(context).size.height *
                                //               0.025,
                                //           0,
                                //           MediaQuery.of(context).size.width *
                                //               0.025,
                                //         ),
                                //         child: Text(
                                //           "Amount Earned",
                                //           style: TextStyle(
                                //             decoration: TextDecoration.none,
                                //             fontFamily: "DM Sans",
                                //             fontSize: MediaQuery.of(context)
                                //                     .size
                                //                     .height *
                                //                 0.03,
                                //             color: mainColor,
                                //             fontWeight: FontWeight.w600,
                                //           ),
                                //         )),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     Container(
                                //       margin: EdgeInsets.fromLTRB(
                                //           MediaQuery.of(context).size.height *
                                //               0.15,
                                //           0,
                                //           0,
                                //           MediaQuery.of(context).size.width *
                                //               0.025),
                                //       height:
                                //           MediaQuery.of(context).size.height *
                                //               0.25,
                                //       width: MediaQuery.of(context).size.width *
                                //           0.50,
                                //       decoration: BoxDecoration(
                                //           color: Colors.white,
                                //           borderRadius:
                                //               BorderRadius.circular(10),
                                //           border: Border.all(
                                //             color: mainColor,
                                //             width: 2.5,
                                //           )),
                                //       child: Row(
                                //         children: [
                                //           Column(
                                //             children: [
                                //               Container(
                                //                 alignment: Alignment.center,
                                //                 margin: EdgeInsets.fromLTRB(
                                //                     MediaQuery.of(context)
                                //                             .size
                                //                             .height *
                                //                         0.1,
                                //                     MediaQuery.of(context)
                                //                             .size
                                //                             .height *
                                //                         0.1,
                                //                     0,
                                //                     0),
                                //                 child: Text("Project Status",
                                //                     style: TextStyle(
                                //                         decoration:
                                //                             TextDecoration.none,
                                //                         fontSize: 20,
                                //                         color: mainColor,
                                //                         fontWeight:
                                //                             FontWeight.bold,
                                //                         fontFamily:
                                //                             AddPage.fontFam)),
                                //               ),
                                //               Positioned(
                                //                 child: Container(
                                //                   margin:
                                //                       const EdgeInsets.fromLTRB(
                                //                           95, 20, 0, 0),
                                //                   child: Center(
                                //                       child: Text(
                                //                     "${data['ProjectStatus']}",
                                //                     style: const TextStyle(
                                //                         decoration:
                                //                             TextDecoration.none,
                                //                         fontFamily: "DM Sans",
                                //                         fontSize: 20,
                                //                         color: Colors.green,
                                //                         fontWeight:
                                //                             FontWeight.w600),
                                //                   )),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //
                                //           // SizedBox(
                                //           //   width: MediaQuery.of(context).size.width*0.020,
                                //           // ),
                                //           Column(
                                //             children: [
                                //               Container(
                                //                 margin:
                                //                     const EdgeInsets.fromLTRB(
                                //                         80, 0, 0, 0),
                                //                 height: MediaQuery.of(context)
                                //                         .size
                                //                         .height *
                                //                     0.244,
                                //                 width: 2.5,
                                //                 decoration: BoxDecoration(
                                //                   color: mainColor,
                                //                   // border: Border.all(color: mainColor, width: 2.5),
                                //                   //borderRadius: new BorderRadius.circular(0),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //           // SizedBox(
                                //           //   height: MediaQuery.of(context).size.height*0.020,
                                //           // ),
                                //           Column(
                                //             children: [
                                //               Container(
                                //                 alignment: Alignment.center,
                                //                 margin: EdgeInsets.fromLTRB(
                                //                     MediaQuery.of(context)
                                //                             .size
                                //                             .height *
                                //                         0.1,
                                //                     MediaQuery.of(context)
                                //                             .size
                                //                             .height *
                                //                         0.1,
                                //                     0,
                                //                     0),
                                //                 child: Text("Amount Earned",
                                //                     style: TextStyle(
                                //                         decoration:
                                //                             TextDecoration.none,
                                //                         fontSize: 20,
                                //                         color: mainColor,
                                //                         fontWeight:
                                //                             FontWeight.bold,
                                //                         fontFamily:
                                //                             AddPage.fontFam)),
                                //               ),
                                //               Positioned(
                                //                 child: Container(
                                //                   margin:
                                //                       const EdgeInsets.fromLTRB(
                                //                           80, 20, 0, 0),
                                //                   child: const Center(
                                //                       child: Text(
                                //                     "\$0",
                                //                     style: TextStyle(
                                //                         decoration:
                                //                             TextDecoration.none,
                                //                         fontFamily: "DM Sans",
                                //                         fontSize: 20,
                                //                         color: Colors.green,
                                //                         fontWeight:
                                //                             FontWeight.w600),
                                //                   )),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //
                                //           Column(
                                //             children: [
                                //               Container(
                                //                 margin:
                                //                     const EdgeInsets.fromLTRB(
                                //                         80, 0, 0, 0),
                                //                 height: MediaQuery.of(context)
                                //                         .size
                                //                         .height *
                                //                     0.244,
                                //                 width: 2.5,
                                //                 decoration: BoxDecoration(
                                //                   color: mainColor,
                                //                   // border: Border.all(color: mainColor, width: 2.5),
                                //                   //borderRadius: new BorderRadius.circular(0),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //           Column(
                                //             children: [
                                //               Container(
                                //                 alignment: Alignment.center,
                                //                 margin: EdgeInsets.fromLTRB(
                                //                     MediaQuery.of(context)
                                //                             .size
                                //                             .height *
                                //                         0.1,
                                //                     MediaQuery.of(context)
                                //                             .size
                                //                             .height *
                                //                         0.1,
                                //                     0,
                                //                     0),
                                //                 child: Text("Amount Due",
                                //                     style: TextStyle(
                                //                         decoration:
                                //                             TextDecoration.none,
                                //                         fontSize: 20,
                                //                         color: mainColor,
                                //                         fontWeight:
                                //                             FontWeight.bold,
                                //                         fontFamily:
                                //                             AddPage.fontFam)),
                                //               ),
                                //               Positioned(
                                //                 child: Container(
                                //                   margin:
                                //                       const EdgeInsets.fromLTRB(
                                //                           80, 20, 0, 0),
                                //                   child: Center(
                                //                       child: Text(
                                //                     "\$" "${data['AmountDue']}",
                                //                     style: const TextStyle(
                                //                         decoration:
                                //                             TextDecoration.none,
                                //                         fontFamily: "DM Sans",
                                //                         fontSize: 20,
                                //                         color: Colors.green,
                                //                         fontWeight:
                                //                             FontWeight.w600),
                                //                   )),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                //
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
      ),
      //   ),
      // ),
    );
  }
}
