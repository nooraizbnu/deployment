import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

class ProgressSt extends StatefulWidget {
  const ProgressSt({Key? key}) : super(key: key);

  @override
  State<ProgressSt> createState() => _ProgressStState();
}

class _ProgressStState extends State<ProgressSt> {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        SingleChildScrollView(
            child: Container(
              color: Colors.white60,
              child:
              Column(
                children: [

                  Row(
                    children: [

                      // PROJECT DETAILS BOXES ON LEFT SIDE
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.6,
                            width: MediaQuery.of(context).size.width*0.30,
                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.17, MediaQuery.of(context).size.height*0.05, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: mainColor, width: 2.5),
                              borderRadius: new BorderRadius.circular(10),
                            ),

                            child:
                            Column(
                              children: [

                                //WORKBOOK PROJECT HEADING
                                Row(
                                  children: [

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.11, MediaQuery.of(context).size.height*0.025, 0, 0),
                                        child: Text("Workbook Project", style: TextStyle(fontSize: 16, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                    ),
                                  ],
                                ),


                                //COLLABORATORS HEADING
                                Row(
                                  children: [

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.128, MediaQuery.of(context).size.width*0.015, 0, 0),
                                        child: Text("Collaborators", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                    ),
                                  ],
                                ),


                                //COLLABORATOR NAMES
                                Row(
                                  children: [

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.038, MediaQuery.of(context).size.width*0.005, 0, 0),
                                        child: Text("Muhammad Nooraiz Asghar", style: TextStyle(fontSize: 10, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                    ),

                                    Container(
                                      height: MediaQuery.of(context).size.height*0.02,
                                      width: MediaQuery.of(context).size.width*0.001,
                                      color: mainColor,
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.005, MediaQuery.of(context).size.height*0.01, 0, 0),
                                    ),

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.005, MediaQuery.of(context).size.width*0.005, 0, 0),
                                        child: Text("Muhammad Arham Latif", style: TextStyle(fontSize: 10, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                    ),

                                    Container(
                                      height: MediaQuery.of(context).size.height*0.02,
                                      width: MediaQuery.of(context).size.width*0.001,
                                      color: mainColor,
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.005, MediaQuery.of(context).size.height*0.01, 0, 0),
                                    ),


                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.005, MediaQuery.of(context).size.width*0.005, 0, 0),
                                        child: Text("Saliha Shahzad", style: TextStyle(fontSize: 10, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                    ),

                                  ],
                                ),


                                //LINE BELOW COLLABORATOR NAMES
                                Row(
                                  children: [
                                    Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width*0.24,
                                      color: mainColor,
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.0265, MediaQuery.of(context).size.height*0.005, 0, 0),
                                    )
                                  ],
                                ),


                                //YOUR PROGRESS HEADING
                                Row(
                                  children: [

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.11, MediaQuery.of(context).size.width*0.01, 0, 0),
                                        child: Text("YOUR PROGRESS", style: TextStyle(fontSize: 16, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                    ),
                                  ],
                                ),


                                //PROGRESS REPORT CIRCLE
                                Row(
                                  children: [

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.105, MediaQuery.of(context).size.height*0.015, 0, 0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 2.0,
                                          percent: 0.33,
                                          center: Container(width: MediaQuery.of(context).size.width*0.04, height: MediaQuery.of(context).size.height*0.08, child: Center(child: new Text("33%", style: TextStyle(fontSize: 20, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),))),
                                          progressColor: mainColor,
                                        )
                                    ),


                                  ],
                                ),



                                //YOUR TAKS HEADING
                                Row(
                                  children: [

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.025, MediaQuery.of(context).size.height*0.025, 0, 0),
                                        child: Text("Your Tasks", style: TextStyle(fontSize: 14, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                    ),
                                  ],
                                ),


                                //TASK 1 BELOW YOUR TASKS
                                Row(
                                  children: [

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.025, MediaQuery.of(context).size.width*0.01, 0, 0),
                                        child: Text("Task 1: Gather data related to the Project", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)
                                    ),

                                    Container(
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.045, MediaQuery.of(context).size.height*0.015, 0, 0),
                                      height: MediaQuery.of(context).size.height*0.025,
                                      width: MediaQuery.of(context).size.width*0.05,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF71FF99),
                                        borderRadius: new BorderRadius.circular(2.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Completed",
                                          style: TextStyle(fontSize: 10, fontFamily: fontFam, color: Colors.green, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),


                                //TASK 2 BELOW TASK 1
                                Row(
                                  children: [

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.025, MediaQuery.of(context).size.width*0.01, 0, 0),
                                        child: Text("Task 2: Conduct research on which\n              AI Model needs to be trained", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)
                                    ),

                                    Container(
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.0615, MediaQuery.of(context).size.height*0.015, 0, 0),
                                      height: MediaQuery.of(context).size.height*0.025,
                                      width: MediaQuery.of(context).size.width*0.05,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFCFF98),
                                        borderRadius: new BorderRadius.circular(2.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "In Progress",
                                          style: TextStyle(fontSize: 10, fontFamily: fontFam, color: Color(0XFFBEC300), fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),


                                //TASK 3 BELOW TASK 2
                                Row(
                                  children: [

                                    Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.025, MediaQuery.of(context).size.width*0.01, 0, 0),
                                        child: Text("Task 3: Start AI Model Training", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)
                                    ),

                                    Container(
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.0815, MediaQuery.of(context).size.height*0.015, 0, 0),
                                      height: MediaQuery.of(context).size.height*0.025,
                                      width: MediaQuery.of(context).size.width*0.05,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF9292),
                                        borderRadius: new BorderRadius.circular(2.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Pending",
                                          style: TextStyle(fontSize: 10, fontFamily: fontFam, color: Color(0xFFFF1919), fontWeight: FontWeight.w600),
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


                      // PROJECTS (Text Side)
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

                            child: Center(child: Text("PROGRESS", style: TextStyle(fontSize: 20, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),)),

                          ),

                          Container(
                            width: MediaQuery.of(context).size.width*0.28,
                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.05, 0, 0),
                            child: Center(child: Text(
                              "View your progress as you work along on your project."

                                  "\n\n\nChange the status of your tasks."

                                  "\n\n\nSee the task status and the percentage of project you have completed based on those tasks."

                                  "\n\n\nSee people you are collaborating with on the project under the project name.",

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
       );
    }
}
