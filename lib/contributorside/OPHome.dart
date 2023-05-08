import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/getfirebasedata.dart';
import 'package:procollab_web/contributorside/ongoingprojects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
        projectId: "fir-authentication-ef41b",
        messagingSenderId: "712311594484",
        appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
      )
  );
  runApp(const OPHome());
}

class OPHome extends StatefulWidget {
  const OPHome({Key? key}) : super(key: key);

  @override
  State<OPHome> createState() => _OPHomeState();
}

class _OPHomeState extends State<OPHome> {
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
                // height: MediaQuery.of(context).size.height*1.875, // +600
                height: 4000,
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
                                    // Text("data"),
                                    OngoingProjects(documentId: docIDs[index]),
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
