import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/posts.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpresignup.dart';

class confirmation extends StatefulWidget {
  const confirmation ({Key? key}) : super(key: key);

  @override
  State<confirmation > createState() => _confirmationState();
}

class _confirmationState extends State<confirmation > {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";

  final _formKey = GlobalKey<FormState>();
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
                                            color: Colors.white,
                                            // border: Border.all(color: mainColor, width: 2.5),
                                            borderRadius: new BorderRadius.circular(50),

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
                                            borderRadius: new BorderRadius.circular(50),

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
                                            borderRadius: new BorderRadius.circular(50),

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
                                            borderRadius: new BorderRadius.circular(50),

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
                                            color: mainColor,
                                            // border: Border.all(color: mainColor, width: 2.5),
                                            borderRadius: new BorderRadius.circular(50),

                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.done_outlined,
                                                  color: Colors.white),
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
                                            Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.15, MediaQuery.of(context).size.height*0.15, 0, 0),
                                                  height: MediaQuery.of(context).size.width*0.10,
                                                  width: MediaQuery.of(context).size.width*0.10,
                                                  decoration: BoxDecoration(
                                                    color: mainColor,
                                                    borderRadius: new BorderRadius.circular(100),
                                                  ),


                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const [
                                                      Icon(Icons.done,
                                                        color: Colors.white,
                                                        size: 100,),
                                                    ],

                                                  ),

                                                ),

                                              ],
                                            ),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.275, MediaQuery.of(context).size.height*0.03, 0, 0),
                                              child: const Text("Confirmation",style: TextStyle(fontSize:35,color: mainColor,fontWeight: FontWeight.bold,fontFamily: fontFam)),

                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.25, MediaQuery.of(context).size.height*0.03, 0, 0),
                                              child: const Text("Your registration has been completed!",style: TextStyle(fontSize:15,color:Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.20, MediaQuery.of(context).size.height*0.03, 0, 0),
                                              child: const Text("Confirm your account via the link sent to your email.",style: TextStyle(fontSize:15,color:Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.05, 0, 0),
                                          height: MediaQuery.of(context).size.height*0.04,
                                          width: MediaQuery.of(context).size.width*0.08,
                                          decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius: new BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const PostsMain()));
                                                setState(() {

                                                });
                                              },
                                              child: const Text(
                                                "Confirm",
                                                style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                              ),

                                            ),
                                          ),
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

