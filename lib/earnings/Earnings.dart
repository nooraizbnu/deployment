import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/earnings/getpostdata.dart';

import '../headerfooter/footer.dart';
import '../headerfooter/headerpostsignin.dart';

class SPEarnings extends StatefulWidget {
  @override
  State<SPEarnings> createState() => _SPEarningsState();
}

class _SPEarningsState extends State<SPEarnings> {
  final String documentId = 'KL9fHwfzagd3nTC4eAWN';

  // final String documentId = 'vNXcWvF6cSymQrm2Nj9m';
  List<String> docIDs = [];
  var postLength = 0;

  Future getDocIds() async {
    await FirebaseFirestore.instance.collection("posts").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
    print(docIDs);
    postLength = docIDs.length;
    print(postLength);
  }

  @override
  Widget build(BuildContext context) {
    var fontFam = "DM Sans";

    var mainColor = const Color(0xFF5364B8);
    var secondaryColor = const Color(0xFF7886CB);
    CollectionReference users = FirebaseFirestore.instance.collection("posts");
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height, // +600
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                  ),
                  child: FutureBuilder(
                    future: getDocIds(),
                    builder: (context, snapshot){
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: postLength,
                          itemBuilder: (context, index){
                            return Container(
                              width: MediaQuery.of(context).size.width*0.25,
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.175),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      getPostData(documentId: docIDs[index]),
                                    ],),
                                  ),
                                ],
                              ),

                            );
                          }
                      );
                    },
                  ),
                ),

              ),
            ],


          ),
        ),
      ),
    );
  }
}
