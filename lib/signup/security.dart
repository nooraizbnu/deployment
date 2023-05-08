import 'dart:html';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpresignup.dart';
import 'package:procollab_web/signup/credentials.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Personal.dart';
class security extends StatefulWidget {
  TextEditingController emailController;
  TextEditingController userName;
  String uname;

  security( {Key? key,required this.emailController, required this.userName, required this.uname}) : super(key: key);

  @override
  State<security> createState() => _securityState(userName: this.userName, uname: this.uname);
}

class _securityState extends State<security> {
  TextEditingController userName;
  String uname;
  _securityState({required this.userName, required this.uname});

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";

  //final TextEditingController _usernameController=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController=widget.emailController;

  }

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();


  Future<User?> signup() async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text);

      print("Account created Successfully");

      userCrendetial.user!.updateDisplayName(uname);

      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        "name": userName.toString(),
        "email": _emailController,
        "status": "Unavailable",
        "uid": _auth.currentUser!.uid,
      });

      return userCrendetial.user;
    } catch (e) {
      print(e);
      return null;
    }
  }


  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;
  bool validatePassword(String pass){
    String _password = pass.trim();
    if(_password.isEmpty){
      setState(() {
        password_strength = 0;
      });
    }else if(_password.length < 6 ){
      setState(() {
        password_strength = 1 / 4;
      });
    }else if(_password.length < 8){
      setState(() {
        password_strength = 2 / 4;
      });
    }else{
      if(pass_valid.hasMatch(_password)){
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      }else{
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
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
                                                  children: [
                                                    const Icon(Icons.lock,
                                                        color: Colors.white),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.width*0.03, 0, 0),
                                                child: const Text("Security",style: TextStyle(fontSize:32,color: mainColor,fontWeight: FontWeight.bold,fontFamily: fontFam),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children:[
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.17, MediaQuery.of(context).size.height*0.04, 0, 0),
                                                child: const Text("Create your password for access.",style: TextStyle(fontSize:15,color:Colors.black45,fontWeight: FontWeight.normal,fontFamily: fontFam)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.11, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context).size.height*0.5,
                                                width: MediaQuery.of(context).size.height*0.6,
                                                child: Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      // SizedBox(
                                                      //   height: MediaQuery.of(context).size.height*0.01,
                                                      // ),
                                                      Padding(padding: const EdgeInsets.all(15.0),
                                                        child: TextFormField(
                                                          controller:_passwordController ,
                                                          obscureText: true,
                                                          onChanged: (value){
                                                            _formKey.currentState!.validate();
                                                          },
                                                          validator: (value){
                                                            if(value!.isEmpty){
                                                              return "Please enter password";
                                                            }else{
                                                              //call function to check password
                                                              bool result = validatePassword(value);
                                                              if(result){
                                                                // create account event
                                                                return null;
                                                              }else{
                                                                return " The following is missing in your password:\n "
                                                                    "- A capital letter\n "
                                                                    "- A digit\n "
                                                                    "- A special character";
                                                              }
                                                            }
                                                          },
                                                          decoration: const InputDecoration(border: OutlineInputBorder(),
                                                            icon: Icon(Icons.password_outlined, color: secondaryColor,),
                                                            hintText: "Please create a password",
                                                            labelText: 'Password',
                                                            labelStyle: TextStyle(color: secondaryColor),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(width: 1, color: secondaryColor),
                                                              // borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(

                                                              borderSide: BorderSide(width: 1, color: mainColor),
                                                              //borderRadius: BorderRadius.circular(15),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(padding: const EdgeInsets.all(12.0),
                                                        child: LinearProgressIndicator(
                                                          value: password_strength,
                                                          backgroundColor: Colors.grey[300],
                                                          minHeight: 5,
                                                          color: password_strength <= 1 / 4
                                                              ? Colors.red
                                                              : password_strength == 2 / 4
                                                              ? Colors.yellow
                                                              : password_strength == 3 / 4
                                                              ? Colors.blue
                                                              : Colors.green,
                                                        ),
                                                      ),
                                                      Row(
                                                        children:[
                                                          Container(
                                                            alignment: Alignment.center,
                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.02, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                            child: const Text("How to create a secure password:",style: TextStyle(fontSize:15,color:Colors.black,fontWeight: FontWeight.bold,fontFamily: fontFam)),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children:[
                                                          Container(
                                                            alignment: Alignment.center,
                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.02, MediaQuery.of(context).size.height*0.005, 0, 0),
                                                            child: const Text("-Use special characters and capital letters.",style: TextStyle(fontSize:15,color:Colors.black45,fontWeight: FontWeight.normal,fontFamily: fontFam)),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children:[
                                                          Container(
                                                            alignment: Alignment.center,
                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.02, MediaQuery.of(context).size.height*0.005, 0, 0),
                                                            child: const Text("-Avoid number sequences and your date of birth.",style: TextStyle(fontSize:15,color:Colors.black45,fontWeight: FontWeight.normal,fontFamily: fontFam)),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children:[
                                                          Container(
                                                            alignment: Alignment.center,
                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.02, MediaQuery.of(context).size.height*0.005, 0, 0),
                                                            child: const Text("-Use numbers.",style: TextStyle(fontSize:15,color:Colors.black45,fontWeight: FontWeight.normal,fontFamily: fontFam)),
                                                          ),
                                                        ],
                                                      ),

                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.18, MediaQuery.of(context).size.height*0.05, 0, 0),
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
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                                                                  //Navigator.pop(context);
                                                                  setState(() {

                                                                  });
                                                                },
                                                                child: const Text(
                                                                  "Back",
                                                                  style: TextStyle(fontSize: 13, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w400),
                                                                ),

                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                            height: MediaQuery.of(context).size.height*0.035,
                                                            width: MediaQuery.of(context).size.width*0.05,
                                                            decoration: BoxDecoration(
                                                              color: mainColor,
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            child: Center(
                                                              child: InkWell(
                                                                onTap: (){
                                                                  if (_formKey.currentState!.validate()) {
                                                                    //   ScaffoldMessenger.of(context).showSnackBar(
                                                                    //     const SnackBar(content: Text('Processing Data')),
                                                                    // );


                                                                    signup();
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (
                                                                                context) =>
                                                                                Personal(
                                                                                  userName: userName,
                                                                                  emailController: _emailController,)));
                                                                    setState(() {

                                                                    });
                                                                  }
                                                                },
                                                                child: const Text(
                                                                  "Next",
                                                                  style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
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
                                                  children: [
                                                    const Icon(Icons.email_outlined,
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
                                                  color: mainColor,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  borderRadius: BorderRadius.circular(50),

                                                ),

                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(Icons.lock,
                                                        color: Colors.white),
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
                                                  children: [
                                                    const Icon(Icons.person,
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
                                                  color: Colors.white,
                                                  // border: Border.all(color: mainColor, width: 2.5),
                                                  borderRadius: BorderRadius.circular(50),

                                                ),

                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(Icons.details,
                                                        color: mainColor),
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
                                                  children: [
                                                    const Icon(Icons.done_outlined,
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
                            footer(),
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
