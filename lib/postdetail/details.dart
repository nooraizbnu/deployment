import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:procollab_web/agreement/Agreement.dart';
// import 'package:procollab_web/authentication/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../chat/chatroom.dart';


class SPDetail extends StatelessWidget {
  final String documentId;

  SPDetail({required this.documentId});

  Map<String, dynamic>? userMap;

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2[0].toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  Widget build(BuildContext context){

    List<String> collaboratorNames;
    var mainColor = Color(0xFF5364B8);
    var secondaryColor = Color(0xFF7886CB);
    CollectionReference users = FirebaseFirestore.instance.collection("posts");
    return SafeArea(
        child: SingleChildScrollView(
            child: FutureBuilder<DocumentSnapshot>(
                future: users.doc(documentId).get(),
                builder: ((context, snapshot){
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    // collaboratorNames = data["Collaborators"];
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 100),
                            height: MediaQuery.of(context).size.height*0.15,
                            width: MediaQuery.of(context).size.width*0.65,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(child: Text("PROJECT DETAILS",style: TextStyle(fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: Colors.white),)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.0,top: MediaQuery.of(context).size.height*0.1),
                            width: MediaQuery.of(context).size.width*0.65,
                            height: MediaQuery.of(context).size.height*1.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: mainColor,
                                  width: 2.5,
                                )
                            ),
                            //child: Text("${data['name']}"),
                            child: Stack(

                              children: <Widget>[
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.125,
                                  left: MediaQuery.of(context).size.height*0.08,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: const AssetImage("happy-bearded-young-man.jpg"),
                                        radius: MediaQuery.of(context).size.height*0.027,
                                      )
                                    ],

                                  ),
                                ),

                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.12,
                                    left: MediaQuery.of(context).size.height*0.17,
                                    child: Container(
                                      child: Text("${data['name']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.03, color: mainColor, fontWeight: FontWeight.w300),),
                                    )),
                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.16,
                                    left: MediaQuery.of(context).size.height*0.17,
                                    child: Container(
                                      child: Text("${data['area']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.02, color: mainColor, fontWeight: FontWeight.w300),),
                                    )),
                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.035,
                                    left: MediaQuery.of(context).size.height*1.15,
                                    child: Container(
                                      child: Text("\$${data['paihay']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.035, color: Colors.green, fontWeight: FontWeight.w300),),
                                    )),
                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.1,
                                    left: MediaQuery.of(context).size.height*0.08,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.003,
                                      width: MediaQuery.of(context).size.width*0.57,
                                      color: mainColor,
                                    )),
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.035,
                                  left: MediaQuery.of(context).size.height*0.08,
                                  child: Text("${data['projectname']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.035, color: mainColor, fontWeight: FontWeight.w600),),
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.2,
                                  left: MediaQuery.of(context).size.height*0.08,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width*0.575,
                                      child: Text("${data['projectdescription']}", style: TextStyle(fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.02, color: Colors.black, fontWeight: FontWeight.w300),)),
                                ),

                                Positioned(
                                  top: MediaQuery.of(context).size.height*1.3,
                                  left: MediaQuery.of(context).size.height*0.08,
                                  child: Text("${data['collaboratorsneeded']} Collaborators Required", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.03, color: mainColor, fontWeight: FontWeight.w600),),
                                ),

                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.53,
                                  left: MediaQuery.of(context).size.height*0.08,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Responsibilities: \n", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.03, color: mainColor, fontWeight: FontWeight.w400,),),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:
                                            List.generate(4, (index){
                                              return Text("- ${data['responsibilities'][index]}", style: TextStyle(decoration: TextDecoration.none,fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.02, color: Colors.black, fontWeight: FontWeight.w300),);
                                            }),
                                          ),
                                        ),
                                      ]
                                  ),
                                  //child: Text("Responsibilities: \n${data['responsibilities']}", style: TextStyle(fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.03, color: mainColor, fontWeight: FontWeight.w600),),
                                ),

                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.83,
                                  left: MediaQuery.of(context).size.height*0.08,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("\nRequirements: \n", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.03, color: mainColor, fontWeight: FontWeight.w400,),),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:
                                            List.generate(5, (index){
                                              return Text("- ${data['requirements'][index]}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.02, color: Colors.black, fontWeight: FontWeight.w300),);
                                            }),
                                          ),
                                        ),
                                      ]
                                  ),
                                  //child: Text("Responsibilities: \n${data['responsibilities']}", style: TextStyle(fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.03, color: mainColor, fontWeight: FontWeight.w600),),
                                ),

                                Positioned(
                                  top: MediaQuery.of(context).size.height*1.1,
                                  left: MediaQuery.of(context).size.height*0.08,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Experience: \n", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.03, color: mainColor, fontWeight: FontWeight.w400,),),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:
                                            List.generate(2, (index){
                                              return Text("- ${data['experience'][index]}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.02, color: Colors.black, fontWeight: FontWeight.w300),);
                                            }),
                                          ),
                                        ),
                                      ]
                                  ),
                                  //child: Text("Responsibilities: \n${data['responsibilities']}", style: TextStyle(fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.03, color: mainColor, fontWeight: FontWeight.w600),),
                                ),

                                Positioned(
                                  top: MediaQuery.of(context).size.height*1.3,
                                  left: MediaQuery.of(context).size.height*0.8,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.05,
                                    width: MediaQuery.of(context).size.width*0.1,
                                    decoration: BoxDecoration(
                                      color: FirebaseAuth.instance.currentUser!.email! == data['email'] ? ChatRoom.secondaryColor : mainColor,
                                      borderRadius: BorderRadius.circular(17),
                                    ),

                                    child: InkWell(
                                      onTap: FirebaseAuth.instance.currentUser!.email! == data['email'] ? null : () async {
                                        String roomId = chatRoomId(
                                            FirebaseAuth.instance.currentUser!.email!,
                                            data['email']);
                                        print("roomId: $roomId");
                                        FirebaseFirestore _firestore = FirebaseFirestore.instance;

                                        await _firestore
                                            .collection("users")
                                            .where("email", isEqualTo: data['email'])
                                            .get()
                                            .then((value) {
                                            userMap = value.docs[0].data();
                                          print(userMap);
                                        });
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => ChatRoom(
                                              chatRoomId: roomId,
                                              userMap: userMap!,
                                            ),
                                          ),
                                        );
                                      },
                                        child: Center(child: Text("Chat",style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontWeight: FontWeight.w500, fontSize:  MediaQuery.of(context).size.height*0.03),))),
                                  ),
                                ),

                                Positioned(
                                  top: MediaQuery.of(context).size.height*1.3,
                                  left: MediaQuery.of(context).size.height*1.04,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.05,
                                    width: MediaQuery.of(context).size.width*0.1,
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    child: InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Agreement(documentId: documentId, email: data["email"], projectName: data["projectname"], area: data["area"], name: data["name"])));

                                        },
                                        child: Center(child: Text("Collab",style: TextStyle(decoration: TextDecoration.none, color: Colors.white, fontWeight: FontWeight.w500, fontSize:  MediaQuery.of(context).size.height*0.03),))),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                })),
            ),
        );
    }
}

