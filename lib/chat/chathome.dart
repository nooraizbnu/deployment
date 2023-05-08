import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:procollab_web/ProjectCRUD/ProjectCRUD/page/addpage.dart';

import 'chatroom.dart';
import 'group_chat/group_chat_screen.dart';

class chatHome extends StatefulWidget {
  chatHome({Key? key}) : super(key: key);

  @override
  State<chatHome> createState() => _chatHomeState();
}

final user = FirebaseAuth.instance.currentUser;

class _chatHomeState extends State<chatHome> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async{
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    if(state == AppLifecycleState.resumed){
      setStatus("Online");
    }else{
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2[0].toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection("users")
        .where("email", isEqualTo: searchController.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainColor = Color(0xFF5364B8);
    return Scaffold(
      appBar: AppBar(
        title: Text("Procollab Chat"),
        backgroundColor: mainColor,
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 20,
                // width: MediaQuery.of(context).size.width,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                  // width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 14,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: "Search for user",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                ElevatedButton(
                  onPressed: onSearch,
                  child: Text("Search"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor, // Background color
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                userMap != null
                    ? ListTile(
                        onTap: () {
                          String roomId = chatRoomId(
                              FirebaseAuth.instance.currentUser!.email!,
                              userMap!['email']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              ),
                            ),
                          );
                        },
                        leading: Icon(Icons.account_box, color: Colors.black),
                        title: Text(
                          userMap!['firstName'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(userMap!['email']),
                        trailing: Icon(Icons.chat, color: Colors.black),
                      )
                    : Container(),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.group),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GroupChatHomeScreen(),
          ),
        ),
        backgroundColor: mainColor,
      ),
    );
  }
}
