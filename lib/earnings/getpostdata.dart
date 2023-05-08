import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:procollab_web/adminpanel/AdminPortal.dart';

import '../CRUD/services/firebase_crud.dart';

class getPostData extends StatefulWidget {
  //const getPostData({Key? key}) : super(key: key);
  final String documentId;

  getPostData({required this.documentId});

  @override
  State<getPostData> createState() =>
      _getPostDataState(documentId: this.documentId);
}

class _getPostDataState extends State<getPostData> {
  final String documentId;

  _getPostDataState({required this.documentId});
  @override
  Widget build(BuildContext context) {
    var collaboratorsLength;
    var mainColor = const Color(0xFF5364B8);
    CollectionReference users = FirebaseFirestore.instance.collection("posts");

    return SafeArea(
        child: SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(documentId).get(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
                  collaboratorsLength = data['Collaborators'].length;
                  print("Length = $collaboratorsLength");
                  if ("${data['approval']}" != "Pending") {
                    return Column(
                      children: [
                        Center(
                          child: Container(
                            child: Container(
                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
                              width: MediaQuery.of(context).size.width * 0.65,
                              height: MediaQuery.of(context).size.height * 0.24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: mainColor,
                                    width: 2.5,
                                  )),
                              child: Container(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text("${data['projectname']}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                              MediaQuery.of(context).size.height *
                                                  0.03,
                                              color: mainColor)),
                                    ),
                                    Center(
                                      child: Container(
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 50.0, top: 30),
                                                child: Text("Project Status: ",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.025,
                                                        color: mainColor)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 30),
                                                child: Text("${data['ProjectStatus']}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize:
                                                        MediaQuery.of(context).size.height *
                                                            0.025,
                                                        color: mainColor)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 50.0, top: 30),
                                                child: Text("Amount Due: ",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.025,
                                                        color: mainColor)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 30),
                                                child: Text("${data['AmountDue']}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize:
                                                        MediaQuery.of(context).size.height *
                                                            0.025,
                                                        color: mainColor)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 50.0, top: 30),
                                                child: Text("Amount Earned: ",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.025,
                                                        color: mainColor)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 30),
                                                child: Text("${data['AmountEarned']}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize:
                                                        MediaQuery.of(context).size.height *
                                                            0.025,
                                                        color: mainColor)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 50.0, top: 30),
                                                child: Text("Amount Withdrawn: ",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.025,
                                                        color: mainColor)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 30),
                                                child: Text("${data['AmountWithdrawn']}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize:
                                                        MediaQuery.of(context).size.height *
                                                            0.025,
                                                        color: mainColor)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container()
                                      ],
                                    ),
                                    Container(
                                      margin:EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.03, 0, 0),
                                      child: TextButton(
                                        onPressed: () async {
                                          await FirebaseCrud
                                              .addWithdrawalRequest(
                                            projectName:
                                            data['projectname'],
                                            amount: data['AmountDue'],
                                            collaboratorEmail:
                                            data['email'],
                                            requestedBy: FirebaseAuth
                                                .instance
                                                .currentUser!
                                                .email!,
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                            backgroundColor: mainColor),
                                        child: Text(
                                          'Request Withdrawal',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }
                return CircularProgressIndicator();
              }),
            ),
           ));
    }
}
