import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpresignup.dart';

import 'security.dart';
import 'security.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _MyAppState();
}

class _MyAppState extends State<Signup> {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _usernameController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context) {
            return Scaffold(

              body: SingleChildScrollView(
                child: SafeArea(child:
                Container(
                  color: Colors.white,
                  // child: Center(child: Text("PROCOLLAB",style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold))),
                  child:
                  Row(
                    children: [

                      Column(
                        children: [
                          const header(),
                          Row(
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
                                            color: mainColor,
                                            // border: Border.all(color: mainColor, width: 2.5),
                                            borderRadius: BorderRadius.circular(50),

                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.email_outlined,
                                                  color: Colors.white),
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
                                            color: Colors.white,
                                            // border: Border.all(color: mainColor, width: 2.5),
                                            borderRadius: BorderRadius.circular(50),

                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.details,
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

                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.1, 0, 0),
                                    height: MediaQuery.of(context).size.height*0.80,
                                    width: MediaQuery.of(context).size.width*0.4,
                                    color: const Color(0xFFF7F8FB),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.2, MediaQuery.of(context).size.height*0.15, 0, 0),
                                              child: const Text("Work Better Together",style: TextStyle(fontSize:35,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                            )
                                          ],
                                        ),

                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.05, 0, 0),
                                          child: const Text("Please enter your Username and Email Address below",style: TextStyle(fontSize:15,color:Colors.black45,fontWeight: FontWeight.normal,fontFamily: fontFam)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.10, MediaQuery.of(context).size.height*0.03, 0, 0),
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context).size.height*0.4,
                                              width: MediaQuery.of(context).size.height*0.6,
                                              child: Form(
                                                key: _formKey,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: MediaQuery.of(context).size.height*0.025,
                                                    ),

                                                    TextFormField(
                                                      controller:_usernameController ,
                                                      decoration:  const InputDecoration(

                                                          icon: Icon(Icons.person, color: secondaryColor,),
                                                          hintText: 'Enter your username',
                                                          labelText: 'Username',
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
                                                          return 'Please enter your user name';
                                                        }
                                                        return null;
                                                      },
                                                    ),

                                                    SizedBox(
                                                      height: MediaQuery.of(context).size.height*0.025,
                                                    ),




                                                    TextFormField(

                                                      controller:_emailController ,
                                                      decoration:  const InputDecoration(
                                                          icon: Icon(Icons.email_outlined, color: secondaryColor,),
                                                          hintText: 'Enter your Email Address',
                                                          labelText: 'Email',
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
                                                        if (value != null && value.isNotEmpty) {
                                                          final RegExp regex =
                                                          RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                                          if (!regex.hasMatch(value!)) {
                                                            return 'Enter a valid email e.g name@gmail.com';
                                                          } else {
                                                            return null;
                                                          }
                                                        } else {
                                                          return 'Enter a valid email e.g name@gmail.com';
                                                        }},
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.2, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                      height: MediaQuery.of(context).size.height*0.04,
                                                      width: MediaQuery.of(context).size.width*0.1,
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
                                                              var uname = _usernameController.text;
                                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> security(emailController: _emailController, userName: _usernameController,uname: uname)));
                                                              setState(() {

                                                              });


                                                            }
                                                            //sign_up();

                                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> security(emailController: _emailController,)));
                                                            // setState(() {
                                                            //
                                                            // });


                                                          },
                                                          child: const Text(
                                                            "Continue",
                                                            style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                                          ),
                                                        ),
                                                      ),
                                                    ),


                                                  ],
                                                ),
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
      ),
    );

  }
}





