import 'package:flutter/material.dart';

class TaskSt extends StatefulWidget {
  const TaskSt({Key? key}) : super(key: key);

  @override
  State<TaskSt> createState() => _TaskStState();
}

class _TaskStState extends State<TaskSt> {

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

                    // TASK DETAILS ON LEFT SIDE (TEXT SIDE)
                    Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.17, MediaQuery.of(context).size.height*0.05, 0, 0),
                                height: MediaQuery.of(context).size.height*0.1,
                                width: MediaQuery.of(context).size.width*0.30,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  // border: Border.all(color: mainColor, width: 2.5),
                                  borderRadius: new BorderRadius.circular(10),
                                ),

                                child: Center(child: Text("TASKS", style: TextStyle(fontSize: 20, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),)),

                              ),

                              Container(
                                width: MediaQuery.of(context).size.width*0.28,
                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.17, MediaQuery.of(context).size.height*0.05, 0, 0),
                                child: Center(child: Text(
                                  "Define your tasks for better understanding and project management."
                                      "\n\n\nChange task statuses according to the task you have completed, are currently working on or are done with."
                                      "\n\n\nEnter task title and description/details."
                                      "\n\n\nYou can also specify the estimated time required to complete the task beforehand for better communication about deliverables to your fellow collaborators.",
                                  style: TextStyle(fontSize: 16, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)),

                              ),


                            ],

                          ),
                        ),
                      ],



                    ),




                    //TASK RIGHT SIDE
                    Column(
                      children: [

                        Container(
                          height: MediaQuery.of(context).size.height*0.6,
                          width: MediaQuery.of(context).size.width*0.3,
                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.05, 0, 0),
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor, width: 2.5),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          child:
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.08, MediaQuery.of(context).size.height*0.02, 0, 0),
                                      child: Text("WELCOME TO A NEW PROJECT", style: TextStyle(fontSize: 16, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                  ),
                                ],
                              ),


                              Container(
                                margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.02, 0, 0),
                                height: 2.5,
                                width: MediaQuery.of(context).size.width*0.25,
                                color: mainColor,
                              ),

                              Container(
                                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.02, 0, 0),
                                  child: Text("Please define your Tasks", style: TextStyle(fontSize: 14, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                              ),

                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.03, 0, 0),
                                      child: Text("Task 1: ", style: TextStyle(fontSize: 14, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                  ),

                                  Container(
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.03, 0, 0),
                                      child: Text("Gather data related to project", style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)
                                  ),

                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.02, 0, 0),
                                      child: Text("Task 2: ", style: TextStyle(fontSize: 14, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                  ),

                                  Container(
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.02, 0, 0),
                                      child: Text("Conducts research on which AI model is to be trained", style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)
                                  ),

                                ],
                              ),


                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.025, 0, 0),
                                    height: MediaQuery.of(context).size.height*0.29,
                                    width: MediaQuery.of(context).size.width*0.25,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: secondaryColor, width: 2.5),
                                      borderRadius: new BorderRadius.circular(10),
                                    ),
                                    child:
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.015, 0, 0),
                                                child: Text("Add another Task", style: TextStyle(fontSize: 14, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.01, 0, 0),
                                                child: Text("Task 3: Start Training", style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)
                                            ),
                                          ],
                                        ),


                                        Row(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.13, 0, 0),
                                                child: Text("Specify Time Required:", style: TextStyle(fontSize: 14, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height*0.04,
                                              width: MediaQuery.of(context).size.width*0.13,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.01, 0, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: secondaryColor, width: 2.5),
                                                borderRadius: new BorderRadius.circular(6),
                                              ),

                                              child:
                                              Row(
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.005, 0, 0, 0),
                                                      child: Text("0 Days", style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)
                                                  ),

                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.003, 0, 0, 0),
                                                    height: MediaQuery.of(context).size.height*0.025,
                                                    width: 2.5,
                                                    color: mainColor,
                                                  ),



                                                  Container(
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.005, 0, 0, 0),
                                                      child: Text("0 Hours", style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)
                                                  ),

                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.003, 0, 0, 0),
                                                    height: MediaQuery.of(context).size.height*0.025,
                                                    width: 2.5,
                                                    color: mainColor,
                                                  ),



                                                  Container(
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.005, 0, 0, 0),
                                                      child: Text("0 Minutes", style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)
                                                  ),



                                                ],

                                              ),

                                            ),

                                            Container(
                                                height: MediaQuery.of(context).size.height*0.04,
                                                width: MediaQuery.of(context).size.width*0.05,
                                                margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.01, 0, 0),
                                                decoration: BoxDecoration(
                                                  color: secondaryColor,
                                                  borderRadius: new BorderRadius.circular(6),
                                                ),
                                                child: Center(child: Text("Add Task", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w500),))

                                            )






                                          ],

                                        ),










                                      ],
                                    ),
                                  ),

                                ],
                              ),



                              Row(
                                children: [
                                  Container(
                                      height: MediaQuery.of(context).size.height*0.04,
                                      width: MediaQuery.of(context).size.width*0.06,
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.14, MediaQuery.of(context).size.height*0.02, 0, 0),
                                      decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius: new BorderRadius.circular(6),
                                      ),
                                      child: Center(child: Text("Cancel", style: TextStyle(fontSize: 14, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w500),))

                                  ),

                                  Container(
                                      height: MediaQuery.of(context).size.height*0.04,
                                      width: MediaQuery.of(context).size.width*0.06,
                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.02, 0, 0),
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: new BorderRadius.circular(6),
                                      ),
                                      child: Center(child: Text("Start", style: TextStyle(fontSize: 14, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w500),))

                                  )







                                ],


                              )









                            ],
                          ),
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

