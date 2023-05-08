import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpostsignin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
    projectId: "fir-authentication-ef41b",
    messagingSenderId: "712311594484",
    appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
  ));
  runApp(SPViewfull(
    documentId: 'eX8sqrnparTBEnpyhtcN',
  ));
}

class SPViewfull extends StatelessWidget {
  final String documentId;

  SPViewfull({required this.documentId});

  @override
  Widget build(BuildContext context) {
    print(documentId);
    var fontFam = "DM Sans";

    var mainColor = const Color(0xFF5364B8);
    var secondaryColor = const Color(0xFF7886CB);
    CollectionReference users =
        FirebaseFirestore.instance.collection("Interested");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot>(
              future: users.doc(documentId).get(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Container(
                    // height: MediaQuery.of(context).size.height,
                    //   width:MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 50),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: secondaryColor,
                                                width: 5,
                                              )),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        0,
                                                        0),
                                                    child: const CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                          'assets/happy-bearded-young-man.jpg'),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(

                                                        //alignment: Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.02,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                " ${data['PersonName'][0]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        mainColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.57,
                                                          0,
                                                          0,
                                                          0),
                                                      child: Column(
                                                        children: List.generate(
                                                            1, (index) {
                                                          return Text(
                                                              " ${data['field'][0]}",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color:
                                                                      mainColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      fontFam));
                                                        }),
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        0,
                                                        0),
                                                    child: const CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                          'assets/happy-bearded-young-man.jpg'),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(

                                                        //alignment: Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.02,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                " ${data['PersonName'][1]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        mainColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.57,
                                                          0,
                                                          0,
                                                          0),
                                                      child: Column(
                                                        children: List.generate(
                                                            1, (index) {
                                                          return Text(
                                                              " ${data['field'][1]}",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color:
                                                                      mainColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      fontFam));
                                                        }),
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        0,
                                                        0),
                                                    child: const CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                          'assets/happy-bearded-young-man.jpg'),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(

                                                        //alignment: Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.02,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                " ${data['PersonName'][2]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        mainColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.57,
                                                          0,
                                                          0,
                                                          0),
                                                      child: Column(
                                                        children: List.generate(
                                                            1, (index) {
                                                          return Text(
                                                              " ${data['field'][2]}",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color:
                                                                      mainColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      fontFam));
                                                        }),
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        0,
                                                        0),
                                                    child: const CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                          'assets/happy-bearded-young-man.jpg'),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(

                                                        //alignment: Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.02,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                " ${data['PersonName'][3]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        mainColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.57,
                                                          0,
                                                          0,
                                                          0),
                                                      child: Column(
                                                        children: List.generate(
                                                            1, (index) {
                                                          return Text(
                                                              " ${data['field'][0]}",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color:
                                                                      mainColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      fontFam));
                                                        }),
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        0,
                                                        0),
                                                    child: const CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                          'assets/happy-bearded-young-man.jpg'),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(

                                                        //alignment: Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.02,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                " ${data['PersonName'][4]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        mainColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.57,
                                                          0,
                                                          0,
                                                          0),
                                                      child: Column(
                                                        children: List.generate(
                                                            1, (index) {
                                                          return Text(
                                                              " ${data['field'][1]}",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color:
                                                                      mainColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      fontFam));
                                                        }),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            //footer(),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                //return Text("Fetching Data from Database..");
                return const Text("");
              })),
        ),
      ),
    );
  }
}
