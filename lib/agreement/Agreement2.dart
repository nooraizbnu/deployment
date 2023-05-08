import 'package:flutter/material.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpostsignin.dart';
import 'package:procollab_web/tasks/taskshome.dart';

class Agreement2 extends StatefulWidget {
  final String documentId;

  Agreement2({required this.documentId});


  @override
  State<Agreement2> createState() => _Agreement2State(documentId: documentId);
}

class _Agreement2State extends State<Agreement2> {
  final String documentId;

  _Agreement2State({required this.documentId});

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context){
            return Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(child:
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            //const headerpostsu(),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 75),
                                  height: MediaQuery.of(context).size.height*0.13,
                                  width: MediaQuery.of(context).size.width*0.65,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(child: Text("TERMS & CONDITIONS",style: TextStyle(fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.06, color: Colors.white),)),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 50),
                                          padding: const EdgeInsets.only(bottom: 50),
                                          //height: MediaQuery.of(context).size.height*1.5,
                                          width: MediaQuery.of(context).size.width*0.65,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                color: secondaryColor,
                                                width: 5,
                                              )
                                          ),
                                         child:  Column(
                                            children: [
                                              Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.4, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                      child: const Text("Collaboration Agreement",style: TextStyle(fontSize:35,color: mainColor,fontWeight: FontWeight.bold,fontFamily: fontFam)),

                                                    ),
                                                  ],

                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height*0.025,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    //alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.2, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text("I agree to collaborate with other members in order to create the selected project.",style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.5, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text("COMPLETION DATE:  ",style: TextStyle(fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],

                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    //alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text("It is contemplated that the work will be completed no later than the mentioned completion date.\n"
                                                        "Collaborators must complete contributions by the dates included in the attached schedule or outline.\n If a Collaborator fails to do so, the Collaborators will mutually agree, in writing, whether to extend time \n for the project or take action against the collaborator.",style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.4, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text("LEAVING THE COLLABORATION: ",style: TextStyle(fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],

                                              ),

                                              Row(
                                                children: [
                                                  Container(
                                                    //alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text(" If a Collaborator is unwilling to continue or complete work on the work, the Collaborators shall enter \n  into a written agreement setting forth the rights of the withdrawing Collaborator, including  what \n  authorship credit, compensation and copyright ownership, if any, shall be shared with the withdrawing\n collaborator. The remaining Collaborator shall have the right to complete the work alone or with others.",style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.45, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text("COPYRIGHT OWNERSHIP:  ",style: TextStyle(fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],

                                              ),

                                              Row(
                                                children: [
                                                  Container(
                                                    //alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text(" Collaborators intend that the completed work shall be a joint work.\n Upon completion all the Collaborators shall be the owners of the all the work done.",style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.52, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text("DECISION MAKING:  ",style: TextStyle(fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],

                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    //alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text(" All editorial, business and other decisions affecting the work shall be made jointly by all the\nCollaborators, and no sale, disposition, licensing or other agreement with a third party shall be valid \nwithout the written consent of all the Collaborators.",style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.52, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text("PLATFORM RULES:  ",style: TextStyle(fontSize:25,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],

                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    //alignment: Alignment.center,
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.07, MediaQuery.of(context).size.height*0.03, 0, 0),
                                                    child: const Text(" You may not promote violence against or directly attack or threaten other people on the basis of race,\nethnicity, national origin, caste, sexual orientation, gender, gender identity, religious affiliation, age, \ndisability, or serious disease. We also do not allow accounts whose primary purpose is inciting harm \ntowards others on the basis of these categories.",style: TextStyle(fontSize:20,color: Colors.black,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                                  ),
                                                ],
                                              ),
                                               SizedBox(
                                            height: MediaQuery.of(context).size.height*0.05,
                                           ),

                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.45, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                    height: MediaQuery.of(context).size.height*0.04,
                                                    width: MediaQuery.of(context).size.width*0.05,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFF7F8FB),
                                                      borderRadius: BorderRadius.circular(10),
                                                      border:  Border.all(width: 1, color: mainColor),
                                                    ),
                                                    child: Center(
                                                      child: InkWell(
                                                        onTap: (){
                                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                                                          setState(() {

                                                          });
                                                        },
                                                        child: const Text(
                                                          "Decline",
                                                          style: TextStyle(fontSize: 13, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w400),
                                                        ),

                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                    height: MediaQuery.of(context).size.height*0.04,
                                                    width: MediaQuery.of(context).size.width*0.05,
                                                    decoration: BoxDecoration(
                                                      color: mainColor,
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Center(
                                                      child: InkWell(
                                                        onTap: (){
                                                          //sign_up();
                                                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskHome(documentId: documentId)));
                                                          setState(() {

                                                          });
                                                        },
                                                        child: const Text(
                                                          "Accept",
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





                                  ],
                                ),
                              ],
                            ),

                           // footer(),

                          ],
                        )
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
