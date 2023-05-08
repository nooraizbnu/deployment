import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:procollab_web/authentication/signup.dart';
import 'package:procollab_web/tasks/createtasks.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../headerfooter/footer.dart';
import '../headerfooter/headerpostsignin.dart';

class TaskHome extends StatelessWidget {
  final String documentId;

  TaskHome({required this.documentId});

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);

  final user = FirebaseAuth.instance.currentUser;
  bool exists = false;

  List<String> Collaborators = [];

  @override
  Widget build(BuildContext context) {
    CollectionReference posts = FirebaseFirestore.instance.collection("posts");

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context){
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [

                    headerpostsu(), //Header post SignUp

                    Container(
                      margin: EdgeInsets.only(top: 75),
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.65,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text("TASKS",style: TextStyle(fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: Colors.white),)),
                    ),
                    FutureBuilder<DocumentSnapshot>(
                      future: posts.doc(documentId).get(),
                      builder: ((context, snapshot){
                        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                        print(data);
                        var collaboratorsArray = data["CollaboratorsEmail"];
                        if(collaboratorsArray.contains(user!.email!)){
                          exists = true;
                          return SPCreateTasks(documentId: documentId);
                        }else{
                          exists = false;
                          print("not allowed");
                          return Text("Not Allowed");
                        }
                        return Container();

                      }),
                    ),

                    footer(), // Footer
                  ],
                ),
              ),
            ),

          );
        },
        )
    );
  }
}
