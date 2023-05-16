import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/posts.dart';
import 'package:procollab_web/authentication/Reset.dart';
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
  runApp(const SignIn());
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";

  final _formKey = GlobalKey<FormState>();


  final TextEditingController _emailController=new TextEditingController();
  final TextEditingController _passwordController=new TextEditingController();

  bool _passwordIsValid=true;

  void _validatePassword(String ppassword){
    setState(() {
      _passwordIsValid = ppassword =="correct_password";
    });
  }

  Future<void> sign_in() async
  {
    try
    {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ).then((value){
        print("Login Successful");
        Navigator.push(context, MaterialPageRoute(builder: (context)=> PostsMain()));
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> CSMain()));
      });
    }

    catch(e)
    {
      print("Login UNSUCCESSFUL");
      setState(() {

      });
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
                                                const Icon(Icons.person,
                                                    color: Colors.white),
                                              ],

                                            ),


                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.1, 0, 0),
                                            child: const Text("Login",style: TextStyle(fontSize:18,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam),
                                            ),

                                          ),

                                        ],
                                      ),


                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.05, 0, 0),
                                        child: const Text("Please enter your Email Address and password below",style: TextStyle(fontSize:15,color:Colors.black45,fontWeight: FontWeight.normal,fontFamily: fontFam)),
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

                                                        icon: Icon(Icons.person, color: secondaryColor,),
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
                                                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                                      if (!emailRegex.hasMatch(value)) {
                                                        return 'Please enter a valid email address';
                                                      }
                                                      return null;
                                                    },
                                                  ),

                                                  SizedBox(
                                                    height: MediaQuery.of(context).size.height*0.025,
                                                  ),




                                                  TextFormField(
                                                    obscureText: true,
                                                    controller: _passwordController,
                                                    decoration: InputDecoration(
                                                      icon: Icon(Icons.email_outlined, color: secondaryColor,),
                                                      hintText: 'Enter your Password',
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
                                                      focusedErrorBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.red, width: 1),
                                                        // borderRadius: BorderRadius.circular(0),
                                                      ),
                                                      errorBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.red, width: 1),
                                                        //borderRadius: BorderRadius.circular(15),
                                                      ),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter a password';
                                                      }
                                                      if (value.length < 8) {
                                                        return 'Password must be at least 8 characters long';
                                                      }
                                                      if (!value.contains(new RegExp(r'[A-Z]'))) {
                                                        return 'Password must contain at least one uppercase letter';
                                                      }
                                                      if (!value.contains(new RegExp(r'[a-z]'))) {
                                                        return 'Password must contain at least one lowercase letter';
                                                      }
                                                      if (!value.contains(new RegExp(r'[0-9]'))) {
                                                        return 'Password must contain at least one number';
                                                      }
                                                      return null;
                                                    },
                                                    onChanged: _validatePassword,
                                                  ),



                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.0225, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                        height: MediaQuery.of(context).size.height*0.033,
                                                        width: MediaQuery.of(context).size.width*0.075,

                                                        child: const Center(
                                                          child: Text(
                                                            "Forgot Password?",
                                                            style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.black54, fontWeight: FontWeight.w500),
                                                          ),
                                                        ),
                                                      ),

                                                      Container(
                                                        margin: EdgeInsets.only(top: 20),
                                                        child: ElevatedButton(

                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) => reset()),
                                                            );
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            primary: mainColor, // Change this to the desired color
                                                            minimumSize: Size(
                                                              MediaQuery.of(context).size.width * 0.025, // Change this to the desired width
                                                              MediaQuery.of(context).size.height * 0.033, // Change this to the desired height
                                                            ),
                                                            fixedSize: Size(
                                                              MediaQuery.of(context).size.width * 0.055, // Change this to the desired width
                                                              MediaQuery.of(context).size.height * 0.035, // Change this to the desired height
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10), // Change this to the desired border radius
                                                            ),
                                                          ),

                                                          child: const Center(
                                                            child: Text(
                                                              "Reset",
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


                                                  Row(
                                                    children: [
                                                      Container(

                                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.0225, MediaQuery.of(context).size.height*0.020, 0, 0),
                                                        height: MediaQuery.of(context).size.height*0.033,
                                                        width: MediaQuery.of(context).size.width*0.094,

                                                        child: const Center(
                                                          child: Text(
                                                            "Don't have an Account?",
                                                            style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.black54, fontWeight: FontWeight.w500),
                                                          ),



                                                        ),
                                                      ),

                                                      Container(
                                                        margin: EdgeInsets.only(top: 20),
                                                        child: ElevatedButton(

                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) => Signup()),
                                                            );
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            primary: mainColor, // Change this to the desired color
                                                            minimumSize: Size(
                                                              MediaQuery.of(context).size.width * 0.025, // Change this to the desired width
                                                              MediaQuery.of(context).size.height * 0.033, // Change this to the desired height
                                                            ),
                                                            fixedSize: Size(
                                                              MediaQuery.of(context).size.width * 0.055, // Change this to the desired width
                                                              MediaQuery.of(context).size.height * 0.035, // Change this to the desired height
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10), // Change this to the desired border radius
                                                            ),
                                                          ),

                                                          child: const Center(
                                                            child: Text(
                                                              "Register",
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


                                                  Row(
                                                    children: [

                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.15, MediaQuery.of(context).size.height*0.04, 0, 0),
                                                        height: MediaQuery.of(context).size.height*0.04,
                                                        width: MediaQuery.of(context).size.width*0.06,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(color: secondaryColor, width: 1.5),
                                                          borderRadius: new BorderRadius.circular(10),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(fontSize: 13, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w500),
                                                          ),
                                                        ),
                                                      ),




                                                      InkWell(

                                                        child: Container(
                                                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.04, 0, 0),
                                                          height: MediaQuery.of(context).size.height*0.04,
                                                          width: MediaQuery.of(context).size.width*0.06,
                                                          decoration: BoxDecoration(
                                                            color: mainColor,
                                                            borderRadius: new BorderRadius.circular(10),
                                                          ),

                                                          child: const Center(
                                                            child: Text(
                                                              "LOG IN",
                                                              style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                                            ),

                                                          ),

                                                        ),

                                                        onTap: () {

                                                          if (_formKey.currentState!.validate()) {

                                                            sign_in();

                                                            setState(() {

                                                            });

                                                          }

                                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> const PostsMain()));
                                                          // It returns true if the form is valid, otherwise returns false


                                                          // if (_formKey.currentState!.validate()) {
                                                          //   // If the form is valid, display a Snackbar.
                                                          //   print(_emailController.text);
                                                          //   print(_passwordController.text);
                                                          // }



                                                        },


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
