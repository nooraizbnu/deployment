import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:procollab_web/postdetail/projectdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../chat/chatroom.dart';

class GetData extends StatefulWidget {
  final String documentId;

  GetData({required this.documentId});


  @override
  State<GetData> createState() => _GetDataState(documentId: this.documentId);
}
class _GetDataState extends State<GetData> {
  final String documentId;

  _GetDataState({required this.documentId});

  Map<String, dynamic>? userMap;

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2[0].toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  var loading = true;

  @override
  Widget build(BuildContext context){

    var mainColor = const Color(0xFF5364B8);
    CollectionReference users = FirebaseFirestore.instance.collection("posts");
    return SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(documentId).get(),
              builder: ((context, snapshot){
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                  loading = false;
                  if("${data['approval']}" != "Pending"){
                    return Container(
                      child: Row(
                        children: [

                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.175,top: MediaQuery.of(context).size.height*0.05),
                            width: MediaQuery.of(context).size.width*0.20,
                            height: MediaQuery.of(context).size.height*0.35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: mainColor,
                                  width: 2.5,
                                )
                            ),

                            child: Stack(
                              children: <Widget>[

                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.035,
                                    left: MediaQuery.of(context).size.height*0.0995,
                                    child: Container(
                                      child: Text("Uploaded By", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.0325, color: mainColor, fontWeight: FontWeight.bold),),
                                    )),

                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.10,
                                  left: MediaQuery.of(context).size.height*0.08,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: const AssetImage("happy-bearded-young-man.jpg"),
                                        radius: MediaQuery.of(context).size.height*0.03,
                                      )
                                    ],

                                  ),
                                ),

                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.10,
                                    left: MediaQuery.of(context).size.height*0.17,
                                    child: Container(
                                      child: Text("${data['name']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.03, color: mainColor, fontWeight: FontWeight.w300),),
                                    )),
                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.1325,
                                    left: MediaQuery.of(context).size.height*0.17,
                                    child: Container(
                                      child: Text("${data['area']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.02, color: mainColor, fontWeight: FontWeight.w300),),
                                    )),
                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.1725,
                                    left: MediaQuery.of(context).size.height*0.075,
                                    child: Container(
                                      child: Text("Email: ${data['email']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.02, color: mainColor, fontWeight: FontWeight.w300),),
                                    )),
                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.215,
                                    left: MediaQuery.of(context).size.height*0.155,
                                    child: Container(
                                      child: Text("\$${data['paihay']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.035, color: Colors.green, fontWeight: FontWeight.w300),),
                                    )),

                                Positioned(
                                    top: MediaQuery.of(context).size.height*0.2575,
                                    left: MediaQuery.of(context).size.height*0.10,
                                    child: Container(
                                      child: Text("Amount offered Per Contributor*", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.015, color: Colors.green, fontWeight: FontWeight.w300),),
                                    )),

                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.285,
                                  left: MediaQuery.of(context).size.height*0.140,
                                  child: InkWell(
                                  onTap: FirebaseAuth.instance.currentUser!.email! == data['email'] ? null : () async {
                                    String roomId = chatRoomId(
                                        FirebaseAuth.instance.currentUser!.email!,
                                        data['email']);
                                    print("chatroomId: $roomId");
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
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*0.034,
                                      width: MediaQuery.of(context).size.width*0.065,
                                      decoration: BoxDecoration(
                                        color: FirebaseAuth.instance.currentUser!.email! == data['email'] ? ChatRoom.secondaryColor : mainColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(child: Text("Chat",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize:  MediaQuery.of(context).size.height*0.020),)),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.000,top: MediaQuery.of(context).size.height*0.05),
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.height*0.35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: mainColor,
                                  width: 2.5,
                                )
                            ),

                            child: Stack(

                              children: <Widget>[
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.035,
                                  left: MediaQuery.of(context).size.height*0.35,
                                  child: Text("${data['projectname']}", style: TextStyle(decoration: TextDecoration.none, fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.0325, color: mainColor, fontWeight: FontWeight.bold),),
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.09,
                                  left: MediaQuery.of(context).size.height*0.055,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width*0.385,
                                      child: Text("${data['projectdescription']}", style: TextStyle(fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.017, color: Colors.black, fontWeight: FontWeight.w300),)),
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.29,
                                  left: MediaQuery.of(context).size.height*0.08,
                                  child: Text("${data['collaboratorsneeded']} Collaborators Required", style: TextStyle(fontFamily: "DM Sans", fontSize: MediaQuery.of(context).size.height*0.020, color: mainColor, fontWeight: FontWeight.w600),),
                                ),

                                Positioned(
                                  top: MediaQuery.of(context).size.height*0.29,
                                  left: MediaQuery.of(context).size.height*0.625,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.034,
                                    width: MediaQuery.of(context).size.width*0.065,
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                        child: InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> fetchDetails(documentId: documentId)));
                                              setState(() {

                                              });
                                            },
                                            child: Text("Detail",style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize:  MediaQuery.of(context).size.height*0.020),
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }
                return loading ? Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15,left: MediaQuery.of(context).size.width*0.5),
                  child: CircularProgressIndicator(),
                ) : Container();
              })),
        ),
       );
    }

}