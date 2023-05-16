import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/posts.dart';
import 'package:procollab_web/profile/offeredcollaborations.dart';
import 'package:procollab_web/profile/payable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:procollab_web/authentication/signup.dart';
import 'package:procollab_web/tasks/createtasks.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'interestedcollabdata.dart';
import 'interestedcontributors.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFF1C5D8B);
    const secondaryColor = Color(0xFF3F83B4);

    final user = FirebaseAuth.instance.currentUser;
    bool exists = false;
    List<String> Collaborators = [];
    CollectionReference posts = FirebaseFirestore.instance.collection("posts");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white30,
            elevation: 0,
            bottom: TabBar(
              unselectedLabelColor: mainColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: mainColor),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mainColor, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Offered Collaborations", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height*0.025,
                      ),),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mainColor, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Interested Contributors", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height*0.025,
                      ),),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mainColor, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Payable", style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height*0.025,
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // FutureBuilder<DocumentSnapshot>(
              //   future: posts.doc(documentId).get(),
              //   builder: ((context, snapshot){
              //     Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              //     print(data);
              //     var collaboratorsArray = data["CollaboratorsEmail"];
              //     if(collaboratorsArray.contains(user!.email!)){
              //       exists = true;
              //       return Offered();
              //     }else{
              //       exists = false;
              //       print("not allowed");
              //       return Center(child: Container(margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.25, 0, 0), child: Text("                 No Projects Yet!\nPlease Contribute in a Project first!", style: TextStyle(fontSize: 20, fontFamily: "DM Sans", color: Colors.redAccent, fontWeight: FontWeight.w400))));
              //     }
              //   }),
              // ),
              Offered(),
              interestedContributors(),
              PayableMain(),
              //FirstScreen(),
              //SecondScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
