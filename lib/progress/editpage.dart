import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../headerfooter/footer.dart';
import '../headerfooter/headerpostsignin.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SProgress2 extends StatefulWidget {
  final String documentId;
  final Map<String, dynamic> ticketsData;
  SProgress2({required this.documentId, required this.ticketsData});

  @override
  State<SProgress2> createState() => _SProgress2State(documentId: documentId, ticketsData: ticketsData);
}

class _SProgress2State extends State<SProgress2> {
  final String documentId;
  final Map<String, dynamic> ticketsData;
  _SProgress2State({required this.documentId, required this.ticketsData});

  @override
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

    var taskscompleted = 0;

    CollectionReference users = FirebaseFirestore.instance.collection("posts");

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(documentId).get(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
                      var taskslen = ticketsData['tasksname'].length;
                      var collaboratorslen = data['Collaborators'].length;
                      List taskstatus = ticketsData['taskstatuses'];
                      var taskstatuses = ticketsData['taskstatuses'].length;
                      var completedTasks = 0;
                      for(int i = 0; i< taskslen; i++){
                        if(ticketsData['taskstatuses'][i]=="Completed"){
                          completedTasks += 1;
                          taskscompleted += 1;
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
                                            child: Text("${ticketsData['projectname']}",
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
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "| ${data['Collaborators'][index]} |",
                                                    style: TextStyle(
                                                        decoration: TextDecoration.none,
                                                        fontFamily: "DM Sans",
                                                        fontSize: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height * 0.025,
                                                        color: mainColor,
                                                        fontWeight: FontWeight.w400),),
                                                ],
                                              )
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
                                                      child: Text("${ticketsData['tasksname'][index]}: ${ticketsData['tasksdescription'][index]}",
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
                                                          if("${ticketsData['taskstatuses'][index]}" == "Pending"){
                                                            taskstatus[index] = "In Progress";
                                                            print("Status of Tasks: $taskstatus");
                                                            DocumentReference docRef = FirebaseFirestore.instance.collection("tickets").doc(documentId+FirebaseAuth.instance.currentUser!.uid);
                                                            //DocumentSnapshot doc = await docRef.get();
                                                            docRef.update({
                                                              "taskstatuses": taskstatus,
                                                            });

                                                          }
                                                          else if("${ticketsData['taskstatuses'][index]}" == "In Progress"){
                                                            taskstatus[index] = "Completed";
                                                            // if("${ticketsData['taskstatuses'][index]}" == "Completed"){
                                                            //   // for(int i = 0; i < taskslen; i++){
                                                            //   //   if("${data['taskstatuses'][i]}" == "Completed"){
                                                            //   //     taskscompleted += 1;
                                                            //   //   }
                                                            //   // }
                                                            //   if(taskscompleted == taskslen){
                                                            //     DocumentReference docRef = FirebaseFirestore.instance.collection("tickets").doc(documentId+FirebaseAuth.instance.currentUser!.uid);
                                                            //     //DocumentSnapshot doc = await docRef.get();
                                                            //     docRef.update({
                                                            //       "ProjectStatus": "Completed",
                                                            //     });
                                                            //   }
                                                            //   else{
                                                            //     DocumentReference docRef = FirebaseFirestore.instance.collection("tickets").doc(documentId+FirebaseAuth.instance.currentUser!.uid);
                                                            //     //DocumentSnapshot doc = await docRef.get();
                                                            //     docRef.update({
                                                            //       "ProjectStatus": "In Progress",
                                                            //     });
                                                            //   }
                                                            // }
                                                            print("Status of Tasks: $taskstatus");
                                                            DocumentReference docRef = FirebaseFirestore.instance.collection("tickets").doc(documentId+FirebaseAuth.instance.currentUser!.uid);
                                                            //DocumentSnapshot doc = await docRef.get();
                                                            docRef.update({
                                                              "taskstatuses": taskstatus,
                                                            });
                                                          }
                                                          else if("${ticketsData['taskstatuses'][index]}" == "Completed"){
                                                            taskstatus[index] = "Pending";
                                                            print("Status of Tasks: $taskstatus");
                                                            DocumentReference docRef = FirebaseFirestore.instance.collection("tickets").doc(documentId+FirebaseAuth.instance.currentUser!.uid);
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
                    return Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15,left: MediaQuery.of(context).size.width*0.5),
                      child: CircularProgressIndicator(),
                    );
                  })),
            ),
            ),
        );

  }


}


