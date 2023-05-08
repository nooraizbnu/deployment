import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import '../headerfooter/footer.dart';
import '../headerfooter/headerpostsignin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'editpage.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: const FirebaseOptions(
//     apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
//     projectId: "fir-authentication-ef41b",
//     messagingSenderId: "712311594484",
//     appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
//     storageBucket: "fir-authentication-ef41b.appspot.com",
//   ));
//   runApp( AllPostsProgress());
// }

class AllPostsProgress extends StatefulWidget {
  final String documentId;

  AllPostsProgress({required this.documentId});

  @override
  State<AllPostsProgress> createState() =>
      _AllPostsProgressState(documentId: documentId);
}

class _AllPostsProgressState extends State<AllPostsProgress> {
  final String documentId;

  _AllPostsProgressState({required this.documentId});

  final user = FirebaseAuth.instance.currentUser;

  @override
  double percent = 0;

  Widget build(BuildContext context) {
    var mainColor = Color(0xFF5364B8);
    var secondaryColor = Color(0xFF7886CB);
    print("Document: $documentId");

    CollectionReference posts = FirebaseFirestore.instance.collection("posts");

    return SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot>(
                future: posts.doc(documentId).get(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    var collaboratorsArray = data["CollaboratorsEmail"];
                    if(collaboratorsArray.contains(user!.email!)){
                      var taskslen = data['tasksname'].length;
                      print("taskslen $taskslen");
                      var collaboratorslen = data['Collaborators'].length;
                      print("collaboratorslen $collaboratorslen");
                      var taskstatuses = data['taskstatuses'].length;
                      var completedTasks = 0;
                      for(int i = 0; i< taskslen; i++){
                        if(data['taskstatuses'][i]=="Completed"){
                          completedTasks += 1;
                        }
                      }
                      percent = completedTasks/taskslen;
                      print(percent);
                      print("Completed Tasks: $completedTasks");
                      var percentText = (percent*100).toStringAsFixed(1);
                      print("Text Percent $percentText");

                      return Container(
                        child: Column(
                          children: [

                            Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              margin: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.175,
                                  0,
                                  0,
                                  MediaQuery.of(context).size.height * 0.0175),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.5),
                                  border: Border.all(
                                    color: mainColor,
                                    width: 2.5,
                                  )),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.height *
                                            0.015),
                                    child: Text(
                                      data["projectname"],
                                      style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.height *
                                                  0.02,
                                          color: mainColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width *
                                            0.05),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Collaborators: ${data["Collaborators"].length}",
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                  color: mainColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.015),
                                              child: Text(
                                                "Your Tasks: ${data["tasksname"].length}",
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02,
                                                    color: mainColor,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05),
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7.5),
                                              border: Border.all(
                                                color: mainColor,
                                                width: 1,
                                              )),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.015),
                                              child: Text(
                                                "Your Progress: ",
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02,
                                                    color: mainColor,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            LinearPercentIndicator(
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
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.height *
                                            0.02),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SProgress2(documentId: documentId,)));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: mainColor, // Background color
                                        ),
                                        child: Text("View Progress")),
                                  )
                                ],
                              ),
                            ),

                            // footer(),
                          ],
                        ),
                      );
                  }
                  //return Text("Fetching Data from Database..");
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                )),
          ),
        );
  }
}
