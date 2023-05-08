import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
  var name = "Arham Latif";
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

    CollectionReference users = FirebaseFirestore.instance.collection("posts");
    print("ongoingprojects");

    return SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
            future: users.doc(documentId).get(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                var taskslen = 3;
                var collaboratorslen = 3;
                List.generate(collaboratorslen, (index) {
                  colnames.add("${data['Collaborators'][index]}");
                  print("NAAM: ${colnames[index]}");
                });
                // var taskslen = data['tasksname'].length;
                // var collaboratorslen = data['Collaborators'].length;
                // var taskslen = 3;
                // var collaboratorslen = 3;
                if (colnames.contains(name) && ("${data['ProjectStatus']}" == "In Progress" || "${data['ProjectStatus']}" == "Pending" )) {
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          List.generate(taskslen, (index) {
                                        if ("${data['taskstatuses'][index]}" ==
                                            "Completed") {
                                          completedcounter++;
                                        }
                                        print("Counter: $completedcounter");
                                        percent = (completedcounter / taskslen);
                                        percentage = percent * 100;
                                        print("Percent: $percent");
                                        temp =
                                            double.parse("${data['progress']}");
                                        temppercent = temp * 100;
                                        return Text("");
                                      }),
                                    ),
                                  ],
                                ),
                                Container(
                                    child: CircularPercentIndicator(
                                      radius: 120.0,
                                      lineWidth: 5.0,
                                      percent: temp,
                                      center: Center(
                                        child: Container(
                                            width: MediaQuery.of(context).size.width *
                                                0.04,
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.08,
                                            child: Center(
                                              child: Text(
                                                "$temppercent%",
                                                style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: "DM Sans",
                                                  fontSize: MediaQuery.of(context)
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
                                // child: Container(
                                //   child: Column(
                                //     children: [
                                //       Center(
                                //         child: Container(
                                //             margin: EdgeInsets.fromLTRB(MediaQuery
                                //                 .of(context)
                                //                 .size
                                //                 .width * 0.00, MediaQuery
                                //                 .of(context)
                                //                 .size
                                //                 .height * 0.1, 0, 0),
                                //             height: MediaQuery
                                //                 .of(context)
                                //                 .size
                                //                 .height * 0.15,
                                //             width: MediaQuery
                                //                 .of(context)
                                //                 .size
                                //                 .width * 0.65,
                                //             decoration: BoxDecoration(
                                //                 borderRadius: BorderRadius.circular(20),
                                //                 color: mainColor,
                                //                 border: Border.all(
                                //                   color: mainColor,
                                //                   width: 2.5,
                                //                 )
                                //             ),
                                //             child: Center(child: Text("PROGRESS", style: TextStyle(
                                //               decoration: TextDecoration.none,
                                //               fontFamily: "DM Sans",
                                //               fontSize: MediaQuery
                                //                   .of(context)
                                //                   .size
                                //                   .height * 0.05,
                                //               color: Colors.white,
                                //               fontWeight: FontWeight.w500,),))
                                //         ),
                                //       ),
                                //
                                //
                                //       Container(
                                //         margin: EdgeInsets.only(left: MediaQuery
                                //             .of(context)
                                //             .size
                                //             .width * 0.00, top: MediaQuery
                                //             .of(context)
                                //             .size
                                //             .height * 0.1),
                                //         width: MediaQuery
                                //             .of(context)
                                //             .size
                                //             .width * 0.65,
                                //         //height: 1300,
                                //         decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(20),
                                //             border: Border.all(
                                //               color: mainColor,
                                //               width: 2.5,
                                //             )
                                //         ),
                                //
                                //         child: Column(
                                //           children: [
                                //             Row(
                                //                 children: [
                                //                   Container(
                                //                       margin: EdgeInsets.fromLTRB(MediaQuery
                                //                           .of(context)
                                //                           .size
                                //                           .width * 0.19, MediaQuery
                                //                           .of(context)
                                //                           .size
                                //                           .height * 0.05, 0, 0),
                                //                       child: Text("${data['projectname']}",
                                //                         style: TextStyle(
                                //                           decoration: TextDecoration.none,
                                //                           fontFamily: "DM Sans",
                                //                           fontSize: MediaQuery
                                //                               .of(context)
                                //                               .size
                                //                               .height * 0.05,
                                //                           color: mainColor,
                                //                           fontWeight: FontWeight.w500,),)
                                //                   ),
                                //                 ]
                                //             ),
                                //
                                //             SizedBox(height: MediaQuery
                                //                 .of(context)
                                //                 .size
                                //                 .height * 0.025,),
                                //
                                //             Row(
                                //               children: [
                                //                 Container(
                                //                     margin: EdgeInsets.fromLTRB(MediaQuery
                                //                         .of(context)
                                //                         .size
                                //                         .width * 0.28, MediaQuery
                                //                         .of(context)
                                //                         .size
                                //                         .height * 0.025, 0, 0),
                                //                     child: Text("Collaborators", style: TextStyle(
                                //                       decoration: TextDecoration.none,
                                //                       fontFamily: "DM Sans",
                                //                       fontSize: MediaQuery
                                //                           .of(context)
                                //                           .size
                                //                           .height * 0.03,
                                //                       color: mainColor,
                                //                       fontWeight: FontWeight.w600,),)
                                //                 ),
                                //               ],
                                //             ),
                                //
                                //
                                //             //ROW WITH THE NAMES OF COLLABORATORS
                                //             Expanded(
                                //               //padding: const EdgeInsets.only(left: 225.0),
                                //               child: Row(
                                //                 // crossAxisAlignment: CrossAxisAlignment.start,
                                //                 children:
                                //                 List.generate(collaboratorslen, (index) {
                                //                   return Container(
                                //                     margin: EdgeInsets.fromLTRB(MediaQuery
                                //                         .of(context)
                                //                         .size
                                //                         .width * 0.0, MediaQuery
                                //                         .of(context)
                                //                         .size
                                //                         .height * 0.025, 0, 0),
                                //                     child: Container(
                                //                         margin: EdgeInsets.fromLTRB(MediaQuery
                                //                             .of(context)
                                //                             .size
                                //                             .width * 0.025, 0, 0, 0),
                                //                         child: Text(
                                //                           "| ${data['Collaborators'][index]} |",
                                //                           style: TextStyle(
                                //                               decoration: TextDecoration.none,
                                //                               fontFamily: "DM Sans",
                                //                               fontSize: MediaQuery
                                //                                   .of(context)
                                //                                   .size
                                //                                   .height * 0.025,
                                //                               color: mainColor,
                                //                               fontWeight: FontWeight.w400),)
                                //                     ),
                                //                   );
                                //                 }
                                //                 ),
                                //
                                //               ),
                                //             ),
                                //
                                //
                                //             Container(
                                //               margin: EdgeInsets.fromLTRB(0, MediaQuery
                                //                   .of(context)
                                //                   .size
                                //                   .height * 0.02, MediaQuery
                                //                   .of(context)
                                //                   .size
                                //                   .height * 0.025, MediaQuery
                                //                   .of(context)
                                //                   .size
                                //                   .height * 0.045),
                                //               height: MediaQuery
                                //                   .of(context)
                                //                   .size
                                //                   .height * 0.0025,
                                //               width: MediaQuery
                                //                   .of(context)
                                //                   .size
                                //                   .width * 0.50,
                                //               decoration: BoxDecoration(
                                //                 color: mainColor,
                                //                 // border: Border.all(color: mainColor, width: 2.5),
                                //                 borderRadius: new BorderRadius.circular(10),
                                //               ),
                                //             ),
                                //
                                //
                                //             //YOUR PROGRESS HEADING
                                //             Row(
                                //               children: [
                                //                 Container(
                                //                     margin: EdgeInsets.fromLTRB(MediaQuery
                                //                         .of(context)
                                //                         .size
                                //                         .width * 0.275, MediaQuery
                                //                         .of(context)
                                //                         .size
                                //                         .height * 0.025, 0, 0),
                                //                     child: Text("YOUR PROGRESS", style: TextStyle(
                                //                       decoration: TextDecoration.none,
                                //                       fontFamily: "DM Sans",
                                //                       fontSize: MediaQuery
                                //                           .of(context)
                                //                           .size
                                //                           .height * 0.03,
                                //                       color: mainColor,
                                //                       fontWeight: FontWeight.w600,),)
                                //                 ),
                                //               ],
                                //             ),
                                //
                                //             SizedBox(height: 25,),
                                //
                                //             Row(
                                //               children: [
                                //                 Container(
                                //                   width: MediaQuery
                                //                       .of(context)
                                //                       .size
                                //                       .width * 0.255,
                                //                   margin: EdgeInsets.fromLTRB(MediaQuery
                                //                       .of(context)
                                //                       .size
                                //                       .width * 0.0, MediaQuery
                                //                       .of(context)
                                //                       .size
                                //                       .height * 0.01, 0, 0),
                                //                   padding: const EdgeInsets.only(
                                //                       left: 00.0, top: 0.0),
                                //                   child: Column(
                                //                     //crossAxisAlignment: CrossAxisAlignment.start,
                                //                     children:
                                //                     List.generate(taskslen, (index) {
                                //                       if("${data['taskstatuses'][index]}" == "Completed"){
                                //                         completedcounter++;
                                //                       }
                                //                       print("Counter: $completedcounter");
                                //                       percent = (completedcounter/taskslen);
                                //                       percentage = percent*100;
                                //                       print("Percent: $percent");
                                //                       return Text("");
                                //                     }
                                //                     ),
                                //
                                //                   ),
                                //                 ),
                                //
                                //                 //percent = (completedcounter/taskslen) as int;
                                //
                                //
                                //                 // Container(
                                //                 //     child: CircularPercentIndicator(
                                //                 //       radius: 120.0,
                                //                 //       lineWidth: 5.0,
                                //                 //       percent: percent,
                                //                 //       center: Container(width: MediaQuery.of(context).size.width*0.04, height: MediaQuery.of(context).size.height*0.08, child: new Text("$percentage%", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.06, color: mainColor, fontWeight: FontWeight.w600,),)),
                                //                 //       progressColor: mainColor,
                                //                 //     )
                                //                 // ),
                                //               ],
                                //             ),
                                //
                                //             // Row(
                                //             //   children: [
                                //             //     Container(
                                //             //       height: MediaQuery
                                //             //           .of(context)
                                //             //           .size
                                //             //           .height * 0.3,
                                //             //       width: MediaQuery
                                //             //           .of(context)
                                //             //           .size
                                //             //           .width * 0.15,
                                //             //       decoration: BoxDecoration(
                                //             //         border: Border.all(
                                //             //             color: mainColor, width: 2.5),
                                //             //         borderRadius: new BorderRadius.circular(300),
                                //             //       ),
                                //             //       margin: EdgeInsets.fromLTRB(MediaQuery
                                //             //           .of(context)
                                //             //           .size
                                //             //           .width * 0.32, MediaQuery
                                //             //           .of(context)
                                //             //           .size
                                //             //           .height * 0.025, 0, 0),
                                //             //
                                //             //
                                //             //
                                //             //
                                //             // child: Center(
                                //             //   child: Text("33%", style: TextStyle(
                                //             //     decoration: TextDecoration.none,
                                //             //     fontFamily: "DM Sans",
                                //             //     fontSize: MediaQuery
                                //             //         .of(context)
                                //             //         .size
                                //             //         .height * 0.06,
                                //             //     color: mainColor,
                                //             //     fontWeight: FontWeight.w600,),),
                                //             // )
                                //             //
                                //             //     ),
                                //             //   ],
                                //             //
                                //             // ),
                                //
                                //
                                //             SizedBox(height: 50,),
                                //
                                //             Row(
                                //               children: [
                                //                 Container(
                                //                     margin: EdgeInsets.fromLTRB(MediaQuery
                                //                         .of(context)
                                //                         .size
                                //                         .width * 0.075, MediaQuery
                                //                         .of(context)
                                //                         .size
                                //                         .height * 0.015, 0, 0),
                                //                     child: Text("YOUR TASKS", style: TextStyle(
                                //                       decoration: TextDecoration.none,
                                //                       fontFamily: "DM Sans",
                                //                       fontSize: MediaQuery
                                //                           .of(context)
                                //                           .size
                                //                           .height * 0.03,
                                //                       color: mainColor,
                                //                       fontWeight: FontWeight.w600,),)
                                //                 ),
                                //               ],
                                //             ),
                                //
                                //
                                //             Row(
                                //               children: [
                                //                 Container(
                                //                   width: MediaQuery
                                //                       .of(context)
                                //                       .size
                                //                       .width * 0.385,
                                //                   margin: EdgeInsets.fromLTRB(MediaQuery
                                //                       .of(context)
                                //                       .size
                                //                       .width * 0.075, MediaQuery
                                //                       .of(context)
                                //                       .size
                                //                       .height * 0.01, 0, 0),
                                //                   padding: const EdgeInsets.only(
                                //                       left: 00.0, top: 0.0),
                                //                   child: Column(
                                //                     // crossAxisAlignment: CrossAxisAlignment.start,
                                //                     children:
                                //                     List.generate(taskslen, (index) {
                                //
                                //                       // taskstatuses.add("${data['taskstatuses'][index]}");
                                //                       //
                                //                       // print("Status: $taskstatuses");
                                //                       return Container(
                                //                         margin: EdgeInsets.fromLTRB(MediaQuery
                                //                             .of(context)
                                //                             .size
                                //                             .width * 0.00, MediaQuery
                                //                             .of(context)
                                //                             .size
                                //                             .height * 0.025, 0, 0),
                                //                         child: Container(
                                //                             margin: EdgeInsets.fromLTRB(MediaQuery
                                //                                 .of(context)
                                //                                 .size
                                //                                 .width * 0.00, 0, 0, 0),
                                //                             child: Text("Task ${index + 1}: ${data['tasksname'][index]}",
                                //                               style: TextStyle(
                                //                                   decoration: TextDecoration.none,
                                //                                   fontFamily: "DM Sans",
                                //                                   fontSize: MediaQuery
                                //                                       .of(context)
                                //                                       .size
                                //                                       .height * 0.025,
                                //                                   color: Colors.black,
                                //                                   fontWeight: FontWeight.w400),)
                                //                         ),
                                //                       );
                                //                     }
                                //                     ),
                                //
                                //                   ),
                                //                 ),
                                //
                                //                 Container(
                                //                   width: MediaQuery
                                //                       .of(context)
                                //                       .size
                                //                       .width * 0.1,
                                //                   margin: EdgeInsets.fromLTRB(MediaQuery
                                //                       .of(context)
                                //                       .size
                                //                       .width * 0.02, MediaQuery
                                //                       .of(context)
                                //                       .size
                                //                       .height * 0.01, 0, 0),
                                //                   child: Column(
                                //                       // crossAxisAlignment: CrossAxisAlignment.start,
                                //                       children:
                                //                       [
                                //                         Container(
                                //                           child: Column(
                                //                             children: [
                                //                               Container(
                                //                                 width: MediaQuery
                                //                                     .of(context)
                                //                                     .size
                                //                                     .width * 0.55,
                                //
                                //                                 padding: const EdgeInsets.only(
                                //                                     left: 00.0, top: 0.0),
                                //                                 child: Column(
                                //                                   // crossAxisAlignment: CrossAxisAlignment.start,
                                //                                   children:
                                //                                   List.generate(taskslen, (index) {
                                //                                     if("${data['taskstatuses'][index]}" == "Completed"){
                                //                                       concolor = compBack;
                                //                                       textcolor = compFront;
                                //                                       displaystatus = "Completed";
                                //                                     }
                                //                                     else if("${data['taskstatuses'][index]}" == "In Progress"){
                                //                                       concolor = inpBack;
                                //                                       textcolor = inpFront;
                                //                                       displaystatus = "In Progress";
                                //                                     }
                                //                                     else if("${data['taskstatuses'][index]}" == "Pending"){
                                //                                       concolor = pendBack;
                                //                                       textcolor = pendFront;
                                //                                       displaystatus = "Pending";
                                //                                     }
                                //
                                //                                     return Column(
                                //                                         children: [
                                //                                           if ("${data['taskstatuses'][index]}" == "Completed") InkWell(onTap: (){
                                //                                             setState(() {
                                //                                               //status1 = "In Progress";
                                //                                             });},
                                //                                               child: Container(
                                //                                                 margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                                 height: MediaQuery.of(context).size.height * 0.05,
                                //                                                 width: MediaQuery.of(context).size.width * 0.09,
                                //                                                 color: compBack,
                                //                                                 child: Center(child: Text("Completed", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: compFront, fontWeight: FontWeight.w900),),),
                                //                                               )
                                //                                           )
                                //                                           else if ("${data['taskstatuses'][index]}" == "In Progress")
                                //                                             InkWell(
                                //                                                 onTap: (){
                                //                                                   setState(() {
                                //                                                     //status1 = "Pending";
                                //                                                   });},
                                //                                                 child: Container(
                                //                                                   margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                                   height: MediaQuery.of(context).size.height * 0.05,
                                //                                                   width: MediaQuery.of(context).size.width * 0.09,
                                //                                                   color: inpBack,
                                //                                                   child: Center(child: Text("In Progress", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: inpFront, fontWeight: FontWeight.w900),),),
                                //                                                 )
                                //                                             )
                                //                                           else if ("${data['taskstatuses'][index]}" == "Pending")
                                //                                               InkWell(
                                //                                                   onTap: (){
                                //                                                     setState(() {
                                //                                                       //status1 = "Completed";
                                //                                                     });},
                                //                                                   child: Container(
                                //                                                     margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                                     height: MediaQuery.of(context).size.height * 0.05,
                                //                                                     width: MediaQuery.of(context).size.width * 0.09,
                                //                                                     color: pendBack,
                                //                                                     child: Center(child: Text("Pending", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: pendFront, fontWeight: FontWeight.w900),),),
                                //                                                   )
                                //                                               ),
                                //
                                //                                         ]
                                //                                     );
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //                                     // return Column(
                                //                                     //   children: [
                                //                                     //     Container(
                                //                                     //       margin: EdgeInsets.fromLTRB(MediaQuery
                                //                                     //           .of(context)
                                //                                     //           .size
                                //                                     //           .width * 0.00, MediaQuery
                                //                                     //           .of(context)
                                //                                     //           .size
                                //                                     //           .height * 0.025, 0, 0),
                                //                                     //       child: Container(
                                //                                     //         width: MediaQuery.of(context).size.width,
                                //                                     //         height: MediaQuery.of(context).size.height*0.05,
                                //                                     //           margin: EdgeInsets.fromLTRB(MediaQuery
                                //                                     //               .of(context)
                                //                                     //               .size
                                //                                     //               .width * 0.00, 0, 0, 0),
                                //                                     //         decoration: BoxDecoration(
                                //                                     //           color: concolor,
                                //                                     //         ),
                                //                                     //           child: Center(
                                //                                     //             child: Text("$displaystatus",
                                //                                     //             style: TextStyle(
                                //                                     //                 decoration: TextDecoration.none,
                                //                                     //                 fontFamily: "DM Sans",
                                //                                     //                 fontSize: MediaQuery
                                //                                     //                     .of(context)
                                //                                     //                     .size
                                //                                     //                     .height * 0.025,
                                //                                     //                 color: textcolor,
                                //                                     //                 fontWeight: FontWeight.w400),),
                                //                                     //           ),
                                //                                     //       ),
                                //                                     //     ),
                                //                                     //   ],
                                //                                     // );
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //
                                //                                   }
                                //                                   ),
                                //
                                //                                 ),
                                //                               ),
                                //
                                //                               Container(
                                //                                 width: MediaQuery
                                //                                     .of(context)
                                //                                     .size
                                //                                     .width * 0.1,
                                //                                 margin: EdgeInsets.fromLTRB(MediaQuery
                                //                                     .of(context)
                                //                                     .size
                                //                                     .width * 0.02, MediaQuery
                                //                                     .of(context)
                                //                                     .size
                                //                                     .height * 0.01, 0, 0),
                                //                                 child: Column(
                                //                                     crossAxisAlignment: CrossAxisAlignment.start,
                                //                                     children:
                                //                                     [
                                //                                       Container(
                                //                                         child: Column(
                                //
                                //                                         ),
                                //
                                //
                                //                                         // child: Column(
                                //                                         //     children: [
                                //                                         //       if (status1 == "Completed") InkWell(onTap: (){
                                //                                         //         setState(() {
                                //                                         //         //status1 = "In Progress";
                                //                                         //       });},
                                //                                         //       child: Container(
                                //                                         //           margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                         //           height: MediaQuery.of(context).size.height * 0.05,
                                //                                         //           width: MediaQuery.of(context).size.width * 0.09,
                                //                                         //           color: compBack,
                                //                                         //         child: Center(child: Text("Completed", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: compFront, fontWeight: FontWeight.w900),),),
                                //                                         //       )
                                //                                         //       )
                                //                                         //       else if (status1 == "In Progress")
                                //                                         //       InkWell(
                                //                                         //           onTap: (){
                                //                                         //             setState(() {
                                //                                         //         //status1 = "Pending";
                                //                                         //       });},
                                //                                         //           child: Container(
                                //                                         //               margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                         //               height: MediaQuery.of(context).size.height * 0.05,
                                //                                         //               width: MediaQuery.of(context).size.width * 0.09,
                                //                                         //             color: inpBack,
                                //                                         //             child: Center(child: Text("In Progress", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: inpFront, fontWeight: FontWeight.w900),),),
                                //                                         //           )
                                //                                         //       )
                                //                                         //       else if (status1 == "Pending")
                                //                                         //           InkWell(
                                //                                         //               onTap: (){
                                //                                         //                 setState(() {
                                //                                         //                   //status1 = "Completed";
                                //                                         //                 });},
                                //                                         //               child: Container(
                                //                                         //                   margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                         //                   height: MediaQuery.of(context).size.height * 0.05,
                                //                                         //                   width: MediaQuery.of(context).size.width * 0.09,
                                //                                         //                   color: pendBack,
                                //                                         //                 child: Center(child: Text("Pending", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: pendFront, fontWeight: FontWeight.w900),),),
                                //                                         //               )
                                //                                         //           ),
                                //                                         //
                                //                                         //
                                //                                         //       if (status2 == "Completed") InkWell(onTap: (){setState(() {
                                //                                         //         status2 = "In Progress";
                                //                                         //       });},
                                //                                         //           child: Container(
                                //                                         //             margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                         //             height: MediaQuery.of(context).size.height * 0.05,
                                //                                         //             width: MediaQuery.of(context).size.width * 0.09,
                                //                                         //             color: compBack,
                                //                                         //             child: Center(child: Text("Completed", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: compFront, fontWeight: FontWeight.w900),),),
                                //                                         //           )
                                //                                         //       )
                                //                                         //       else if (status2 == "In Progress")
                                //                                         //         InkWell(
                                //                                         //             onTap: (){
                                //                                         //               setState(() {
                                //                                         //                 status2 = "Pending";
                                //                                         //               });},
                                //                                         //             child: Container(
                                //                                         //               margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                         //               height: MediaQuery.of(context).size.height * 0.05,
                                //                                         //               width: MediaQuery.of(context).size.width * 0.09,
                                //                                         //               color: inpBack,
                                //                                         //               child: Center(child: Text("In Progress", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: inpFront, fontWeight: FontWeight.w900),),),
                                //                                         //             )
                                //                                         //         )
                                //                                         //       else if (status2 == "Pending")
                                //                                         //           InkWell(
                                //                                         //               onTap: (){
                                //                                         //                 setState(() {
                                //                                         //                   //status1 = "Completed";
                                //                                         //                   status2 = "Completed";
                                //                                         //                 });},
                                //                                         //               child: Container(
                                //                                         //                 margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                         //                 height: MediaQuery.of(context).size.height * 0.05,
                                //                                         //                 width: MediaQuery.of(context).size.width * 0.09,
                                //                                         //                 color: pendBack,
                                //                                         //                 child: Center(child: Text("Pending", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: pendFront, fontWeight: FontWeight.w900),),),
                                //                                         //               )
                                //                                         //           ),
                                //                                         //
                                //                                         //
                                //                                         //       if (status3 == "Completed") InkWell(onTap: (){setState(() {
                                //                                         //         status3 = "In Progress";
                                //                                         //       });},
                                //                                         //           child: Container(
                                //                                         //             margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                         //             height: MediaQuery.of(context).size.height * 0.05,
                                //                                         //             width: MediaQuery.of(context).size.width * 0.09,
                                //                                         //             color: compBack,
                                //                                         //             child: Center(child: Text("Completed", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: compFront, fontWeight: FontWeight.w900),),),
                                //                                         //           )
                                //                                         //       )
                                //                                         //       else if (status3 == "In Progress")
                                //                                         //         InkWell(
                                //                                         //             onTap: (){
                                //                                         //               setState(() {
                                //                                         //                 //status1 = "Completed";
                                //                                         //                 status3 = "Pending";
                                //                                         //               });},
                                //                                         //             child: Container(
                                //                                         //               margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                         //               height: MediaQuery.of(context).size.height * 0.05,
                                //                                         //               width: MediaQuery.of(context).size.width * 0.09,
                                //                                         //               color: inpBack,
                                //                                         //               child: Center(child: Text("In Progress", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: inpFront, fontWeight: FontWeight.w900),),),
                                //                                         //             )
                                //                                         //         )
                                //                                         //       else if (status3 == "Pending")
                                //                                         //           InkWell(
                                //                                         //               onTap: (){
                                //                                         //                 setState(() {
                                //                                         //                   status3 = "Completed";
                                //                                         //                 });},
                                //                                         //               child: Container(
                                //                                         //                 margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                                         //                 height: MediaQuery.of(context).size.height * 0.05,
                                //                                         //                 width: MediaQuery.of(context).size.width * 0.09,
                                //                                         //                 color: pendBack,
                                //                                         //                 child: Center(child: Text("Pending", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: pendFront, fontWeight: FontWeight.w900),),),
                                //                                         //               )
                                //                                         //           ),
                                //                                         //
                                //                                         //
                                //                                         //     ]
                                //                                         //
                                //                                         // ),
                                //                                       )
                                //                                     ]
                                //
                                //
                                //                                 ),
                                //                               ),
                                //                             ],
                                //                           ),
                                //                           // child: Column(
                                //                           //     children: [
                                //                           //       if (status1 == "Completed") InkWell(onTap: (){
                                //                           //         setState(() {
                                //                           //         //status1 = "In Progress";
                                //                           //       });},
                                //                           //       child: Container(
                                //                           //           margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                           //           height: MediaQuery.of(context).size.height * 0.05,
                                //                           //           width: MediaQuery.of(context).size.width * 0.09,
                                //                           //           color: compBack,
                                //                           //         child: Center(child: Text("Completed", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: compFront, fontWeight: FontWeight.w900),),),
                                //                           //       )
                                //                           //       )
                                //                           //       else if (status1 == "In Progress")
                                //                           //       InkWell(
                                //                           //           onTap: (){
                                //                           //             setState(() {
                                //                           //         //status1 = "Pending";
                                //                           //       });},
                                //                           //           child: Container(
                                //                           //               margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                           //               height: MediaQuery.of(context).size.height * 0.05,
                                //                           //               width: MediaQuery.of(context).size.width * 0.09,
                                //                           //             color: inpBack,
                                //                           //             child: Center(child: Text("In Progress", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: inpFront, fontWeight: FontWeight.w900),),),
                                //                           //           )
                                //                           //       )
                                //                           //       else if (status1 == "Pending")
                                //                           //           InkWell(
                                //                           //               onTap: (){
                                //                           //                 setState(() {
                                //                           //                   //status1 = "Completed";
                                //                           //                 });},
                                //                           //               child: Container(
                                //                           //                   margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                           //                   height: MediaQuery.of(context).size.height * 0.05,
                                //                           //                   width: MediaQuery.of(context).size.width * 0.09,
                                //                           //                   color: pendBack,
                                //                           //                 child: Center(child: Text("Pending", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: pendFront, fontWeight: FontWeight.w900),),),
                                //                           //               )
                                //                           //           ),
                                //                           //
                                //                           //
                                //                           //       if (status2 == "Completed") InkWell(onTap: (){setState(() {
                                //                           //         status2 = "In Progress";
                                //                           //       });},
                                //                           //           child: Container(
                                //                           //             margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                           //             height: MediaQuery.of(context).size.height * 0.05,
                                //                           //             width: MediaQuery.of(context).size.width * 0.09,
                                //                           //             color: compBack,
                                //                           //             child: Center(child: Text("Completed", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: compFront, fontWeight: FontWeight.w900),),),
                                //                           //           )
                                //                           //       )
                                //                           //       else if (status2 == "In Progress")
                                //                           //         InkWell(
                                //                           //             onTap: (){
                                //                           //               setState(() {
                                //                           //                 status2 = "Pending";
                                //                           //               });},
                                //                           //             child: Container(
                                //                           //               margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                           //               height: MediaQuery.of(context).size.height * 0.05,
                                //                           //               width: MediaQuery.of(context).size.width * 0.09,
                                //                           //               color: inpBack,
                                //                           //               child: Center(child: Text("In Progress", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: inpFront, fontWeight: FontWeight.w900),),),
                                //                           //             )
                                //                           //         )
                                //                           //       else if (status2 == "Pending")
                                //                           //           InkWell(
                                //                           //               onTap: (){
                                //                           //                 setState(() {
                                //                           //                   //status1 = "Completed";
                                //                           //                   status2 = "Completed";
                                //                           //                 });},
                                //                           //               child: Container(
                                //                           //                 margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                           //                 height: MediaQuery.of(context).size.height * 0.05,
                                //                           //                 width: MediaQuery.of(context).size.width * 0.09,
                                //                           //                 color: pendBack,
                                //                           //                 child: Center(child: Text("Pending", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: pendFront, fontWeight: FontWeight.w900),),),
                                //                           //               )
                                //                           //           ),
                                //                           //
                                //                           //
                                //                           //       if (status3 == "Completed") InkWell(onTap: (){setState(() {
                                //                           //         status3 = "In Progress";
                                //                           //       });},
                                //                           //           child: Container(
                                //                           //             margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                           //             height: MediaQuery.of(context).size.height * 0.05,
                                //                           //             width: MediaQuery.of(context).size.width * 0.09,
                                //                           //             color: compBack,
                                //                           //             child: Center(child: Text("Completed", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: compFront, fontWeight: FontWeight.w900),),),
                                //                           //           )
                                //                           //       )
                                //                           //       else if (status3 == "In Progress")
                                //                           //         InkWell(
                                //                           //             onTap: (){
                                //                           //               setState(() {
                                //                           //                 //status1 = "Completed";
                                //                           //                 status3 = "Pending";
                                //                           //               });},
                                //                           //             child: Container(
                                //                           //               margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                           //               height: MediaQuery.of(context).size.height * 0.05,
                                //                           //               width: MediaQuery.of(context).size.width * 0.09,
                                //                           //               color: inpBack,
                                //                           //               child: Center(child: Text("In Progress", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: inpFront, fontWeight: FontWeight.w900),),),
                                //                           //             )
                                //                           //         )
                                //                           //       else if (status3 == "Pending")
                                //                           //           InkWell(
                                //                           //               onTap: (){
                                //                           //                 setState(() {
                                //                           //                   status3 = "Completed";
                                //                           //                 });},
                                //                           //               child: Container(
                                //                           //                 margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, 0),
                                //                           //                 height: MediaQuery.of(context).size.height * 0.05,
                                //                           //                 width: MediaQuery.of(context).size.width * 0.09,
                                //                           //                 color: pendBack,
                                //                           //                 child: Center(child: Text("Pending", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height * 0.02, color: pendFront, fontWeight: FontWeight.w900),),),
                                //                           //               )
                                //                           //           ),
                                //                           //
                                //                           //
                                //                           //     ]
                                //                           //
                                //                           // ),
                                //                         )
                                //                       ]
                                //
                                //
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //
                                //
                                //             SizedBox(height: 100,),
                                //
                                //
                                //           ],
                                //         ),
                                //
                                //
                                //       ),
                                //
                                //
                                //
                                //     ],
                                //   ),
                                // ),
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
