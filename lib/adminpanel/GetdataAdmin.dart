import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:procollab_web/adminpanel/approvepost.dart';
import 'package:procollab_web/postdetail/projectdetails.dart';

class GetAdminData extends StatefulWidget {
  //const GetData({Key? key}) : super(key: key);
  final String documentId;

  GetAdminData({required this.documentId});

  @override
  State<GetAdminData> createState() =>
      _GetAdminDataState(documentId: this.documentId);
}

class _GetAdminDataState extends State<GetAdminData> {
  final String documentId;
  //
  _GetAdminDataState({required this.documentId});

  @override
  Widget build(BuildContext context) {
    var mainColor = const Color(0xFF1C5D8B);
    var secondaryColor = const Color(0xFF3F83B4);
    var sec2Color = const Color(0xFFD8EAFF);
    var sec3Color = const Color(0xFF5381B8);
    CollectionReference users = FirebaseFirestore.instance.collection("posts");
    return SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
            future: users.doc(documentId).get(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                if("${data['approval']}" == "Pending"){
                  return Container(
                    child: Row(
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
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: const AssetImage(
                                          "happy-bearded-young-man.jpg"),
                                      radius: MediaQuery.of(context).size.height *
                                          0.03,
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: MediaQuery.of(context).size.height * 0.12,
                                  left: MediaQuery.of(context).size.height * 0.17,
                                  child: Container(
                                    child: Text(
                                      "${data['name']}",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "DM Sans",
                                          fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                          color: mainColor,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height * 0.16,
                                  left: MediaQuery.of(context).size.height * 0.17,
                                  child: Container(
                                    child: Text(
                                      "${data['area']}",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "DM Sans",
                                          fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                          color: mainColor,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height * 0.035,
                                  left: MediaQuery.of(context).size.height * 1.15,
                                  child: Container(
                                    child: Text(
                                      "\$${data['paihay']}",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: "DM Sans",
                                          fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.035,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  )),
                              Positioned(
                                  top: MediaQuery.of(context).size.height * 0.1,
                                  left: MediaQuery.of(context).size.height * 0.08,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.003,
                                    width:
                                    MediaQuery.of(context).size.width * 0.57,
                                    color: mainColor,
                                  )),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.035,
                                left: MediaQuery.of(context).size.height * 0.08,
                                child: Text(
                                  "${data['projectname']}",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: "DM Sans",
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.035,
                                      color: mainColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.2,
                                left: MediaQuery.of(context).size.height * 0.08,
                                child: Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.575,
                                    child: Text(
                                      "${data['projectdescription']}",
                                      style: TextStyle(
                                          fontFamily: "DM Sans",
                                          fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300),
                                    )),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.53,
                                left: MediaQuery.of(context).size.height * 0.08,
                                child: Text(
                                  "${data['collaboratorsneeded']} Collaborators Required",
                                  style: TextStyle(
                                      fontFamily: "DM Sans",
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.025,
                                      color: mainColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.52,
                                left: MediaQuery.of(context).size.height * 0.8,
                                child: Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.05,
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
                                        var response =
                                        await FirebaseCrud.updatePostApproval(
                                          approval: "Rejected",
                                          docId: documentId,
                                        );
                                        if (response.code != 200) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: Text(response.message
                                                      .toString()),
                                                );
                                              });
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: Text(response.message
                                                      .toString()),
                                                );
                                              });
                                        }
                                      },
                                      child: Text(
                                        "Reject",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                .size
                                                .height *
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
                                  height:
                                  MediaQuery.of(context).size.height * 0.05,
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
                                        minWidth:
                                        MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.fromLTRB(
                                            20.0, 15.0, 20.0, 15.0),
                                        onPressed: () async {
                                          var response = await FirebaseCrud
                                              .updatePostApproval(
                                            approval: "Approved",
                                            docId: documentId,
                                          );
                                          if (response.code != 200) {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Text(response.message
                                                        .toString()),
                                                  );
                                                });
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Text(response.message
                                                        .toString()),
                                                  );
                                                });
                                          }
                                        },
                                        child: Text(
                                          "Approve",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
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
                  );
                }

              }
              //return Text("Fetching Data from Database..");
              return const Text("");
            })),
      ),
    );
  }
}
