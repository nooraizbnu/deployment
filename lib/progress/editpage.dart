import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../headerfooter/footer.dart';
import '../headerfooter/headerpostsignin.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SProgress2 extends StatefulWidget {
  final String documentId;
  SProgress2({required this.documentId});

  @override
  State<SProgress2> createState() => _SProgress2State(documentId: documentId);
}

class _SProgress2State extends State<SProgress2> {
  final String documentId;
  _SProgress2State({required this.documentId});

  @override
// List <String>statuses = ["Completed", "In Progress", "Pending"];
  var concolor = Color(0xBBBBC100);
  var textcolor = Color(0xBBBBC100);

  Widget build(BuildContext context) {
    var mainColor = Color(0xFF5364B8);
    var secondaryColor = Color(0xFF7886CB);
    print("Document: $documentId");
    var compBack = Color(0xFF71FF99);
    var compFront = Color(0xFF2FB856);

    var inpBack = Color(0xFFFCFF98);
    var inpFront = Color(0xFFBEC300);

    var pendBack = Color(0xFFFF9292);
    var pendFront = Color(0xFFFF1919);

    var activeFront;
    var activeBack;

    CollectionReference users = FirebaseFirestore.instance.collection("posts");
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(documentId).get(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
                      var taskslen = data['tasksname'].length;
                      var collaboratorslen = data['Collaborators'].length;
                      List taskstatus = data['taskstatuses'];
                      var taskstatuses = data['taskstatuses'].length;
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

                      return Container(
                        child: Column(
                          children: [

                            headerpostsu(),

                            Center(
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.00, MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.1, 0, 0),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.15,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: mainColor,
                                      border: Border.all(
                                        color: mainColor,
                                        width: 2.5,
                                      )
                                  ),
                                  child: Center(child: Text("PROGRESS", style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: "DM Sans",
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,),))
                              ),
                            ),


                            Container(
                              margin: EdgeInsets.only(left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.00, top: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.1),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.65,
                              //height: 1300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: mainColor,
                                    width: 2.5,
                                  )
                              ),

                              child: Column(
                                children: [
                                  Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.19, MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.05, 0, 0),
                                            child: Text("${data['projectname']}",
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontFamily: "DM Sans",
                                                fontSize: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.05,
                                                color: mainColor,
                                                fontWeight: FontWeight.w500,),)
                                        ),
                                      ]
                                  ),

                                  SizedBox(height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.025,),

                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.fromLTRB(MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.28, MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.025, 0, 0),
                                          child: Text("Collaborators", style: TextStyle(
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


                                  //ROW WITH THE NAMES OF COLLABORATORS
                                  Container(
                                    padding: const EdgeInsets.only(left: 225.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:
                                      List.generate(collaboratorslen, (index) {
                                        var temp = "asdf |" + "asdf";
                                        return Container(
                                          margin: EdgeInsets.fromLTRB(MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.0, MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.025, 0, 0),
                                          child: Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.025, 0, 0, 0),
                                              child: Text(
                                                "| ${data['Collaborators'][index]} |",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: "DM Sans",
                                                    fontSize: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height * 0.025,
                                                    color: mainColor,
                                                    fontWeight: FontWeight.w400),)
                                          ),
                                        );
                                      }
                                      ),

                                    ),
                                  ),


                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.02, MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.025, MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.045),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.0025,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.50,
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      // border: Border.all(color: mainColor, width: 2.5),
                                      borderRadius: new BorderRadius.circular(10),
                                    ),
                                  ),


                                  //YOUR PROGRESS HEADING
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

                                  // Row(
                                  //   children: [
                                  //     // Container(
                                  //     //   width: MediaQuery
                                  //     //       .of(context)
                                  //     //       .size
                                  //     //       .width * 0.255,
                                  //     //   margin: EdgeInsets.fromLTRB(MediaQuery
                                  //     //       .of(context)
                                  //     //       .size
                                  //     //       .width * 0.0, MediaQuery
                                  //     //       .of(context)
                                  //     //       .size
                                  //     //       .height * 0.01, 0, 0),
                                  //     //   padding: const EdgeInsets.only(
                                  //     //       left: 00.0, top: 0.0),
                                  //     //   child: Column(
                                  //     //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     //     children:
                                  //     //     List.generate(taskslen, (index) {
                                  //     //       if("${data['taskstatuses'][index]}" == "Completed"){
                                  //     //         completedcounter++;
                                  //     //       }
                                  //     //       //print("Counter: $completedcounter");
                                  //     //       //percent = (completedcounter/taskslen);
                                  //     //       //percentage = percent*100;
                                  //     //       //print("Percent: $percent");
                                  //     //       return Text("");
                                  //     //     }
                                  //     //     ),
                                  //     //
                                  //     //   ),
                                  //     // ),
                                  //
                                  //     //percent = (completedcounter/taskslen) as int;
                                  //
                                  //
                                  //     Column(
                                  //         children: []
                                  //     ),
                                  //   ],
                                  // ),
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

                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //       height: MediaQuery
                                  //           .of(context)
                                  //           .size
                                  //           .height * 0.3,
                                  //       width: MediaQuery
                                  //           .of(context)
                                  //           .size
                                  //           .width * 0.15,
                                  //       decoration: BoxDecoration(
                                  //         border: Border.all(
                                  //             color: mainColor, width: 2.5),
                                  //         borderRadius: new BorderRadius.circular(300),
                                  //       ),
                                  //       margin: EdgeInsets.fromLTRB(MediaQuery
                                  //           .of(context)
                                  //           .size
                                  //           .width * 0.32, MediaQuery
                                  //           .of(context)
                                  //           .size
                                  //           .height * 0.025, 0, 0),
                                  //
                                  //
                                  //
                                  //
                                  // child: Center(
                                  //   child: Text("33%", style: TextStyle(
                                  //     decoration: TextDecoration.none,
                                  //     fontFamily: "DM Sans",
                                  //     fontSize: MediaQuery
                                  //         .of(context)
                                  //         .size
                                  //         .height * 0.06,
                                  //     color: mainColor,
                                  //     fontWeight: FontWeight.w600,),),
                                  // )
                                  //
                                  //     ),
                                  //   ],
                                  //
                                  // ),


                                  SizedBox(height: 50,),

                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.fromLTRB(MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.075, MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.015, 0, 0),
                                          child: Text("YOUR TASKS", style: TextStyle(
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


                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.555,
                                        margin: EdgeInsets.fromLTRB(MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.075, MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.01, 0, 0),
                                        padding: const EdgeInsets.only(
                                            left: 00.0, top: 0.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:
                                          List.generate(taskslen, (index) {
                                            return Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * 0.00, 0, 0, 0),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(bottom: 10.0),
                                                      child: Text("${data['tasksname'][index]}: ${data['tasksdescription'][index]}",
                                                        style: TextStyle(
                                                            decoration: TextDecoration.none,
                                                            fontFamily: "DM Sans",
                                                            fontSize: MediaQuery
                                                                .of(context)
                                                                .size
                                                                .height * 0.025,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w400),),
                                                    )
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2),
                                                  child: ElevatedButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          if("${data['taskstatuses'][index]}" == "Pending"){
                                                            taskstatus[index] = "In Progress";
                                                            print("Status of Tasks: $taskstatus");
                                                            DocumentReference docRef = FirebaseFirestore.instance.collection("posts").doc(documentId);
                                                            //DocumentSnapshot doc = await docRef.get();
                                                            docRef.update({
                                                              "taskstatuses": taskstatus,
                                                            });

                                                          }
                                                          else if("${data['taskstatuses'][index]}" == "In Progress"){
                                                            taskstatus[index] = "Completed";
                                                            print("Status of Tasks: $taskstatus");
                                                            DocumentReference docRef = FirebaseFirestore.instance.collection("posts").doc(documentId);
                                                            //DocumentSnapshot doc = await docRef.get();
                                                            docRef.update({
                                                              "taskstatuses": taskstatus,
                                                            });
                                                          }
                                                          else if("${data['taskstatuses'][index]}" == "Completed"){
                                                            taskstatus[index] = "Pending";
                                                            print("Status of Tasks: $taskstatus");
                                                            DocumentReference docRef = FirebaseFirestore.instance.collection("posts").doc(documentId);
                                                            //DocumentSnapshot doc = await docRef.get();
                                                            docRef.update({
                                                              "taskstatuses": taskstatus,
                                                            });
                                                          }
                                                        });
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: "${taskstatus[index]}" == "Completed" ? compBack : "${taskstatus[index]}" == "In Progress" ? inpBack : pendBack, // Background color
                                                  ),
                                                  child: Text("${taskstatus[index]}", style: TextStyle(color: "${taskstatus[index]}" == "Completed" ? compFront : "${taskstatus[index]}" == "In Progress" ? inpFront : pendFront),)
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          ),

                                        ),
                                      ),

                                    ],
                                  ),


                                  SizedBox(height: 100,),


                                ],
                              ),


                            ),


                            footer(),

                          ],
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  })),
            ),
            ),
        );

  }


}


