import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/getfirebasedata.dart';
import 'package:procollab_web/progress/progresshome.dart';
class PostProgress extends StatefulWidget {
  const PostProgress({Key? key}) : super(key: key);

  @override
  State<PostProgress> createState() => _PostProgressState();
}

class _PostProgressState extends State<PostProgress> {
  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFamily = "DM Sans";

  final user = FirebaseAuth.instance.currentUser;

  List<String> docIDs = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance.collection("posts").get().then(
          (snapshot) =>
          snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
    );
    print(docIDs);
  }


  @override
  Widget build(BuildContext context) {
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
                          itemCount: docIDs.length,
                          itemBuilder: (context, index){
                            return Container(
                              child: Row(
                                children: [
                                  Row(children: [
                                    // docIDs[index].contains(FirebaseAuth.instance.currentUser!.uid) ? AllPostsProgress(documentId: docIDs[index]) : Container(),
                                    AllPostsProgress(documentId: docIDs[index])
                                  ],),
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
    //);
  }
}

