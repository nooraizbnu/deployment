import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:procollab_web/contributorside/contributormain.dart';
import 'package:procollab_web/headerfooter/footer.dart';

import '../headerfooter/headerpostsignin.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: FirebaseOptions(
//         apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
//         projectId: "fir-authentication-ef41b",
//         messagingSenderId: "712311594484",
//         appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
//       )
//   );
//   runApp(CSMain());
// }

class CSMain extends StatefulWidget {
  const CSMain({Key? key}) : super(key: key);

  @override
  State<CSMain> createState() => _CSMainState();
}

class _CSMainState extends State<CSMain> {

  final user = FirebaseAuth.instance.currentUser;

  List<String> docIDs = [];

  Future getDocIds() async {
    await FirebaseFirestore.instance.collection("users").get().then(
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

                    ContributorPage(),

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
