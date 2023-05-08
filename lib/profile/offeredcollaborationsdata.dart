import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:procollab_web/ProjectCRUD/ProjectCRUD/models/employee.dart';
import 'package:procollab_web/ProjectCRUD/ProjectCRUD/page/editpage.dart';

import '../ProjectCRUD/ProjectCRUD/services/firebase_crud.dart';

class GetOfferedData extends StatefulWidget {
  //const GetOfferedData({Key? key}) : super(key: key);
  final String documentId;

  GetOfferedData({required this.documentId});


  @override
  State<GetOfferedData> createState() => _GetOfferedDataState(documentId: this.documentId);
}
class _GetOfferedDataState extends State<GetOfferedData> {
  final String documentId;
  //
  _GetOfferedDataState({required this.documentId});

  var name;
  var area;

  @override
  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser;
    if(user!.email! == "arhamlatif54@gmail.com"){
      name = "Arham Latif";
      area = "Web Developer";
    }
    else if(user!.email! == "salihashahzad@gmail.com"){
      name = "Saliha Shahzad";
      area = "UI/UX Designer";
    }
    else if(user!.email! == "nooraizasghar@gmail.com"){
      name = "Nooraiz Asghar";
      area = "Front End Developer";
    }

    final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readPosts();
    const mainColor = Color(0xFF1C5D8B);
    const secondaryColor = Color(0xFF3F83B4);

    CollectionReference users = FirebaseFirestore.instance.collection("posts");
    return SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
            future: users.doc(documentId).get(),
            builder: ((context, snapshot){
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                if("${data['email']}" == user?.email){
                  return Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
                        width: MediaQuery.of(context).size.width*0.65,
                        height: MediaQuery.of(context).size.height*0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: mainColor,
                              width: 2.5,
                            )
                        ),
                        child: Stack(

                          children: <Widget>[
                            Positioned(
                              top: MediaQuery.of(context).size.height*0.04,
                              left: MediaQuery.of(context).size.height*0.40,
                              child: Text("${data['projectname']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.045, color: mainColor, fontWeight: FontWeight.w600),),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height*0.13,
                              left: MediaQuery.of(context).size.height*0.08,
                              child: Container(
                                  width: MediaQuery.of(context).size.width*0.57,
                                  child: Text("${data['projectdescription']}", style: TextStyle(fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.02, color: Colors.black, fontWeight: FontWeight.w300),)),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height*0.50,
                              left: MediaQuery.of(context).size.height*0.08,
                              child: Text("${data['collaboratorsneeded']} Collaborators Required", style: TextStyle(fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.025, color: mainColor, fontWeight: FontWeight.w600),),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height*0.49,
                              left: MediaQuery.of(context).size.height*1.0,
                              child: InkWell(
                                onTap: (){
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: MediaQuery.of(context).size.width*0.11,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: const Color.fromARGB(255, 143, 133, 226), padding: const EdgeInsets.all(5.0),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    child: const Text('Delete', style: TextStyle(color: Colors.white),),
                                    onPressed: () async {
                                      var response =
                                      await FirebaseCrud.deletePost(docId: documentId);
                                      if (response.code != 200) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content:
                                                Text(response.message.toString()),
                                              );
                                            });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height*0.49,
                              left: MediaQuery.of(context).size.height*0.745,
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.05,
                                width: MediaQuery.of(context).size.width*0.11,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                child: FutureBuilder(
                                    future: users.doc(documentId).get(),
                                    builder: ((context, snapshot){
                                    if (snapshot.hasData) {
                                     Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                     // return ListView(
                                       // children: snapshot.data!.docs.map((e) {
                                         return ButtonBar(
                                            //alignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  foregroundColor: const Color.fromARGB(255, 143, 133, 226), padding: const EdgeInsets.all(5.0),
                                                  textStyle: const TextStyle(fontSize: 20),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.only(right: 75.0),
                                                  child: Text('Edit', style: TextStyle(color: Colors.white),),
                                                ),
                                                onPressed: () {
                                                  Navigator.pushAndRemoveUntil<dynamic>(
                                                    context,
                                                    MaterialPageRoute<dynamic>(
                                                      builder: (BuildContext context) => EditPage(
                                                        post: Post(
                                                            uid: documentId,
                                                            projectname: "${data["projectname"]}",
                                                            projectdescription: "${data["projectdescription"]}",
                                                            collaboratorsneeded: "${data["collaboratorsneeded"]}",
                                                            AmountDue: "${data["AmountDue"]}",
                                                            paihay: "${data["paihay"]}",
                                                            AmountEarned: "${data["AmountEarned"]}",
                                                            requirements: "${data["requirements"]}",
                                                            responsibilities: "${data["responsibilities"]}",
                                                            experience: "${data["experience"]}",
                                                            name: name,
                                                            area: area,
                                                            email: user!.email!,
                                                        ),
                                                      ),
                                                    ),
                                                        (route) =>
                                                    false, //if you want to disable back feature set to false
                                                  );
                                                },
                                              ),

                                            ],
                                          //);
                                          );
                                        //}).toList(),
                                      //);
                                    }

                                    return Container();
                                  }
                                ),
                              ),
                            ),
                            )],
                        ),
                      ),
                    ],
                  ),
                );
              }
              }
              //return Text("Fetching Data from Database..");
              return const Text("");
            })),
      ),
    );
  }

}
