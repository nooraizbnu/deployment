import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/allposts.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpostsignin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
  runApp(PostsMain());
}

class PostsMain extends StatefulWidget {
  const PostsMain({Key? key}) : super(key: key);

  @override
  State<PostsMain> createState() => _PostsMainState();
}

class _PostsMainState extends State<PostsMain> {

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
                      child: Center(child: Text("PROJECTS",style: TextStyle(fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: Colors.white),)),
                    ),

                    Home(),//GET data Page

                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.375, top: MediaQuery.of(context).size.height*0.11),
                          height: MediaQuery.of(context).size.height*0.05,
                          width: MediaQuery.of(context).size.width*0.1,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          child: Center(child: Text("Previous",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize:  MediaQuery.of(context).size.height*0.03),)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.06, top: MediaQuery.of(context).size.height*0.11),
                          height: MediaQuery.of(context).size. height*0.05,
                          width: MediaQuery.of(context).size.width*0.1,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          child: Center(child: Text("Next",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize:  MediaQuery.of(context).size.height*0.03),)),
                        ),
                      ],
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

