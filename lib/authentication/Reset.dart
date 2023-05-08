import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/posts.dart';
import 'package:procollab_web/authentication/singin.dart';
import 'package:procollab_web/contributorside/home.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/signup/credentials.dart';
import '../headerfooter/headerpresignup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
        projectId: "fir-authentication-ef41b",
        messagingSenderId: "712311594484",
        appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
      )
  );
  runApp(const reset());
}

class reset extends StatefulWidget {
  const reset({Key? key}) : super(key: key);

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";

  final _formKey = GlobalKey<FormState>();


  final TextEditingController _emailController=new TextEditingController();
  final TextEditingController _passwordController=new TextEditingController();


  String _inputValue = '';

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Sending email"),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );

      },

    );

    try {
      // Send the password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );


      Navigator.of(context).pop();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 20),
                Text("Email sent"),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      // Hide the success message after a short delay
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => SignIn(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      // Close the loading dialog and show an error message
      Navigator.of(context).pop(); // close the dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Builder(
              builder: (context) {
                return Scaffold(
                  body: SafeArea(child:
                  SingleChildScrollView(
                    child: Container(
                      child:
                      Column(
                        children: [
                          const header(),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.17, MediaQuery.of(context).size.height*0.1, 0, 0),
                                    height: MediaQuery.of(context).size.height*0.75,
                                    width: MediaQuery.of(context).size.width*0.25,
                                    color: secondaryColor,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.09, MediaQuery.of(context).size.height*0.2, 0, 0),
                                                height: 100.0,
                                                width: 100.0,
                                                child:
                                                const CircleAvatar(
                                                  backgroundImage: AssetImage("logo.png"),
                                                  backgroundColor: Colors.white,
                                                )
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.085, MediaQuery.of(context).size.width*0.025, 0, 0),
                                              child: Row(

                                                  children: [const Center(child: Text("PROCOLLAB",style: TextStyle(fontSize:22,color: Colors.white,fontWeight: FontWeight.bold))),]
                                              ),
                                            ),
                                          ],
                                        ),


                                        Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.0625, MediaQuery.of(context).size.height*0.05, 0, 0),
                                              child: const Text("Work Better Together",style: TextStyle(fontSize:20,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                            )
                                          ],
                                        ),

                                      ],

                                    ),

                                  ),

                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.1, 0, 0),
                                    height: MediaQuery.of(context).size.height*0.75,
                                    width: MediaQuery.of(context).size.width*0.4,
                                    color: const Color(0xFFF7F8FB),
                                    child: Column(
                                      children: [

                                        Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.125, MediaQuery.of(context).size.height*0.1, 0, 0),
                                              height: 50.0,
                                              width: 50.0,

                                              decoration: BoxDecoration(
                                                color: mainColor,
                                                // border: Border.all(color: mainColor, width: 2.5),
                                                borderRadius: new BorderRadius.circular(50),

                                              ),

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.lock_reset_outlined,
                                                      color: Colors.white),
                                                ],

                                              ),


                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.1, 0, 0),
                                              child: const Text("Reset Password",style: TextStyle(fontSize:18,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam),
                                              ),

                                            ),

                                          ],
                                        ),


                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.05, 0, 0),
                                          child: const Text("Please enter your Email Address below",style: TextStyle(fontSize:15,color:Colors.black45,fontWeight: FontWeight.normal,fontFamily: fontFam)),
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
                                                      controller:_emailController ,
                                                      decoration:  const InputDecoration(

                                                          icon: Icon(Icons.email, color: secondaryColor,),
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
                                                        if (value!.isEmpty) {
                                                          return 'Please enter your Email Address';
                                                        }
                                                        return null;
                                                      },
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _inputValue = value;
                                                        });
                                                      },
                                                    ),

                                                    SizedBox(
                                                      height: MediaQuery.of(context).size.height*0.025,
                                                    ),







                                                    Row(
                                                      children: [


                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.12, MediaQuery.of(context).size.width * 0.025, 0, 0),
                                                          child: ElevatedButton(


                                                            onPressed: () {
                                                              if (_formKey.currentState!.validate()) {
                                                                // Perform some action when the input is valid
                                                                resetPassword();
                                                              }
                                                            },

                                                            style: ElevatedButton.styleFrom(
                                                              primary: mainColor, // Change this to the desired color
                                                              minimumSize: Size(
                                                                MediaQuery.of(context).size.width * 0.025, // Change this to the desired width
                                                                MediaQuery.of(context).size.height * 0.033, // Change this to the desired height
                                                              ),
                                                              fixedSize: Size(
                                                                MediaQuery.of(context).size.width * 0.085, // Change this to the desired width
                                                                MediaQuery.of(context).size.height * 0.055, // Change this to the desired height
                                                              ),
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10), // Change this to the desired border radius
                                                              ),
                                                            ),

                                                            child: const Center(
                                                              child: Text(
                                                                "Reset Password",
                                                                style: TextStyle(
                                                                    fontSize: 13,
                                                                    fontFamily: fontFam,
                                                                    color:Colors.white,
                                                                    fontWeight: FontWeight
                                                                        .w500),
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

                                  ),

                                ],
                              ),


                            ],
                          ),
                          const footer(),
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