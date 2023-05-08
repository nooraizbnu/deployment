import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:procollab_web/agreement/Agreement.dart';
import 'package:procollab_web/agreement/Agreement2.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpostsignin.dart';
import 'package:procollab_web/profile/Viewfulllist.dart';

//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: const FirebaseOptions(
//         apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
//         projectId: "fir-authentication-ef41b",
//         messagingSenderId: "712311594484",
//         appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",)
//   );
//   runApp(SPInterested(documentId: 'eX8sqrnparTBEnpyhtcN',));
//
// }
class SPInterested extends StatelessWidget {
  final String documentId = "eX8sqrnparTBEnpyhtcN";

  //SPInterested({required this.documentId});

  @override
  Widget build(BuildContext context) {
    print(documentId);
    var fontFam = "DM Sans";
    const mainColor = Color(0xFF1C5D8B);
    const secondaryColor = Color(0xFF3F83B4);

    CollectionReference users =
        FirebaseFirestore.instance.collection("Interested");
    CollectionReference interestedContributor =
        FirebaseFirestore.instance.collection("users");
    CollectionReference user = FirebaseFirestore.instance.collection("users");
    CollectionReference contributorsCollection =
        FirebaseFirestore.instance.collection("contributorrequest");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot>(
              future: contributorsCollection.doc("o4Kahh255lD6qMr4L0OO").get(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  if (data["email"] ==
                      FirebaseAuth.instance.currentUser!.email) {
                    // DocumentReference docRef = FirebaseFirestore.instance.collection("contributorrequest").doc(documentId);
                    // DocumentSnapshot doc = await docRef.get();
                    var length = data["contributors"].length;
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 50),
                                    height: MediaQuery.of(context).size.height *
                                        0.45,
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.fromLTRB(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.5,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03,
                                                      0,
                                                      0),
                                                  child: Column(
                                                    children: List.generate(1,
                                                        (index) {
                                                      return Text(
                                                          data['projectName'],
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontSize: 20,
                                                              color: mainColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  fontFam));
                                                    }),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                        ),
                                        Column(
                                          children:
                                              List.generate(length, (index) {
                                            return FutureBuilder<
                                                    DocumentSnapshot>(
                                                future: user
                                                    .doc(data["contributors"]
                                                        [index])
                                                    .get(),
                                                builder: ((context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    Map<String, dynamic>
                                                        userData =
                                                        snapshot.data!.data()
                                                            as Map<String,
                                                                dynamic>;
                                                    print("Data: $userData");
                                                    return Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.2,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.05,
                                                              0,
                                                              0),
                                                          child:
                                                              const CircleAvatar(
                                                            radius: 20,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'happy-bearded-young-man.jpg'),
                                                          ),
                                                        ),
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            margin: EdgeInsets.fromLTRB(
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.01,
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.03,
                                                                0,
                                                                0),
                                                            child: Column(
                                                                children: [
                                                                  Text(
                                                                      " ${userData['name']}",
                                                                      style: TextStyle(
                                                                          decoration: TextDecoration
                                                                              .none,
                                                                          fontSize:
                                                                              20,
                                                                          color:
                                                                              mainColor,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              fontFam)),
                                                                  Text(
                                                                      " ${userData['field']}",
                                                                      style: TextStyle(
                                                                          decoration: TextDecoration
                                                                              .none,
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              mainColor,
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontFamily:
                                                                              fontFam)),
                                                                ])),
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.1,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.05,
                                                              0,
                                                              0),
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: mainColor,
                                                            borderRadius:
                                                                new BorderRadius
                                                                    .circular(10),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return AlertDialog(
                                                                      title:
                                                                          Row(
                                                                        children: [
                                                                          Column(
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.37,
                                                                                height: MediaQuery.of(context).size.height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                                                                  border: Border.all(
                                                                                    width: 2,
                                                                                    color: mainColor,
                                                                                    style: BorderStyle.solid,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Container(
                                                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.04, 0, 0, 0),
                                                                                      child: CircleAvatar(
                                                                                        backgroundImage: const AssetImage("happy-bearded-young-man.jpg"),
                                                                                        radius: MediaQuery.of(context).size.height * 0.075,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      height: MediaQuery.of(context).size.height * 0.3,
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          Container(
                                                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.01, MediaQuery.of(context).size.height * 0.08, 0, 0),
                                                                                            child: Positioned(
                                                                                              child: Text(
                                                                                                "${userData['name']}",
                                                                                                style: TextStyle(
                                                                                                  fontSize: MediaQuery.of(context).size.height * 0.04,
                                                                                                  color: mainColor,
                                                                                                  fontWeight: FontWeight.w700,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.01, MediaQuery.of(context).size.height * 0.13, 0, 0),
                                                                                            child: Positioned(
                                                                                              child: Text(
                                                                                                "${userData["field"]}",
                                                                                                style: TextStyle(
                                                                                                  fontSize: MediaQuery.of(context).size.height * 0.03,
                                                                                                  color: mainColor,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.01, MediaQuery.of(context).size.height * 0.17, 0, 0),
                                                                                            child: Positioned(
                                                                                              top: 10,
                                                                                              left: 10,
                                                                                              child: Text(
                                                                                                "${userData["linkedin"]}",
                                                                                                style: TextStyle(
                                                                                                  fontSize: MediaQuery.of(context).size.height * 0.02,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  color: mainColor,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.28,
                                                                                height: MediaQuery.of(context).size.height * 0.3,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                                                                  border: Border.all(
                                                                                    width: 2,
                                                                                    color: mainColor,
                                                                                    style: BorderStyle.solid,
                                                                                  ),
                                                                                ),
                                                                                child: Container(
                                                                                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.045, 0, 0),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Text(
                                                                                        "About",
                                                                                        style: TextStyle(
                                                                                          fontSize: MediaQuery.of(context).size.height * 0.035,
                                                                                          color: mainColor,
                                                                                          fontWeight: FontWeight.w700,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        "Email: ${userData["email"]}",
                                                                                        style: TextStyle(
                                                                                          fontSize: MediaQuery.of(context).size.height * 0.025,
                                                                                          color: mainColor,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        "From: ${userData["from"]}",
                                                                                        style: TextStyle(
                                                                                          fontSize: MediaQuery.of(context).size.height * 0.025,
                                                                                          color: mainColor,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                      ),
                                                                                      // Text("Member Since: ${data["membersince"]}", style: TextStyle(
                                                                                      //   fontSize: MediaQuery.of(context).size.height*0.025,
                                                                                      //   color: mainColor,
                                                                                      //   fontWeight: FontWeight.w500,
                                                                                      // ),),
                                                                                      Text(
                                                                                        "Projects Completed: ${userData["projectscompleted"]}",
                                                                                        style: TextStyle(
                                                                                          fontSize: MediaQuery.of(context).size.height * 0.025,
                                                                                          color: mainColor,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        "Ongoing Projects: ${userData["ongoingprojects"]}",
                                                                                        style: TextStyle(
                                                                                          fontSize: MediaQuery.of(context).size.height * 0.025,
                                                                                          color: mainColor,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                    );
                                                                  });
                                                            },
                                                            child: Center(
                                                                child: Text(
                                                                    "View Profile",
                                                                    style: TextStyle(
                                                                        decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            fontFam))),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        "${userData["name"]} has been added to the list of contributors"),
                                                                  );
                                                                });
                                                            DocumentReference
                                                                docRef =
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        "posts")
                                                                    .doc(
                                                                        "o4Kahh255lD6qMr4L0OO");
                                                            //DocumentSnapshot doc = await docRef.get();
                                                            docRef.update({
                                                              "Collaborators":
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                userData["name"]
                                                              ]),
                                                              "CollaboratorsID":
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                data["contributors"]
                                                                    [index]
                                                              ]),
                                                              "CollaboratorsEmail":
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                userData[
                                                                        "email"]
                                                                    [index]
                                                              ]),
                                                            });
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets.fromLTRB(
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.025,
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.05,
                                                                0,
                                                                0),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.04,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: mainColor,
                                                              borderRadius:
                                                                  new BorderRadius
                                                                      .circular(10),
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                    "Collaborate",
                                                                    style: TextStyle(
                                                                        decoration:
                                                                            TextDecoration
                                                                                .none,
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            fontFam))),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                  return CircularProgressIndicator();
                                                }));
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                }
                return CircularProgressIndicator();
              })),
        ),
      ),
    );
  }
}
