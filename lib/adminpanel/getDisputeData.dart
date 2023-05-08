import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:procollab_web/adminpanel/approvepost.dart';
import 'package:procollab_web/postdetail/projectdetails.dart';

class GetDisputeData extends StatefulWidget {
  //const GetData({Key? key}) : super(key: key);
  final String documentId;

  GetDisputeData({required this.documentId});

  @override
  State<GetDisputeData> createState() =>
      _GetDisputeDataState(documentId: this.documentId);
}

class _GetDisputeDataState extends State<GetDisputeData> {
  final String documentId;
  //
  _GetDisputeDataState({required this.documentId});

  @override
  Widget build(BuildContext context) {
    var mainColor = const Color(0xFF1C5D8B);
    CollectionReference users =
        FirebaseFirestore.instance.collection("disputes");
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.175,
                    top: MediaQuery.of(context).size.height * 0.02),
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: mainColor,
                      width: 2.5,
                    )),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.12,
                        left: MediaQuery.of(context).size.height * 0.08,
                        child: Container(
                          child: Text(
                            "Quality of work",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: "DM Sans",
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                color: mainColor,
                                fontWeight: FontWeight.w300),
                          ),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.height * 0.08,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.003,
                          width: MediaQuery.of(context).size.width * 0.57,
                          color: mainColor,
                        )),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.035,
                      left: MediaQuery.of(context).size.height * 0.08,
                      child: Text(
                        "New Temp Project",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: "DM Sans",
                            fontSize:
                                MediaQuery.of(context).size.height * 0.035,
                            color: mainColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: MediaQuery.of(context).size.height * 0.08,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.575,
                          child: Text(
                            "The quality of work that was commited was not fullfilled",
                            style: TextStyle(
                                fontFamily: "DM Sans",
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          )),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.52,
                      left: MediaQuery.of(context).size.height * 0.8,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            onPressed: () async {
                            },
                            child: Text(
                              "Reject",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.52,
                      left: MediaQuery.of(context).size.height * 1.04,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              onPressed: () async {
                                                              },
                              child: Text(
                                "Approve",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.175,
                    top: MediaQuery.of(context).size.height * 0.02),
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: mainColor,
                      width: 2.5,
                    )),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.12,
                        left: MediaQuery.of(context).size.height * 0.08,
                        child: Container(
                          child: Text(
                            "Work committed is not done",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: "DM Sans",
                                fontSize:
                                MediaQuery.of(context).size.height * 0.03,
                                color: mainColor,
                                fontWeight: FontWeight.w300),
                          ),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.height * 0.08,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.003,
                          width: MediaQuery.of(context).size.width * 0.57,
                          color: mainColor,
                        )),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.035,
                      left: MediaQuery.of(context).size.height * 0.08,
                      child: Text(
                        "New Temp Project",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: "DM Sans",
                            fontSize:
                            MediaQuery.of(context).size.height * 0.035,
                            color: mainColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: MediaQuery.of(context).size.height * 0.08,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.575,
                          child: Text(
                            "Contributor didnt work at all",
                            style: TextStyle(
                                fontFamily: "DM Sans",
                                fontSize:
                                MediaQuery.of(context).size.height * 0.02,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          )),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.52,
                      left: MediaQuery.of(context).size.height * 0.8,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            onPressed: () async {
                            },
                            child: Text(
                              "Reject",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.52,
                      left: MediaQuery.of(context).size.height * 1.04,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              onPressed: () async {
                              },
                              child: Text(
                                "Approve",
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.height *
                                        0.025,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.175,
                    top: MediaQuery.of(context).size.height * 0.02),
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: mainColor,
                      width: 2.5,
                    )),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.12,
                        left: MediaQuery.of(context).size.height * 0.08,
                        child: Container(
                          child: Text(
                            "Work Submission Deadline",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: "DM Sans",
                                fontSize:
                                MediaQuery.of(context).size.height * 0.03,
                                color: mainColor,
                                fontWeight: FontWeight.w300),
                          ),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.height * 0.08,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.003,
                          width: MediaQuery.of(context).size.width * 0.57,
                          color: mainColor,
                        )),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.035,
                      left: MediaQuery.of(context).size.height * 0.08,
                      child: Text(
                        "Data Gathering",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: "DM Sans",
                            fontSize:
                            MediaQuery.of(context).size.height * 0.035,
                            color: mainColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: MediaQuery.of(context).size.height * 0.08,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.575,
                          child: Text(
                            "While missing a deadline can feel overwhelming, it happens even to the most experienced professionals. Whether you missed a deadline due to an emergency or other obligations, there are some steps you can take to explain yourself and ask for an extension. If you recently missed a deadline, then you might be wondering what you can do to remedy the situation. In this article, we discuss the benefits of addressing a missed deadline, provide instructions to help you explain the situation to your supervisor and provide tips to help you get your work back on track.",
                            style: TextStyle(
                                fontFamily: "DM Sans",
                                fontSize:
                                MediaQuery.of(context).size.height * 0.02,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          )),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.52,
                      left: MediaQuery.of(context).size.height * 0.8,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            onPressed: () async {
                            },
                            child: Text(
                              "Reject",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.52,
                      left: MediaQuery.of(context).size.height * 1.04,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              onPressed: () async {
                              },
                              child: Text(
                                "Approve",
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.height *
                                        0.025,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // child: FutureBuilder<DocumentSnapshot>(
        //     future: users.doc(documentId).get(),
        //     builder: ((context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         Map<String, dynamic> data =
        //         snapshot.data!.data() as Map<String, dynamic>;
        //           return Container(
        //             child: Row(
        //               children: [
        //                 Container(
        //                   margin: EdgeInsets.only(
        //                       left: MediaQuery.of(context).size.width * 0.175,
        //                       top: MediaQuery.of(context).size.height * 0.02),
        //                   width: MediaQuery.of(context).size.width * 0.65,
        //                   height: MediaQuery.of(context).size.height * 0.6,
        //                   decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(20),
        //                       border: Border.all(
        //                         color: mainColor,
        //                         width: 2.5,
        //                       )),
        //                   child: Stack(
        //                     children: <Widget>[
        //                       Positioned(
        //                           top: MediaQuery.of(context).size.height * 0.12,
        //                           left: MediaQuery.of(context).size.height * 0.17,
        //                           child: Container(
        //                             child: Text(
        //                               "${data['reason']}",
        //                               style: TextStyle(
        //                                   decoration: TextDecoration.none,
        //                                   fontFamily: "DM Sans",
        //                                   fontSize:
        //                                   MediaQuery.of(context).size.height *
        //                                       0.03,
        //                                   color: mainColor,
        //                                   fontWeight: FontWeight.w300),
        //                             ),
        //                           )),
        //                       Positioned(
        //                           top: MediaQuery.of(context).size.height * 0.1,
        //                           left: MediaQuery.of(context).size.height * 0.08,
        //                           child: Container(
        //                             height: MediaQuery.of(context).size.height *
        //                                 0.003,
        //                             width:
        //                             MediaQuery.of(context).size.width * 0.57,
        //                             color: mainColor,
        //                           )),
        //                       Positioned(
        //                         top: MediaQuery.of(context).size.height * 0.035,
        //                         left: MediaQuery.of(context).size.height * 0.08,
        //                         child: Text(
        //                           "${data['projectName']}",
        //                           style: TextStyle(
        //                               decoration: TextDecoration.none,
        //                               fontFamily: "DM Sans",
        //                               fontSize:
        //                               MediaQuery.of(context).size.height *
        //                                   0.035,
        //                               color: mainColor,
        //                               fontWeight: FontWeight.w600),
        //                         ),
        //                       ),
        //                       Positioned(
        //                         top: MediaQuery.of(context).size.height * 0.2,
        //                         left: MediaQuery.of(context).size.height * 0.08,
        //                         child: Container(
        //                             width:
        //                             MediaQuery.of(context).size.width * 0.575,
        //                             child: Text(
        //                               "${data['description']}",
        //                               style: TextStyle(
        //                                   fontFamily: "DM Sans",
        //                                   fontSize:
        //                                   MediaQuery.of(context).size.height *
        //                                       0.02,
        //                                   color: Colors.black,
        //                                   fontWeight: FontWeight.w300),
        //                             )),
        //                       ),
        //                       Positioned(
        //                         top: MediaQuery.of(context).size.height * 0.52,
        //                         left: MediaQuery.of(context).size.height * 0.8,
        //                         child: Container(
        //                           height:
        //                           MediaQuery.of(context).size.height * 0.05,
        //                           width: MediaQuery.of(context).size.width * 0.1,
        //                           decoration: BoxDecoration(
        //                             color: Colors.red,
        //                             borderRadius: BorderRadius.circular(17),
        //                           ),
        //                           child: InkWell(
        //                             onTap: () {
        //                               setState(() {});
        //                             },
        //                             child: MaterialButton(
        //                               minWidth: MediaQuery.of(context).size.width,
        //                               padding: const EdgeInsets.fromLTRB(
        //                                   20.0, 15.0, 20.0, 15.0),
        //                               onPressed: () async {
        //                                 // var response =
        //                                 // await FirebaseCrud.updatePostApproval(
        //                                 //   approval: "Rejected",
        //                                 //   docId: documentId,
        //                                 // );
        //                                 // if (response.code != 200) {
        //                                 //   showDialog(
        //                                 //       context: context,
        //                                 //       builder: (context) {
        //                                 //         return AlertDialog(
        //                                 //           content: Text(response.message
        //                                 //               .toString()),
        //                                 //         );
        //                                 //       });
        //                                 // } else {
        //                                 //   showDialog(
        //                                 //       context: context,
        //                                 //       builder: (context) {
        //                                 //         return AlertDialog(
        //                                 //           content: Text(response.message
        //                                 //               .toString()),
        //                                 //         );
        //                                 //       });
        //                                 // }
        //                               },
        //                               child: Text(
        //                                 "Reject",
        //                                 style: TextStyle(
        //                                     fontSize: MediaQuery.of(context)
        //                                         .size
        //                                         .height *
        //                                         0.025,
        //                                     color: Colors.white,
        //                                     fontWeight: FontWeight.w500),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                       Positioned(
        //                         top: MediaQuery.of(context).size.height * 0.52,
        //                         left: MediaQuery.of(context).size.height * 1.04,
        //                         child: Container(
        //                           height:
        //                           MediaQuery.of(context).size.height * 0.05,
        //                           width: MediaQuery.of(context).size.width * 0.1,
        //                           decoration: BoxDecoration(
        //                             color: mainColor,
        //                             borderRadius: BorderRadius.circular(17),
        //                           ),
        //                           child: Center(
        //                             child: InkWell(
        //                               onTap: () {
        //                                 setState(() {});
        //                               },
        //                               child: MaterialButton(
        //                                 minWidth:
        //                                 MediaQuery.of(context).size.width,
        //                                 padding: const EdgeInsets.fromLTRB(
        //                                     20.0, 15.0, 20.0, 15.0),
        //                                 onPressed: () async {
        //                                   // var response = await FirebaseCrud
        //                                   //     .updatePostApproval(
        //                                   //   approval: "Approved",
        //                                   //   docId: documentId,
        //                                   // );
        //                                   // if (response.code != 200) {
        //                                   //   showDialog(
        //                                   //       context: context,
        //                                   //       builder: (context) {
        //                                   //         return AlertDialog(
        //                                   //           content: Text(response.message
        //                                   //               .toString()),
        //                                   //         );
        //                                   //       });
        //                                   // } else {
        //                                   //   showDialog(
        //                                   //       context: context,
        //                                   //       builder: (context) {
        //                                   //         return AlertDialog(
        //                                   //           content: Text(response.message
        //                                   //               .toString()),
        //                                   //         );
        //                                   //       });
        //                                   // }
        //                                 },
        //                                 child: Text(
        //                                   "Approve",
        //                                   style: TextStyle(
        //                                       fontSize: MediaQuery.of(context)
        //                                           .size
        //                                           .height *
        //                                           0.025,
        //                                       color: Colors.white,
        //                                       fontWeight: FontWeight.w500),
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           );
        //
        //       }
        //       //return Text("Fetching Data from Database..");
        //       return const Text("");
        //     })),
      ),
    );
  }
}
