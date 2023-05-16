import 'package:flutter/material.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpostsignin.dart';
import 'package:procollab_web/tasks/taskshome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../CRUD/services/firebase_crud.dart';
import '../allposts/posts.dart';

class Agreement extends StatefulWidget {
  final String documentId;
  final String email;
  final String projectName;
  final String name;
  final String area;

  Agreement({required this.documentId, required this.email, required this.projectName, required this.name, required this.area});


  @override
  State<Agreement> createState() => _AgreementState(documentId: documentId, email: email, projectName: projectName, name: name, area: area);
}

class _AgreementState extends State<Agreement> {
  final String documentId;
  final String email;
  final String projectName;
  final String name;
  final String area;

  _AgreementState({required this.documentId, required this.email, required this.projectName, required this.name, required this.area});

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";

  CollectionReference users = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
                child: SingleChildScrollView(
                  child: FutureBuilder<DocumentSnapshot>(
                    future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
                    builder: ((context, snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                        return  Container(
                          color: Colors.white,
                          child: Row(
                            children: [


                              Column(
                                children: [

                                  // headerpostsu(),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 75, left: 300),
                                        height: MediaQuery.of(context).size.height*0.13,
                                        width: MediaQuery.of(context).size.width*0.65,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(child: Text("TERMS & CONDITIONS",style: TextStyle(decoration: TextDecoration.none,fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: Colors.white),)),
                                      ),

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 50, left: 300),
                                            padding: const EdgeInsets.only(bottom: 50),
                                            //height: MediaQuery.of(context).size.height*1.5,
                                            width: MediaQuery.of(context).size.width*0.65,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: secondaryColor,
                                                  width: 3,
                                                )
                                            ),
                                            child:  Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.4, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text("Collaboration Agreement",style: TextStyle(decoration: TextDecoration.none,fontSize:35,color: mainColor,fontWeight: FontWeight.bold,fontFamily: fontFam)),

                                                    ),
                                                  ],

                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context).size.height*0.025,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      //alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.2, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text("I agree to collaborate with other members in order to create the selected project.",style: TextStyle(decoration: TextDecoration.none,fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.5, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text("COMPLETION DATE:  ",style: TextStyle(decoration: TextDecoration.none,fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],

                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      //alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text("It is contemplated that the work will be completed no later than the mentioned completion date.\n"
                                                          "Collaborators must complete contributions by the dates included in the attached schedule or outline.\n If a Collaborator fails to do so, the Collaborators will mutually agree, in writing, whether to extend time \n for the project or take action against the collaborator.",style: TextStyle(decoration: TextDecoration.none,fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.4, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text("LEAVING THE COLLABORATION: ",style: TextStyle(decoration: TextDecoration.none,fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],

                                                ),

                                                Row(
                                                  children: [
                                                    Container(
                                                      //alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text(" If a Collaborator is unwilling to continue or complete work on the work, the Collaborators shall enter \n  into a written agreement setting forth the rights of the withdrawing Collaborator, including  what \n  authorship credit, compensation and copyright ownership, if any, shall be shared with the withdrawing\n collaborator. The remaining Collaborator shall have the right to complete the work alone or with others.",style: TextStyle(decoration: TextDecoration.none,fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.45, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text("COPYRIGHT OWNERSHIP:  ",style: TextStyle(decoration: TextDecoration.none,fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],

                                                ),

                                                Row(
                                                  children: [
                                                    Container(
                                                      //alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text(" Collaborators intend that the completed work shall be a joint work.\n Upon completion all the Collaborators shall be the owners of the all the work done.",style: TextStyle(decoration: TextDecoration.none,fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.52, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text("DECISION MAKING:  ",style: TextStyle(decoration: TextDecoration.none,fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],

                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      //alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text(" All editorial, business and other decisions affecting the work shall be made jointly by all the\nCollaborators, and no sale, disposition, licensing or other agreement with a third party shall be valid \nwithout the written consent of all the Collaborators.",style: TextStyle(decoration: TextDecoration.none,fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.52, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text("PLATFORM RULES:  ",style: TextStyle(decoration: TextDecoration.none,fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],

                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      //alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text(" You may not promote violence against or directly attack or threaten other people on the basis of race,\nethnicity, national origin, caste, sexual orientation, gender, gender identity, religious affiliation, age, \ndisability, or serious disease. We also do not allow accounts whose primary purpose is inciting harm \ntowards others on the basis of these categories.",style: TextStyle(decoration: TextDecoration.none,fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context).size.height*0.05,
                                                ),

                                                Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.45, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                      height: MediaQuery.of(context).size.height*0.04,
                                                      width: MediaQuery.of(context).size.width*0.05,
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xFFF7F8FB),
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:  Border.all(width: 1, color: mainColor),
                                                      ),
                                                      child: Center(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> PostsMain()));
                                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskHome(documentId: documentId)));
                                                          },
                                                          child: const Text(
                                                            "Decline",
                                                            style: TextStyle(decoration: TextDecoration.none,fontSize: 13, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w400),
                                                          ),

                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                      height: MediaQuery.of(context).size.height*0.04,
                                                      width: MediaQuery.of(context).size.width*0.05,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: Center(
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            showDialog(context: context,
                                                                builder: (context){
                                                                  return AlertDialog(
                                                                    title: Text("Your request to be a contributor for this project has been acknowledged,\t You will be able to proceed after the Collaborator accepts your request"),
                                                                  );

                                                                });
                                                            Future<bool> checkIfDocExists(String docId) async {
                                                              try {
                                                                // Get reference to Firestore collection
                                                                var collectionRef = FirebaseFirestore.instance.collection('contributorrequest');

                                                                var doc = await collectionRef.doc(docId).get();
                                                                return doc.exists;
                                                              } catch (e) {
                                                                throw e;
                                                              }
                                                            }
                                                            /// Check If Document Exists
                                                            bool docExists = await checkIfDocExists(documentId);
                                                            print("Document exists in Firestore? " + docExists.toString());

                                                            final snapshot = await FirebaseFirestore.instance
                                                                .collection('contributorrequest').get();

                                                            if ( snapshot.size == 0 ) {
                                                              await FirebaseCrud.addContributor(
                                                                projectId: documentId,
                                                                contributorId: FirebaseAuth.instance.currentUser!.uid,
                                                                email: email,
                                                                projectName: projectName,
                                                              );
                                                            }
                                                            else if(docExists == false){
                                                              await FirebaseCrud.addContributor(
                                                                projectId: documentId,
                                                                contributorId: FirebaseAuth.instance.currentUser!.uid,
                                                                email: email,
                                                                projectName: projectName,
                                                              );
                                                            }
                                                            else{
                                                              DocumentReference docRef = FirebaseFirestore.instance.collection("contributorrequest").doc(documentId);
                                                              //DocumentSnapshot doc = await docRef.get();
                                                              docRef.update({
                                                                "contributors": FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
                                                                "email": email,
                                                                "projectName": projectName,
                                                              });
                                                            }
                                                          },
                                                          child: const Text(
                                                            "Accept",
                                                            style: TextStyle(decoration: TextDecoration.none,fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                                          ),

                                                        ),
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

                                  // footer(),

                                ],
                              ),

                            ],
                          ),
                        );
                      }
                      return CircularProgressIndicator();
                    }),
                  ),
                ),
              ),
    );
          }
}
