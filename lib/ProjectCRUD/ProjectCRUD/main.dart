import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/ProjectCRUD/ProjectCRUD/page/addpage.dart';

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final String documentId;
  final Map<String, dynamic> data;

  MyApp({required this.documentId, required this.data});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: AddPage(data: data, documentId: documentId),
          ),
        ),
      ),

    );
  }
}

