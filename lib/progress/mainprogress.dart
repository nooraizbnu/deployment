import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/allposts.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpostsignin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:procollab_web/progress/allprogress.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
        projectId: "fir-authentication-ef41b",
        messagingSenderId: "712311594484",
        appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
      )
  );
  runApp(mainProgress());
}

class mainProgress extends StatefulWidget {
  const mainProgress({Key? key}) : super(key: key);

  @override
  State<mainProgress> createState() => _mainProgressState();
}

class _mainProgressState extends State<mainProgress> {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);

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
                      margin: EdgeInsets.only(top: 100),
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.65,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text("Progress",style: TextStyle(fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: Colors.white),)),
                    ),

                    AllProgress(),//GET data Page




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

