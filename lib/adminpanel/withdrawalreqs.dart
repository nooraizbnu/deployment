import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:procollab_web/adminpanel/approvepost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:procollab_web/postdetail/projectdetails.dart';

class WithdrawalReqs extends StatefulWidget {
  //const GetData({Key? key}) : super(key: key);
  final String documentId;

  WithdrawalReqs({required this.documentId});

  @override
  State<WithdrawalReqs> createState() =>
      _WithdrawalReqsState(documentId: this.documentId);
}

class _WithdrawalReqsState extends State<WithdrawalReqs> {
  final String documentId;
  //
  _WithdrawalReqsState({required this.documentId});

  @override
  Widget build(BuildContext context) {
    var mainColor = const Color(0xFF1C5D8B);
    CollectionReference users =
    FirebaseFirestore.instance.collection("withdrawalrequest");
    return SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
            future: users.doc(documentId).get(),
            builder: ((context, snapshot){
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                {
                  return Column(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04, left: MediaQuery.of(context).size.width*0.175),
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: MediaQuery.of(context).size.height * 0.30,
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
                                  child: Text("${data['projectName']}",
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
                                            child: Text("Requested By: ",
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
                                            child: Text("${data['requestedBy']}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize:
                                                    MediaQuery.of(context).size.height *
                                                        0.025,
                                                    color: mainColor)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50.0, top: 30),
                                            child: Text("Requested From: ",
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
                                            child: Text("${data['collaboratorEmail']}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize:
                                                    MediaQuery.of(context).size.height *
                                                        0.025,
                                                    color: mainColor)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50.0, top: 30),
                                            child: Text("Amount: ",
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
                                            child: Text("${data['amount']}",
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

                                Container(
                                  margin:EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.04, 0, 0),
                                  child: TextButton(
                                    onPressed: () async {
                                      showDialog(context: context,
                                          builder: (context){
                                            return AlertDialog(
                                              title: Text("Payment Confirmed!"),
                                            );

                                          });
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: mainColor),
                                    child: Text(
                                      'Confirm Payment',
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
              }
              //return Text("Fetching Data from Database..");
              return Center(child: CircularProgressIndicator());
            })),
      ),
    );
  }
}
