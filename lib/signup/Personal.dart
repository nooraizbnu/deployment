import 'package:flutter/material.dart';
import 'package:procollab_web/headerfooter/headerpresignup.dart';

import '../headerfooter/footer.dart';
import '../usersCRUD/services/firebase_crud.dart';
import 'details.dart';
import 'security.dart';

class Personal extends StatefulWidget {
  TextEditingController userName;
  TextEditingController emailController;


  // SPCreateTasks({required this.documentId});
  Personal({Key? key,required this.userName,required this.emailController}) : super(key: key);

  @override
  State<Personal> createState() => _PersonalState(userName: this.userName, emailController: this.emailController);
}


class _PersonalState extends State<Personal> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _dob = TextEditingController();
  final _gender = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();

  TextEditingController userName;
  TextEditingController emailController;

  _PersonalState({required this.userName, required this.emailController});

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(userName.text);
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
                                            borderRadius: BorderRadius.circular(50),

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
                                            borderRadius: BorderRadius.circular(50),

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
                                            color: mainColor,
                                            // border: Border.all(color: mainColor, width: 2.5),
                                            borderRadius: BorderRadius.circular(50),

                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.person,
                                                  color: Colors.white),
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
                                            borderRadius: BorderRadius.circular(50),

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
                                            color: Colors.white,
                                            // border: Border.all(color: mainColor, width: 2.5),
                                            borderRadius: BorderRadius.circular(50),

                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.done_outlined,
                                                  color: mainColor),
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
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.08, MediaQuery.of(context).size.width*0.04, 0, 0),
                                              height: 50.0,
                                              width: 50.0,

                                              decoration: BoxDecoration(
                                                color: mainColor,
                                                // border: Border.all(color: mainColor, width: 2.5),
                                                borderRadius: BorderRadius.circular(50),

                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Icon(Icons.lock,
                                                      color: Colors.white),
                                                ],

                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.01, MediaQuery.of(context).size.height*0.09, 0, 0),
                                              child: const Text("Personal Information",style: TextStyle(fontSize:35,color: mainColor,fontWeight: FontWeight.normal,fontFamily: fontFam)),

                                            ),
                                          ],
                                        ),

                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.02, 0, 0),
                                          child: const Text("Please fill in the fields below with your data.",style: TextStyle(fontSize:15,color:Colors.black45,fontWeight: FontWeight.normal,fontFamily: fontFam)),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height*0.05, MediaQuery.of(context).size.height*0.08, 0, 0),
                                              //alignment: Alignment.center,
                                              height: MediaQuery.of(context).size.height*0.45,
                                              width: MediaQuery.of(context).size.width*0.35,
                                              child: Form(
                                                key: _formKey,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(child: TextFormField(
                                                          controller: _firstName,
                                                          decoration:  const InputDecoration(
                                                              hintText: 'Enter your first name',
                                                              labelText: 'First name',
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
                                                              return 'Please enter your first name';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                        ),

                                                        Container(
                                                          color: const Color(0xFFF7F8FB),
                                                          height: MediaQuery.of(context).size.height*0.04,
                                                          width:MediaQuery.of(context).size.width*0.02,
                                                        ),
                                                        Expanded(
                                                          child:
                                                          TextFormField(
                                                            controller: _lastName,
                                                            decoration:  const InputDecoration(

                                                              //icon: Icon(Icons.person, color: secondaryColor,),
                                                                hintText: 'Enter your last name',
                                                                labelText: 'Last name',
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
                                                                return 'Please enter your last name';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(child: TextFormField(
                                                            controller: _dob,
                                                            decoration:  const InputDecoration(

                                                              //icon: Icon(Icons.person, color: secondaryColor,),
                                                                hintText: 'Enter  date of birth',
                                                                labelText: 'DOB',
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
                                                              if (value == null) {
                                                                return 'Please enter your date of birth';
                                                              }
                                                              final dateOfBirth = DateTime.tryParse(value);
                                                              if (dateOfBirth == null) {
                                                                return 'Please enter a valid date of birth (dd-mm-yyyy)';
                                                              }
                                                              final age = DateTime.now().difference(dateOfBirth).inDays ~/ 365;
                                                              if (age < 18) {
                                                                return 'You must be at least 18 years old to sign up';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                          ),

                                                          Container(
                                                            color: const Color(0xFFF7F8FB),
                                                            height: MediaQuery.of(context).size.height*0.04,
                                                            width:MediaQuery.of(context).size.width*0.02,
                                                          ),
                                                          Expanded(
                                                            child:
                                                            TextFormField(
                                                              controller: _gender,
                                                              decoration:  const InputDecoration(

                                                                //icon: Icon(Icons.person, color: secondaryColor,),
                                                                  hintText: 'Gender',
                                                                  labelText: 'Gender',
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
                                                                  return 'Please enter your gender';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),


                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(child: TextFormField(
                                                            controller: _city,
                                                            decoration:  const InputDecoration(

                                                              //icon: Icon(Icons.person, color: secondaryColor,),
                                                                hintText: 'Enter City',
                                                                labelText: 'City',
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
                                                                return 'Please enter your city';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                          ),

                                                          Container(
                                                            color: const Color(0xFFF7F8FB),
                                                            height: MediaQuery.of(context).size.height*0.04,
                                                            width:MediaQuery.of(context).size.width*0.02,
                                                          ),
                                                          Expanded(
                                                            child:
                                                            TextFormField(
                                                              controller: _state,
                                                              decoration:  const InputDecoration(

                                                                //icon: Icon(Icons.person, color: secondaryColor,),
                                                                  hintText: 'Enter State',
                                                                  labelText: 'State',
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
                                                                  return 'Please enter your state';
                                                                }
                                                                return null;
                                                              },
                                                            ),
                                                          ),


                                                        ],
                                                      ),
                                                    ),



                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.05, 0, 0),
                                                          height: MediaQuery.of(context).size.height*0.035,
                                                          width: MediaQuery.of(context).size.width*0.05,
                                                          decoration: BoxDecoration(
                                                            color: mainColor,
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: (){
                                                                if (_formKey.currentState!.validate()) {
                                                                  Navigator
                                                                      .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (
                                                                              context) =>
                                                                              details(
                                                                                userName: userName,
                                                                                emailController: emailController,
                                                                                firstName: _firstName,
                                                                                lastName: _lastName,
                                                                                dob: _dob,
                                                                                gender: _gender,
                                                                                city: _city,
                                                                                state: _state,)));
                                                                  setState(() {

                                                                  });
                                                                }
                                                              },
                                                              child: const Text(
                                                                "Next",
                                                                style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                                              ),

                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Row(
                                                    //   children: [
                                                    //     Container(
                                                    //       margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.height*0.09, 0, 0),
                                                    //       height: MediaQuery.of(context).size.height*0.035,
                                                    //       width: MediaQuery.of(context).size.width*0.05,
                                                    //       decoration: BoxDecoration(
                                                    //         color: mainColor,
                                                    //         borderRadius: BorderRadius.circular(10),
                                                    //       ),
                                                    //       child: Center(
                                                    //         child: InkWell(
                                                    //           onTap: (){
                                                    //
                                                    //             setState(() {
                                                    //
                                                    //             });
                                                    //           },
                                                    //           child: MaterialButton(
                                                    //             minWidth: MediaQuery.of(context).size.width,
                                                    //             padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                                    //             onPressed: () async {
                                                    //               if (_formKey.currentState!.validate()) {
                                                    //
                                                    //                 var response = await FirebaseCrud.addUser(
                                                    //                   email: emailController.text,
                                                    //                   username: userName.text,
                                                    //                   firstName: _firstName.text,
                                                    //                   lastName: _lastName.text,
                                                    //                   dob: _dob.text,
                                                    //                   gender: _gender.text,
                                                    //                   city: _city.text,
                                                    //                   state: _state.text,
                                                    //                 );
                                                    //                 if (response.code != 200) {
                                                    //                   showDialog(
                                                    //                       context: context,
                                                    //                       builder: (context) {
                                                    //                         return AlertDialog(
                                                    //                           content: Text(response.message.toString()),
                                                    //                         );
                                                    //                       });
                                                    //                 } else {
                                                    //                   showDialog(
                                                    //                       context: context,
                                                    //                       builder: (context) {
                                                    //                         return AlertDialog(
                                                    //                           content: Text(response.message.toString()),
                                                    //                         );
                                                    //                       });
                                                    //                 }
                                                    //               }
                                                    //             },
                                                    //             child: const Text(
                                                    //               "Save",
                                                    //               style: TextStyle(fontSize: 13, fontFamily: fontFam, color: Colors.white, fontWeight: FontWeight.w400),
                                                    //             ),
                                                    //           ),
                                                    //
                                                    //
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //     Container(
                                                    //       margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.21, MediaQuery.of(context).size.height*0.09, 0, 0),
                                                    //       height: MediaQuery.of(context).size.height*0.035,
                                                    //       width: MediaQuery.of(context).size.width*0.04,
                                                    //       decoration: BoxDecoration(
                                                    //         color: const Color(0xFFF7F8FB),
                                                    //         borderRadius: BorderRadius.circular(10),
                                                    //         border:  Border.all(width: 1, color: mainColor),
                                                    //       ),
                                                    //       child: Center(
                                                    //         child: InkWell(
                                                    //           onTap: (){
                                                    //             Navigator.push(context, MaterialPageRoute(builder: (context)=> details(emailController: emailController)));
                                                    //             setState(() {
                                                    //
                                                    //             });
                                                    //           },
                                                    //           child: const Text(
                                                    //             "Next",
                                                    //             style: TextStyle(fontSize: 13, fontFamily: fontFam, color: mainColor, fontWeight: FontWeight.w400),
                                                    //           ),
                                                    //
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // ),
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

