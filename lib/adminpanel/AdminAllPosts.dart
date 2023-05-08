import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/getfirebasedata.dart';

import 'GetdataAdmin.dart';
import 'getDisputeData.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  var mainColor = const Color(0xFF1C5D8B);
  var secondaryColor = const Color(0xFF3F83B4);
  var sec2Color = const Color(0xFFD8EAFF);
  var sec3Color = const Color(0xFF5381B8);
  static const fontFamily = "DM Sans";

  final user = FirebaseAuth.instance.currentUser;

  List<String> docIDs = [];
  List<String> disputesIDs = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance.collection("posts").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
    print(docIDs);
  }

  Future getDisputeIds() async {
    await FirebaseFirestore.instance.collection("disputes").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            disputesIDs.add(document.reference.id);
          }),
        );
    print(disputesIDs);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2.59, // +600
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                  ),
                  child: FutureBuilder(
                    future: getDocIds(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: docIDs.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      GetAdminData(documentId: docIDs[index]),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0,
                    MediaQuery.of(context).size.height * 0.10,
                    0,
                    MediaQuery.of(context).size.height * 0.05),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  color: sec2Color,
                  border: Border.all(
                    color: mainColor,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(
                  "Refund Disputes",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height * 0.05,
                      color: mainColor),
                )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2.59, // +600
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                  ),
                  child: FutureBuilder(
                    future: getDisputeIds(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      GetDisputeData(documentId: docIDs[index]),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    //);
  }
}
