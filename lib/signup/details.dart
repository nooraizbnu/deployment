import 'dart:html';
import 'package:flutter/material.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpresignup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../usersCRUD/services/firebase_crud.dart';
import 'confirmation.dart';

class details extends StatefulWidget {
  TextEditingController emailController;
  TextEditingController userName;
  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController dob;
  TextEditingController gender;
  TextEditingController city;
  TextEditingController state;

  details({Key? key, required this.userName, required this.emailController, required this.firstName, required this.lastName, required this.dob, required this.gender, required this.city, required this.state}) : super(key: key);

  @override
  State<details> createState() => _detailsState(userName: userName,emailController: this.emailController, firstName: this.firstName, lastName: this.lastName, dob: this.dob, gender: this.gender, city: this.city, state: this.state);
}

class _detailsState extends State<details> {
  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";

  final _fieldofwork = TextEditingController();
  final _description = TextEditingController();
  final _linkedin = TextEditingController();

  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController dob;
  TextEditingController gender;
  TextEditingController city;
  TextEditingController state;
  TextEditingController emailController;
  TextEditingController userName;

  _detailsState({required this.userName,required this.emailController, required this.firstName, required this.lastName, required this.dob, required this.gender, required this.city, required this.state,});

  final _formKey = GlobalKey<FormState>();

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
        home: Builder(
            builder:  (context) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: SafeArea(child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const header(),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.1, 0, 0),
                                  height: MediaQuery.of(context).size.height*0.80,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  color: const Color(0xFFF7F8FB),
                                  child:
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.width*0.03, 0, 0),
                                                height: 50.0,
                                                width: 50.0,

                                                decoration: BoxDecoration(
                                                  color: mainColor,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(Icons.details,
                                                        color: Colors.white),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.width*0.03, 0, 0),
                                                child: const Text("Details",style: TextStyle(fontSize:32,color: mainColor,fontWeight: FontWeight.bold,fontFamily: fontFam),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children:[
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.17, MediaQuery.of(context).size.height*0.04, 0, 0),
                                                child: const Text("Please fill in the fields below with your data.",style: TextStyle(fontSize:15,color:Colors.black45,fontWeight: FontWeight.normal,fontFamily: fontFam)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.11, MediaQuery.of(context).size.height*0.04, 0, 0),
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context).size.height*0.5,
                                                width: MediaQuery.of(context).size.height*0.6,
                                                child: Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: MediaQuery.of(context).size.height*0.01,
                                                      ),
                                                      TextFormField(
                                                        controller:_fieldofwork,
                                                        decoration:  const InputDecoration(

                                                            icon: Icon(Icons.work, color: secondaryColor,),
                                                            hintText: 'Field of work',
                                                            labelText: 'Field of work',
                                                            labelStyle: TextStyle(color: secondaryColor),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(width: 1, color: secondaryColor),
                                                              // borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(

                                                              borderSide: BorderSide(width: 1, color: mainColor),
                                                              //borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            focusedErrorBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.red, width: 1),
                                                              // borderRadius: BorderRadius.circular(0),
                                                            ) ,
                                                            errorBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.red, width: 1),
                                                              //borderRadius: BorderRadius.circular(15),
                                                            )
                                                        ),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter Field of work';
                                                          }
                                                          final RegExp nameExp = RegExp(r'^[a-zA-Z]+$');
                                                          if (!nameExp.hasMatch(value)) {
                                                            return 'Please enter only text';
                                                          }
                                                          return null;
                                                        },
                                                      ),

                                                      SizedBox(
                                                        height: MediaQuery.of(context).size.height*0.01,
                                                      ),
                                                      TextFormField(
                                                        controller:_description ,
                                                        decoration:  const InputDecoration(
                                                            contentPadding: EdgeInsets.symmetric(vertical: 40,horizontal: 5),
                                                            icon: Icon(Icons.description, color: secondaryColor,),
                                                            hintText: 'Description:',
                                                            labelText: 'Description:',
                                                            labelStyle: TextStyle(color: secondaryColor),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(width: 1, color: secondaryColor),
                                                              // borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(

                                                              borderSide: BorderSide(width: 1, color: mainColor),
                                                              //borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            focusedErrorBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.red, width: 1),
                                                              // borderRadius: BorderRadius.circular(0),
                                                            ) ,
                                                            errorBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.red, width: 1),
                                                              //borderRadius: BorderRadius.circular(15),
                                                            )
                                                        ),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter your description';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(context).size.height*0.01,
                                                      ),
                                                      TextFormField(
                                                        controller:_linkedin,
                                                        decoration:  const InputDecoration(

                                                            icon: Icon(Icons.link_outlined, color: secondaryColor,),
                                                            hintText: 'LinkedIn Profile:',
                                                            labelText: 'LinkedIn Profile:',
                                                            labelStyle: TextStyle(color: secondaryColor),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(width: 1, color: secondaryColor),
                                                              // borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(

                                                              borderSide: BorderSide(width: 1, color: mainColor),
                                                              //borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            focusedErrorBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.red, width: 1),
                                                              // borderRadius: BorderRadius.circular(0),
                                                            ) ,
                                                            errorBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.red, width: 1),
                                                              //borderRadius: BorderRadius.circular(15),
                                                            )
                                                        ),
                                                        validator: (value) {
                                                          if (value == null) {
                                                            return 'Please enter a LinkedIn profile link';
                                                          }
                                                          // Check if the input string matches a valid LinkedIn profile URL pattern
                                                          RegExp regex = RegExp(
                                                            r'^https:\/\/(www\.)?linkedin\.com\/in\/[a-zA-Z0-9\-_]{5,30}\/?$',
                                                            caseSensitive: false,
                                                            multiLine: false,
                                                          );
                                                          if (!regex.hasMatch(value)) {
                                                            return 'Please enter a valid LinkedIn profile link';
                                                          }
                                                          return null;
                                                        },
                                                      ),




                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.09, 0, 0),
                                                            height: MediaQuery.of(context).size.height*0.035,
                                                            width: MediaQuery.of(context).size.width*0.05,
                                                            decoration: BoxDecoration(
                                                              color: mainColor,
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            child: Center(
                                                              child: InkWell(
                                                                onTap: (){

                                                                  setState(() {

                                                                  });
                                                                },
                                                                child: MaterialButton(
                                                                  minWidth: MediaQuery.of(context).size.width,
                                                                  padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                                                  onPressed: () async {
                                                                    if (_formKey.currentState!.validate()) {

                                                                      var response = await FirebaseCrud.addUser(
                                                                        email: emailController.text,
                                                                        username: userName.text,
                                                                        firstName: firstName.text,
                                                                        lastName: lastName.text,
                                                                        dob: dob.text,
                                                                        gender: gender.text,
                                                                        city: city.text,
                                                                        state: state.text,
                                                                        fieldofwork: _fieldofwork.text,
                                                                        description: _description.text,
                                                                        linkedin: _linkedin.text,
                                                                      );
                                                                      if (response.code != 200) {
                                                                        showDialog(
                                                                            context: context,
                                                                            builder: (context) {
                                                                              return AlertDialog(
                                                                                content: Text(response.message.toString()),
                                                                              );
                                                                            });
                                                                      } else {
                                                                        showDialog(
                                                                            context: context,
                                                                            builder: (context) {
                                                                              return AlertDialog(
                                                                                content: Text(response.message.toString()),
                                                                              );
                                                                            });
                                                                      }
                                                                    }
                                                                  },
                                                                  child: const Text(
                                                                    "Save",
                                                                    style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                                                  ),
                                                                ),


                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.17, MediaQuery.of(context).size.height*0.09, 0, 0),
                                                            height: MediaQuery.of(context).size.height*0.035,
                                                            width: MediaQuery.of(context).size.width*0.04,
                                                            decoration: BoxDecoration(
                                                              color: const Color(0xFFF7F8FB),
                                                              borderRadius: BorderRadius.circular(10),
                                                              border:  Border.all(width: 1, color: mainColor),
                                                            ),
                                                            child: Center(
                                                              child: InkWell(
                                                                onTap: (){

                                                                  if (_formKey.currentState!.validate()) {
                                                                    //   ScaffoldMessenger.of(context).showSnackBar(
                                                                    //     const SnackBar(content: Text('Processing Data')),
                                                                    // );
                                                                    Navigator
                                                                        .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (
                                                                                context) =>
                                                                                confirmation()));
                                                                    setState(() {

                                                                    });
                                                                  }
                                                                },
                                                                child: const Text(
                                                                  "Next",
                                                                  style: TextStyle(fontSize: 13, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w400),
                                                                ),

                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ],

                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.1, 0, 0),
                                      height: MediaQuery.of(context).size.height*0.80,
                                      width: MediaQuery.of(context).size.width*0.25,
                                      color: secondaryColor,

                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.09, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                height: 100.0,
                                                width: 100.0,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'logo.png'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.085, MediaQuery.of(context).size.width*0.01, 0, 0),
                                                child: Row(

                                                    children: const [Center(child: Text("PROCOLLAB",style: TextStyle(fontSize:22,color: Colors.white,fontWeight: FontWeight.bold))),]
                                                ),
                                              ),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                height: 50.0,
                                                width: 50.0,

                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  borderRadius: BorderRadius.circular(50),

                                                ),

                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(Icons.email_outlined,
                                                        color: mainColor),
                                                  ],

                                                ),


                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                child: const Text("Credentials",style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: fontFam),
                                                ),

                                              ),


                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.065, 0, 0, 0),
                                                height: 25,
                                                width: 3,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  //borderRadius: new BorderRadius.circular(0),
                                                ),
                                              ),

                                            ],

                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, 0, 0),
                                                height: 50.0,
                                                width: 50.0,

                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  borderRadius: BorderRadius.circular(50),

                                                ),

                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(Icons.lock,
                                                        color: mainColor),
                                                  ],

                                                ),


                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, 0, 0, 0),
                                                child: const Text("Security",style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: fontFam),
                                                ),

                                              ),

                                            ],
                                          ),





                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.065, 0, 0, 0),
                                                height: 25,
                                                width: 3,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  //borderRadius: new BorderRadius.circular(0),
                                                ),
                                              ),

                                            ],

                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, 0, 0),
                                                height: 50.0,
                                                width: 50.0,

                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  borderRadius: BorderRadius.circular(50),

                                                ),

                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(Icons.person,
                                                        color: mainColor),
                                                  ],

                                                ),


                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, 0, 0, 0),
                                                child: const Text("Personal Information",style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: fontFam),
                                                ),

                                              ),

                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.065, 0, 0, 0),
                                                height: 25,
                                                width: 3,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  //borderRadius: new BorderRadius.circular(0),
                                                ),
                                              ),

                                            ],

                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, 0, 0),
                                                height: 50.0,
                                                width: 50.0,

                                                decoration: BoxDecoration(
                                                  color: mainColor,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  borderRadius: BorderRadius.circular(50),

                                                ),

                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(Icons.details,
                                                        color: Colors.white),
                                                  ],

                                                ),


                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, 0, 0, 0),
                                                child: const Text("Details",style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: fontFam),
                                                ),

                                              ),

                                            ],
                                          ),






                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.065, 0, 0, 0),
                                                height: 25,
                                                width: 3,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  //borderRadius: new BorderRadius.circular(0),
                                                ),
                                              ),

                                            ],

                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, 0, 0),
                                                height: 50.0,
                                                width: 50.0,

                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  borderRadius: BorderRadius.circular(50),

                                                ),

                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(Icons.done_outlined,
                                                        color: mainColor),
                                                  ],

                                                ),


                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, 0, 0, 0),
                                                child: const Text("Confirmation",style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: fontFam),
                                                ),

                                              ),

                                            ],
                                          ),

                                        ],


                                      ),

                                    ),
                                  ],

                                ),
                              ],
                            ),
                            const footer(),
                          ],
                        ),


                      ],
                    ),
                  ),

                  ),
                ),

              );
            }
        )
    );
  }
}

