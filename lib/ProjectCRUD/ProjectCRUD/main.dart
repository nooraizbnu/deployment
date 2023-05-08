import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/ProjectCRUD/ProjectCRUD/page/addpage.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: FirebaseOptions(
//         apiKey: "AIzaSyBiikc8rqM6SivdOoE38BsbrCppJ8wKT1Y",
//         appId: "1:601177459839:web:0fb95156e805deaa17834a",
//         messagingSenderId: "601177459839",
//         projectId: "fypattempt3",
//       )
//   );
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final String documentId;

  MyApp({required this.documentId});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: AddPage(documentId: documentId),
          ),
        ),
      ),

    );
  }
}

