
import 'package:flutter/material.dart';
import 'package:procollab_web/CollaboratorHeaderFooter/headerpostsignin.dart';
import 'package:procollab_web/ProjectCRUD/ProjectCRUD/page/addpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import '../../../CollaboratorHeaderFooter/footer.dart';
import '../models/employee.dart';
import '../services/firebase_crud.dart';
import 'listpage.dart';

class EditProfilePage extends StatefulWidget {
  final Profile? profile;
  EditProfilePage({this.profile});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditProfilePage();
  }
}

class _EditProfilePage extends State<EditProfilePage> {
  final _name = TextEditingController();
  final _from = TextEditingController();
  final _linkedin = TextEditingController();
  final _field = TextEditingController();
  final _email = TextEditingController();
  final _ongoingprojects = TextEditingController();
  final _projectscompleted = TextEditingController();
  final _docid = TextEditingController();


  final user = FirebaseAuth.instance.currentUser;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _docid.value = TextEditingValue(text: widget.profile!.uid.toString());
    _name.value = TextEditingValue(text: widget.profile!.name.toString());
    _from.value = TextEditingValue(text: widget.profile!.from.toString());
    _linkedin.value = TextEditingValue(text: widget.profile!.linkedin.toString());
    _email.value = TextEditingValue(text: widget.profile!.email.toString());
    _field.value = TextEditingValue(text: widget.profile!.field.toString());
    _ongoingprojects.value = TextEditingValue(text: widget.profile!.ongoingprojects.toString());
    _projectscompleted.value = TextEditingValue(text: widget.profile!.projectscompleted.toString());

  }
  // var name;
  // var area;

  @override
  Widget build(BuildContext context) {
    // if(user!.email! == "arhamlatif54@gmail.com"){
    //   name = "Arham Latif";
    //   area = "Web Developer";
    // }
    // else if(user!.email! == "salihashahzad@gmail.com"){
    //   name = "Saliha Shahzad";
    //   area = "UI/UX Designer";
    // }
    // else if(user!.email! == "nooraizasghar@gmail.com"){
    //   name = "Nooraiz Asghar";
    //   area = "Front End Developer";
    // }

    final DocIDField = TextField(
        controller: _docid,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Document ID",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));


    final nameField = SizedBox(
      width: MediaQuery.of(context).size.width*0.25,
      child: TextFormField(
          controller: _name,
          autofocus: false,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
          },

          decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(80.0, 15.0, 20.0, 15.0),
              hintText: "Name", hintStyle: TextStyle(color: AddPage.secondaryColor,),
              enabledBorder:
              UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.5,
                    color: AddPage.secondaryColor,
                  )
                // borderRadius: BorderRadius.circular(32.0),
              ),


              focusedBorder:
              UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.5,
                    color: AddPage.mainColor,
                  )
                // borderRadius: BorderRadius.circular(32.0),
              )

          )


      ),
    );



    final numofcolls =  Text("Ongoing Projects:",style: TextStyle(fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.0225, color: AddPage.mainColor),);

    final collaboratorsNeededField = SizedBox(
      width: MediaQuery.of(context).size.width*0.05,
      child: TextFormField(
          controller: _ongoingprojects,
          autofocus: false,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
          },
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(35.0, 15.0, 20.0, 15.0),
              hintText: "0", hintStyle: TextStyle(color: AddPage.secondaryColor,),
              enabledBorder:
              OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.5,
                    color: AddPage.secondaryColor,
                  )
                // borderRadius: BorderRadius.circular(32.0),
              ),


              focusedBorder:
              OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.5,
                    color: AddPage.mainColor,
                  )
                // borderRadius: BorderRadius.circular(32.0),
              )

          )
      ),
    );

    final OfferedAmount =  Text("Projects Completed:",style: TextStyle(fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height*0.0225, color: AddPage.mainColor),);

    final amountDueField = SizedBox(
      width: MediaQuery.of(context).size.width*0.05,
      child: TextFormField(
          controller: _projectscompleted,
          autofocus: false,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
          },
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "0", hintStyle: TextStyle(color: AddPage.secondaryColor,),
              enabledBorder:
              OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.5,
                    color: AddPage.secondaryColor,
                  )
                // borderRadius: BorderRadius.circular(32.0),
              ),


              focusedBorder:
              OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.5,
                    color: AddPage.mainColor,
                  )
                // borderRadius: BorderRadius.circular(32.0),
              )

          )
      ),
    );






    // final amountEarnedField = TextFormField(
    //     controller: _AmountEarned,
    //     autofocus: false,
    //     validator: (value) {
    //       if (value == null || value.trim().isEmpty) {
    //         return 'This field is required';
    //       }
    //     },
    //     decoration: InputDecoration(
    //         contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //         hintText: "Amount Earned",
    //         border:
    //         OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)
    //         )
    //     )
    // );





    final fieldField = TextFormField(
      controller: _field,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          //contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Field", hintStyle: TextStyle(color: AddPage.secondaryColor,),
          enabledBorder:
          OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.5,
                color: AddPage.secondaryColor,
              )

            // borderRadius: BorderRadius.circular(32.0),
          ),


          focusedBorder:
          OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.5,
                color: AddPage.mainColor,
              )
            // borderRadius: BorderRadius.circular(32.0),
          )

      ),

      style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025),
    );

    final emailField = TextFormField(
      controller: _email,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          //contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email", hintStyle: TextStyle(color: AddPage.secondaryColor,),
          enabledBorder:
          OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.5,
                color: AddPage.secondaryColor,
              )

            // borderRadius: BorderRadius.circular(32.0),
          ),


          focusedBorder:
          OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.5,
                color: AddPage.mainColor,
              )
            // borderRadius: BorderRadius.circular(32.0),
          )

      ),

      style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025),
    );






    // final paihayField = TextFormField(
    //     controller: _paihay,
    //     autofocus: false,
    //     validator: (value) {
    //       if (value == null || value.trim().isEmpty) {
    //         return 'This field is required';
    //       }
    //     },
    //     decoration: InputDecoration(
    //         contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //         hintText: "Offered Amount",
    //         border:
    //         OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));







    final fromField = TextFormField(
      controller: _from,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          //contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "From", hintStyle: TextStyle(color: AddPage.secondaryColor,),
          enabledBorder:
          OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.5,
                color: AddPage.secondaryColor,
              )

            // borderRadius: BorderRadius.circular(32.0),
          ),



          focusedBorder:
          OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.5,
                color: AddPage.mainColor,
              )
            // borderRadius: BorderRadius.circular(32.0),
          )

      ),

      style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025),

    );

    final linkedinField = TextFormField(
      controller: _linkedin,
      autofocus: false,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          //contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Linkedin", hintStyle: TextStyle(color: AddPage.secondaryColor,),
          enabledBorder:
          OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.5,
                color: AddPage.secondaryColor,
              )

            // borderRadius: BorderRadius.circular(32.0),
          ),



          focusedBorder:
          OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.5,
                color: AddPage.mainColor,
              )
            // borderRadius: BorderRadius.circular(32.0),
          )

      ),

      style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025),
    );

    // final requirementsField = TextFormField(
    //   controller: _requirements,
    //   autofocus: false,
    //   validator: (value) {
    //     if (value == null || value.trim().isEmpty) {
    //       return 'This field is required';
    //     }
    //   },
    //   decoration: const InputDecoration(
    //       contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
    //       //contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //       hintText: "Requirements:", hintStyle: TextStyle(color: AddPage.secondaryColor,),
    //       enabledBorder:
    //       OutlineInputBorder(
    //           borderSide: BorderSide(
    //             width: 2.5,
    //             color: AddPage.secondaryColor,
    //           )
    //
    //         // borderRadius: BorderRadius.circular(32.0),
    //       ),
    //
    //
    //
    //       focusedBorder:
    //       OutlineInputBorder(
    //           borderSide: BorderSide(
    //             width: 2.5,
    //             color: AddPage.mainColor,
    //           )
    //         // borderRadius: BorderRadius.circular(32.0),
    //       )
    //
    //   ),
    //
    //   style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025),
    // );

    // final SaveButton = Material(
    //   elevation: 5.0,
    //   borderRadius: BorderRadius.circular(30.0),
    //   color: Theme.of(context).primaryColor,
    //   child: MaterialButton(
    //     minWidth: MediaQuery.of(context).size.width,
    //     padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //     onPressed: () async {
    //       if (_formKey.currentState!.validate()) {
    //         var response = await FirebaseCrud.updatePost(
    //             docId: _docid.text,
    //             projectname: _projectname.text,
    //             collaboratorsneeded: _collaboratorsneeded.text,
    //             area: _area.text,
    //             email: _email.text,
    //             AmountDue: _AmountDue.text,
    //             AmountEarned: _AmountEarned.text,
    //             experience: _experience.text,
    //             paihay: _AmountDue.text,
    //             projectdescription: _projectdescription.text,
    //             requirements: _requirements.text,
    //             responsibilities: _responsibilites.text,
    //             name: _name.text
    //         );
    //         if (response.code != 200) {
    //           showDialog(
    //               context: context,
    //               builder: (context) {
    //                 return AlertDialog(
    //                   content: Text(response.message.toString()),
    //                 );
    //               });
    //         } else {
    //           showDialog(
    //               context: context,
    //               builder: (context) {
    //                 return AlertDialog(
    //                   content: Text(response.message.toString()),
    //                 );
    //               });
    //         }
    //       }
    //     },
    //     child: Text(
    //       "Update",
    //       style: TextStyle(color: Theme.of(context).primaryColorLight),
    //       //textAlign: TextAlign.center,
    //     ),
    //   ),
    // );

    final SaveButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: AddPage.mainColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width*0.1,

        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.updateProfile(
                docId: _docid.text,
                name: _name.text,
                ongoingprojects: _ongoingprojects.text,
                field: _field.text,
                email: _email.text,
                projectscompleted: _projectscompleted.text,
                from: _from.text,
                linkedin: _linkedin.text,
            );
            if (response.code != 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            }
          }
        },
        child: const Text(
          "Update Profile",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,


                  children: [

                    headerpostsu(),

                    Container(
                      width: MediaQuery.of(context).size.width*0.6,
                      child: Column(
                        children: [

                          const SizedBox(height: 30),


                          Row(
                            children: <Widget>[
                              nameField,
                              SizedBox(width: MediaQuery.of(context).size.width*0.10,),
                              numofcolls,
                              const SizedBox(width: 10,),
                              collaboratorsNeededField,
                            ],
                          ),

                          const SizedBox(height: 20,),

                          Row(
                            children: <Widget>[
                              SizedBox(width: MediaQuery.of(context).size.width*0.415,),
                              OfferedAmount,
                              const SizedBox(width: 10,),
                              amountDueField,
                            ],
                          ),

                          const SizedBox(height: 50,),


                          Column(
                            children: <Widget>[
                              emailField,
                              const SizedBox(height: 10,),
                              fieldField,
                              const SizedBox(height: 10,),
                              fromField,
                              const SizedBox(height: 10,),
                              linkedinField,
                              const SizedBox(height: 10,),
                              // experienceField,
                              //DocIDField,
                            ],
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                          Row(
                            children: <Widget>[
                              SizedBox(width: MediaQuery.of(context).size.width*0.27,),
                              const SizedBox(width: 10,),
                              SaveButton,
                            ],
                          ),
                        ],

                      )

                    ),



                    Collfooter(),



                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   }
// }
