import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:html';
import 'dart:js';
import 'dart:convert';

//import 'checkout/stripe_checkout.dart';

class Getprogress extends StatefulWidget {
  //const GetData({Key? key}) : super(key: key);
  final String documentId;

  Getprogress({required this.documentId});


  @override
  State<Getprogress> createState() => _GetprogressState(documentId: this.documentId);
}
class _GetprogressState extends State<Getprogress> {
  final String documentId;
  //
  _GetprogressState({required this.documentId});

  @override
  Widget build(BuildContext context){

    const mainColor = Color(0xFF5364B8);
    const secondaryColor = Color(0xFF7886CB);
    const fontFamily = "DM Sans";
    const fontFam = "DM Sans";
    final _formKey = GlobalKey<FormState>();
    String _name = '';
    int _age = 0;
    final TextEditingController _descriptionController=TextEditingController();
    //final TextEditingController _Controller=TextEditingController();
    final TextEditingController _usernameController=TextEditingController();

    CollectionReference users = FirebaseFirestore.instance.collection("posts");



    return SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
            future: users.doc(documentId).get(),
            builder: ((context, snapshot){
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                if("${data['approval']}" != "Pending"){

                  return Container(
                    //color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.41 ,MediaQuery.of(context).size.height*0.1 ,MediaQuery.of(context).size.height*0 ,MediaQuery.of(context).size.height*0 ),
                          height: MediaQuery.of(context).size.height*0.35,
                          width: MediaQuery.of(context).size.width*0.30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: secondaryColor,
                                width: 5,
                              )
                          ),
                          child: Column(
                            children: [

                              Row(
                                children: [
                                  Positioned(
                                    child:
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.1 , MediaQuery.of(context).size.height*0.03, 0, 0),
                                        child: Column(
                                          children: List.generate(1, (index){
                                            return Text(" ${data['projectname']}", style: TextStyle(decoration:TextDecoration.none,fontSize:30,color: mainColor,fontWeight: FontWeight.bold,fontFamily: fontFam));
                                          }),
                                        )
                                    ),
                                  ),
                                ],
                              ),


                              Row(
                                children: [
                                  Positioned(
                                    child:
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.035 ,MediaQuery.of(context).size.height*0.02, 0, 0),
                                        child: Column(
                                          children: List.generate(1, (index){
                                            return Text("- Collaborators : ${data['Collaborators'][0]}", style: TextStyle(decoration:TextDecoration.none,fontSize:13,color: secondaryColor,fontWeight: FontWeight.bold,fontFamily: fontFam));
                                          }),
                                        )
                                    ),
                                  ),

                                ],

                              ),
                              Row(
                                children: [
                                  Positioned(
                                    child:
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.16 ,MediaQuery.of(context).size.height*0.002, 0, 0),
                                        child: Column(
                                          children: List.generate(1, (index){
                                            return Text(" ${data['Collaborators'][1]}", style: TextStyle(decoration:TextDecoration.none,fontSize:13,color: secondaryColor,fontWeight: FontWeight.bold,fontFamily: fontFam));
                                          }),
                                        )
                                    ),
                                  ),

                                ],

                              ),
                              Row(
                                children: [
                                  Positioned(
                                    child:
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.16 ,MediaQuery.of(context).size.height*0.002, 0, 0),
                                        child: Column(
                                          children: List.generate(1, (index){
                                            return Text("${data['Collaborators'][2]}", style: TextStyle(decoration:TextDecoration.none,fontSize:13,color: secondaryColor,fontWeight: FontWeight.normal,fontFamily: fontFam));
                                          }),
                                        )
                                    ),
                                  ),

                                ],

                              ),

                              Row(
                                children: [


                                  Positioned(
                                    child:
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.035 , MediaQuery.of(context).size.height*0.02, 0, 0),
                                        child: Column(
                                          children: List.generate(1, (index){
                                            return Text("- Tasks: ${data['tasksname'][0]}", style: TextStyle(decoration:TextDecoration.none,fontSize:13,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam));
                                          }),
                                        )
                                    ),
                                  ),

                                ],

                              ),
                              Row(
                                children: [


                                  Positioned(
                                    child:
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.10 , MediaQuery.of(context).size.height*0.002, 0, 0),
                                        child: Column(
                                          children: List.generate(1, (index){
                                            return Text("${data['tasksname'][1]}", style: TextStyle(decoration:TextDecoration.none,fontSize:13,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam));
                                          }),
                                        )
                                    ),
                                  ),

                                ],

                              ),
                              Row(
                                children: [


                                  Positioned(
                                    child:
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.10 , MediaQuery.of(context).size.height*0.002, 0, 0),
                                        child: Column(
                                          children: List.generate(1, (index){
                                            return Text("${data['tasksname'][2]}", style: TextStyle(decoration:TextDecoration.none,fontSize:13,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam));
                                          }),
                                        )
                                    ),
                                  ),

                                ],

                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Container(
                                          child: Text('Kuch bhi'),
                                        ),
                                        // content: Form(
                                        //   key: _formKey,
                                        //   child: Column(
                                        //     mainAxisSize: MainAxisSize.min,
                                        //     children: [
                                        //       TextFormField(
                                        //         controller:_usernameController ,
                                        //         decoration:  const InputDecoration(
                                        //
                                        //             icon: Icon(Icons.person, color: secondaryColor,),
                                        //             hintText: 'Enter your username',
                                        //             labelText: 'Username',
                                        //             labelStyle: TextStyle(color: secondaryColor),
                                        //             enabledBorder: OutlineInputBorder(
                                        //               borderSide: BorderSide(width: 1, color: secondaryColor),
                                        //               // borderRadius: BorderRadius.circular(15),
                                        //             ),
                                        //             focusedBorder: OutlineInputBorder(
                                        //
                                        //               borderSide: BorderSide(width: 1, color: mainColor),
                                        //               //borderRadius: BorderRadius.circular(15),
                                        //             ),
                                        //             focusedErrorBorder: OutlineInputBorder(
                                        //               borderSide: BorderSide(color: Colors.red, width: 1),
                                        //               // borderRadius: BorderRadius.circular(0),
                                        //             ) ,
                                        //             errorBorder: OutlineInputBorder(
                                        //               borderSide: BorderSide(color: Colors.red, width: 1),
                                        //               //borderRadius: BorderRadius.circular(15),
                                        //             )
                                        //         ),
                                        //         validator: (value) {
                                        //           if (value!.isEmpty) {
                                        //             return 'Please enter your user name';
                                        //           }
                                        //           return null;
                                        //         },
                                        //       ),
                                        //       SizedBox(
                                        //         height: MediaQuery.of(context).size.height*0.025,
                                        //       ),
                                        //       TextFormField(
                                        //         controller:_descriptionController ,
                                        //         decoration:  const InputDecoration(
                                        //
                                        //             icon: Icon(Icons.description, color: secondaryColor,),
                                        //             hintText: 'Reason for Refund',
                                        //             labelText: 'Reason',
                                        //             labelStyle: TextStyle(color: secondaryColor),
                                        //             enabledBorder: OutlineInputBorder(
                                        //               borderSide: BorderSide(width: 1, color: secondaryColor),
                                        //               // borderRadius: BorderRadius.circular(15),
                                        //             ),
                                        //             focusedBorder: OutlineInputBorder(
                                        //
                                        //               borderSide: BorderSide(width: 1, color: mainColor),
                                        //               //borderRadius: BorderRadius.circular(15),
                                        //             ),
                                        //             focusedErrorBorder: OutlineInputBorder(
                                        //               borderSide: BorderSide(color: Colors.red, width: 1),
                                        //               // borderRadius: BorderRadius.circular(0),
                                        //             ) ,
                                        //             errorBorder: OutlineInputBorder(
                                        //               borderSide: BorderSide(color: Colors.red, width: 1),
                                        //               //borderRadius: BorderRadius.circular(15),
                                        //             )
                                        //         ),
                                        //         validator: (value) {
                                        //           if (value!.isEmpty) {
                                        //             return 'Please enter your Description';
                                        //           }
                                        //           return null;
                                        //         },
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              if (_formKey.currentState!.validate()) {
                                                Navigator.of(context).pop();
                                              }},
                                            child: Text('Submit'),
                                          ),

                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.025, MediaQuery.of(context).size.height*0.035, 0, 0),
                                  height: MediaQuery.of(context).size.height*0.04,
                                  width: MediaQuery.of(context).size.width*0.1,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: new BorderRadius.circular(10),
                                  ),
                                  child: Center(child: Text("Refund",style: TextStyle(decoration:TextDecoration.none,fontSize:15,color:Colors.white,fontWeight: FontWeight.bold,fontFamily: fontFam))),
                                ),
                              )

                            ],
                          ),

                        ),
                      ],
                    ),


                  );
                }
              }
              //return Text("Fetching Data from Database..");
              return const Text("");
            })),
      ),
    );
  }

}


