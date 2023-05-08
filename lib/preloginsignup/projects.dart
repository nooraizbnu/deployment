import 'package:flutter/material.dart';

class ProjectsSt extends StatefulWidget {
  const ProjectsSt({Key? key}) : super(key: key);

  @override
  State<ProjectsSt> createState() => _ProjectsStState();
}

class _ProjectsStState extends State<ProjectsSt> {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //debugShowCheckedModeBanner: false,
              child:
              SingleChildScrollView(
                child: Container(
                  color: Colors.white60,
                  child:
                  SizedBox(
                    child: Column(
                      children: [

                        Row(
                          children: [


                            //PROJECT DETAILS BOXES ON LEFT SIDE
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.17, MediaQuery.of(context).size.height*0.1, 0, 0),
                                  height: MediaQuery.of(context).size.height*0.25,
                                  width: MediaQuery.of(context).size.width*0.30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: mainColor, width: 2.5),
                                    borderRadius: new BorderRadius.circular(10),
                                  ),

                                  child: Column(

                                    children: [
                                      Row(
                                        children: [

                                          // IMAGE CONTAINER
                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.015, 0, 0),
                                            child: ClipRRect(
                                              borderRadius: new BorderRadius.circular(100),
                                              child: Image(
                                                height: 40,
                                                width: 40,
                                                image: NetworkImage(
                                                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                                              ),
                                            ),
                                          ),

                                          Column(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.015, 0, 0),
                                                  child: Text("Meladi Hadid", style: TextStyle(fontSize: 14, color: mainColor, fontWeight: FontWeight.w400),)
                                              ),
                                              Container(
                                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, 0, 0, 0),
                                                  child: Text("BS Computer Science", style: TextStyle(fontSize: 12, color: mainColor, fontWeight: FontWeight.w100),)
                                              ),
                                            ],

                                          ),

                                          Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.10, MediaQuery.of(context).size.width*0.01, 0, 0),
                                              child: Text("\$100", style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.w200),)
                                          )

                                        ],
                                      ),


                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.015, 0, 0),
                                            height: 2.5,
                                            width: MediaQuery.of(context).size.width*0.25,
                                            color: mainColor,
                                          )
                                        ],

                                      ),


                                      Row(
                                        children: [
                                          Center(
                                            child: Container(
                                              width: MediaQuery.of(context).size.width*0.25,
                                              height: MediaQuery.of(context).size.height*0.09,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.02, 0, 0),
                                              child: Text(
                                                "TWI is a world leading research and technology business, internationally renowned for its expertise in structural integrity, materials and joining technologies. The TWI provides research, innovation, testing, software and consultancy services to develop new technologies, improve existing industrial processes and ensure safe and profitable operation of engineering assets.",
                                                style: TextStyle(fontSize: 10, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w300),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),



                                      Row(
                                        children: [

                                          Center(
                                            child: Container(
                                              width: MediaQuery.of(context).size.width*0.1,
                                              height: MediaQuery.of(context).size.height*0.02,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, 0, 0, 0),
                                              child: Text(
                                                "2 Contributors Required",
                                                style: TextStyle(fontSize: 13, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.025, MediaQuery.of(context).size.height*0.005, 0, 0),
                                            height: MediaQuery.of(context).size.height*0.033,
                                            width: MediaQuery.of(context).size.width*0.06,
                                            decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius: new BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Chat",
                                                style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),


                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.005, MediaQuery.of(context).size.height*0.005, 0, 0),
                                            height: MediaQuery.of(context).size.height*0.033,
                                            width: MediaQuery.of(context).size.width*0.06,
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius: new BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Details",
                                                style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),


                                    ],
                                  ),


                                ),




                                // LINE BETWEEN THE BOXES
                                Container(
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.17, MediaQuery.of(context).size.height*0.05, 0, 0),
                                  height: 2.5,
                                  width: MediaQuery.of(context).size.width*0.30,
                                  color: mainColor,
                                ),

                                Container(
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.17, MediaQuery.of(context).size.height*0.05, 0, 0),
                                  height: MediaQuery.of(context).size.height*0.25,
                                  width: MediaQuery.of(context).size.width*0.30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: mainColor, width: 2.5),
                                    borderRadius: new BorderRadius.circular(10),
                                  ),

                                  child: Column(

                                    children: [
                                      Row(
                                        children: [

                                          // IMAGE CONTAINER
                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.015, 0, 0),
                                            child: ClipRRect(
                                              borderRadius: new BorderRadius.circular(100),
                                              child: Image(
                                                height: 40,
                                                width: 40,
                                                image: NetworkImage(
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/John_Krasinski_2018.png/330px-John_Krasinski_2018.png"),
                                              ),
                                            ),
                                          ),

                                          Column(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.015, 0, 0),
                                                  child: Text("John Krasinski", style: TextStyle(fontSize: 14, color: mainColor, fontWeight: FontWeight.w400),)
                                              ),
                                              Container(
                                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, 0, 0, 0),
                                                  child: Text("BS Architecture Design", style: TextStyle(fontSize: 12, color: mainColor, fontWeight: FontWeight.w100),)
                                              ),
                                            ],

                                          ),

                                          Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.09, MediaQuery.of(context).size.width*0.01, 0, 0),
                                              child: Text("Unpaid", style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.w200),)
                                          )

                                        ],
                                      ),


                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.015, 0, 0),
                                            height: 2.5,
                                            width: MediaQuery.of(context).size.width*0.25,
                                            color: mainColor,
                                          )
                                        ],

                                      ),


                                      Row(
                                        children: [
                                          Center(
                                            child: Container(
                                              width: MediaQuery.of(context).size.width*0.25,
                                              height: MediaQuery.of(context).size.height*0.09,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.02, 0, 0),
                                              child: Text(
                                                "Study and transform data science prototypes. Design machine learning systems. Research and implement appropriate AI/ML algorithms and tools. Develop machine learning applications according to requirements."
                                                    "Select appropriate datasets and data representation methods. Run AI tests and experiments. Perform statistical analysis and fine-tuning using test results.",
                                                style: TextStyle(fontSize: 10, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w300),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),



                                      Row(
                                        children: [

                                          Center(
                                            child: Container(
                                              width: MediaQuery.of(context).size.width*0.1,
                                              height: MediaQuery.of(context).size.height*0.02,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, 0, 0, 0),
                                              child: Text(
                                                "3 Contributors Required",
                                                style: TextStyle(fontSize: 13, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w900),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.025, MediaQuery.of(context).size.height*0.005, 0, 0),
                                            height: MediaQuery.of(context).size.height*0.033,
                                            width: MediaQuery.of(context).size.width*0.06,
                                            decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius: new BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Chat",
                                                style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),


                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.005, MediaQuery.of(context).size.height*0.005, 0, 0),
                                            height: MediaQuery.of(context).size.height*0.033,
                                            width: MediaQuery.of(context).size.width*0.06,
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius: new BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Collab",
                                                style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),


                                    ],
                                  ),


                                )

                              ],

                            ),


                            //PROJECTS (Text Side)
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.05, 0, 0),
                                  height: MediaQuery.of(context).size.height*0.1,
                                  width: MediaQuery.of(context).size.width*0.30,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    // border: Border.all(color: mainColor, width: 2.5),
                                    borderRadius: new BorderRadius.circular(10),
                                  ),

                                  child: Center(child: Text("PROJECTS", style: TextStyle(fontSize: 20, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),)),

                                ),

                                Container(
                                  width: MediaQuery.of(context).size.width*0.28,
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.05, 0, 0),
                                  child: Center(child: Text(
                                    "At any time, there are hundreds and thousands of projects going on around the world. Work together with people from around the globe and help them in their projects."
                                        "\n\n\nSee multiple projects posted from around the world and work on any project from your area of expertise."
                                        "\n\n\nAll while gaining experience and exposure to enhance your profile and skills."
                                        "\n\n\nGet paid for projects that offer monetary value.",
                                    style: TextStyle(fontSize: 16, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)),

                                ),


                              ],

                            ),


                          ],
                        ),

                      ],
                    ),
                  ),


                ),
              ),
    );
  }
}


