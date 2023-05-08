import 'package:flutter/material.dart';

class EarningsSt extends StatefulWidget {
  const EarningsSt({Key? key}) : super(key: key);

  @override
  State<EarningsSt> createState() => _EarnningsStState();
}

class _EarnningsStState extends State<EarningsSt> {

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

                  // EARNING DETAILS ON LEFT SIDE (TEXT SIDE)
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

                              child: Center(child: Text("EARNINGS", style: TextStyle(fontSize: 20, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),)),

                            ),

                            Container(
                              width: MediaQuery.of(context).size.width*0.28,
                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.17, MediaQuery.of(context).size.height*0.05, 0, 0),
                              child: Center(child: Text(
                                "See money you have earned working on paid projects."
                                    "\n\n\nProject status is displayed to show if a project has been completed so amount due and amount earned are presented."
                                    "\n\n\nEnter task title and description/details."
                                    "\n\n\nYou can withdraw the amount you earned by working on a paid project by bank transfer.",
                                style: TextStyle(fontSize: 16, fontFamily: fontFam, color: Colors.black, fontWeight: FontWeight.w400),)),

                            ),


                          ],

                        ),
                      ),
                    ],



                  ),




                  //EARNINGS RIGHT SIDE
                  Column(
                    children: [

                      //WORKBOOK PROJECT HEADING
                      Container(
                        height: MediaQuery.of(context).size.height*0.5,
                        width: MediaQuery.of(context).size.width*0.30,
                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, MediaQuery.of(context).size.height*0.05, 0, 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor, width: 2.5),
                          borderRadius: new BorderRadius.circular(10),
                        ),

                        child: Column(
                          children: [

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


                            //AMOUNT EARNED HEADING
                            Row(
                              children: [

                                Container(
                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.108, MediaQuery.of(context).size.width*0.015, 0, 0),
                                    child: Text("AMOUNT EARNED", style: TextStyle(fontSize: 16, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                ),
                              ],
                            ),


                            //AMOUNT BOXES
                            Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.1,
                                  width: MediaQuery.of(context).size.width*0.25,
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.025, MediaQuery.of(context).size.height*0.025, 0, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: mainColor, width: 2.5),
                                    borderRadius: new BorderRadius.circular(10),
                                  ),

                                  child:
                                  Row(

                                    children: [

                                      //PROJECT STATUS -> In Progress
                                      Column(
                                        children: [

                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.015, MediaQuery.of(context).size.height*0.02, 0, 0),
                                              child: Text("Project Status", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                          ),

                                          Container(
                                            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.01, 0, 0),
                                              child: Text("In Progress", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: Colors.green, fontWeight: FontWeight.w600),)
                                          ),

                                        ],
                                      ),

                                      //DIVIDER
                                      Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.0175, 0, 0, 0),
                                        height: MediaQuery.of(context).size.height*0.1,
                                        width: MediaQuery.of(context).size.width*0.0015,
                                        color: mainColor,

                                      ),


                                      //AMOUNT EARNED -> $0
                                      Column(
                                        children: [

                                          Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.015, MediaQuery.of(context).size.height*0.02, 0, 0),
                                              child: Text("Amount Earned", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                          ),

                                          Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.01, 0, 0),
                                              child: Text("\$0", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: Colors.green, fontWeight: FontWeight.w600),)
                                          ),

                                        ],
                                      ),

                                      //DIVIDER
                                      Container(
                                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.0175, 0, 0, 0),
                                        height: MediaQuery.of(context).size.height*0.1,
                                        width: MediaQuery.of(context).size.width*0.0015,
                                        color: mainColor,

                                      ),


                                      //AMOUNT DUE -> $100
                                      Column(
                                        children: [

                                          Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.015, MediaQuery.of(context).size.height*0.02, 0, 0),
                                              child: Text("Amount Due", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                          ),

                                          Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02, MediaQuery.of(context).size.height*0.01, 0, 0),
                                              child: Text("\$100", style: TextStyle(fontSize: 12, fontFamily: fontFam, color: Colors.green, fontWeight: FontWeight.w600),)
                                          ),

                                        ],
                                      ),
                                      
                                      
                                    ],


                                  ),


                                )
                              ],
                            ),


                            //WITHDRAWAL HEADING
                            Row(
                              children: [

                                Container(
                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.115, MediaQuery.of(context).size.width*0.015, 0, 0),
                                    child: Text("WITHDRAWAL", style: TextStyle(fontSize: 16, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w600),)
                                ),
                              ],
                            ),


                            //BANK TRANSFER BUTTON
                            Row(
                              children: [

                                Container(
                                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.0725, MediaQuery.of(context).size.width*0.01, 0, 0),
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: MediaQuery.of(context).size.width*0.15,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    // border: Border.all(color: mainColor, width: 2.5),
                                    borderRadius: new BorderRadius.circular(10),
                                  ),

                                    child: Center(child: Text("BANK TRANSFER", style: TextStyle(fontSize: 14, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),))

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
            ],



          ),

        ),
      ),
    );
  }
}

