import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:html';
import 'dart:js';
import 'dart:convert';

import '../CRUD/services/firebase_crud.dart';
import 'checkout/stripe_checkout.dart';

class GetPayableData extends StatefulWidget {
  //const GetData({Key? key}) : super(key: key);
  final String documentId;

  GetPayableData({required this.documentId});

  @override
  State<GetPayableData> createState() =>
      _GetPayableDataState(documentId: this.documentId);
}

class _GetPayableDataState extends State<GetPayableData> {
  final String documentId;
  //
  _GetPayableDataState({required this.documentId});

  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFF1C5D8B);
    const secondaryColor = Color(0xFF3F83B4);
    const fontFam = "DM Sans";
    final _formKey = GlobalKey<FormState>();
    String _name = '';
    int _age = 0;
    final _descriptionController = TextEditingController();
    final _accountNumberController = TextEditingController();
    final _reasonController = TextEditingController();

    CollectionReference users = FirebaseFirestore.instance.collection("posts");

    return SafeArea(
      child: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
            future: users.doc(documentId).get(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                if ("${data['approval']}" != "Pending") {
                  var collaboratorsLength = data["Collaborators"].length;
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 50),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.48,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: secondaryColor,
                                                width: 5,
                                              )),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.1,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.03,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                " ${data['projectname']}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        30,
                                                                    color:
                                                                        mainColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                        0,
                                                        0),
                                                    child: const CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                          'happy-bearded-young-man.jpg'),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.01,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.03,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                "${data['Collaborators'][0]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        mainColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.35,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.03,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                " ${data['AmountDue']}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .green,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                  InkWell(
                                                    onTap: data["paymentStatus"][0] == "Done" ? null : () async {
                                                      setState(() {

                                                      });
                                                      await FirebaseCrud.updatePaymentStatus(
                                                        docId: documentId,
                                                        updateIndex: 0,
                                                      );
                                                      // redirectToCheckout(context);
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.035,
                                                          0,
                                                          0),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      decoration: BoxDecoration(
                                                        color: data["paymentStatus"][0] == "Done" ? secondaryColor : mainColor,
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                              "Pay Contributor",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      fontFam))),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: data["paymentStatus"][0] != "Done" ? null : () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Request refund'),
                                                            content: Form(
                                                              key: _formKey,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  TextFormField(
                                                                    controller:
                                                                        _reasonController,
                                                                    decoration: const InputDecoration(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .person,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                        hintText: 'Enter your reason for refund',
                                                                        labelText: 'Reason',
                                                                        labelStyle: TextStyle(color: secondaryColor),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: secondaryColor),
                                                                          // borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: mainColor),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          // borderRadius: BorderRadius.circular(0),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        )),
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'Please enter the reason';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.025,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        _descriptionController,
                                                                    decoration: const InputDecoration(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .description,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                        hintText: 'Detailed description of what happened',
                                                                        labelText: 'Description',
                                                                        labelStyle: TextStyle(color: secondaryColor),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: secondaryColor),
                                                                          // borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: mainColor),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          // borderRadius: BorderRadius.circular(0),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        )),
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'Please enter your Description';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                        .size
                                                                        .height *
                                                                        0.025,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                    _accountNumberController,
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter.digitsOnly,
                                                                      CreditCardNumberFormater(),
                                                                      LengthLimitingTextInputFormatter(19)
                                                                    ],
                                                                    decoration: const InputDecoration(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .description,
                                                                          color:
                                                                          secondaryColor,
                                                                        ),
                                                                        hintText: 'Bank account number (IBAN)',
                                                                        labelText: 'Bank account',
                                                                        labelStyle: TextStyle(color: secondaryColor),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: secondaryColor),
                                                                          // borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: mainColor),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          // borderRadius: BorderRadius.circular(0),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        )),
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'Please enter your account details';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () async {
                                                                  if (_formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    var response = await FirebaseCrud.addDispute(
                                                                        projectName: data['projectname'],
                                                                        description: _descriptionController.text,
                                                                        reason: _reasonController.text,
                                                                        accountNumber: _accountNumberController.text,
                                                                    );

                                                                  }
                                                                },
                                                                child: Text(
                                                                    'Submit'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.035,
                                                          0,
                                                          0),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      decoration: BoxDecoration(
                                                        color: data["paymentStatus"][0] == "Done" ? mainColor : secondaryColor,
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Text("Refund",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      fontFam))),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.165,
                                                            0,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                "${data['field'][0]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        13,
                                                                    color:
                                                                        secondaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                        0,
                                                        0),
                                                    child: const CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                          'happy-bearded-young-man.jpg'),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.01,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.03,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                "${data['Collaborators'][1]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        mainColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.35,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.03,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                " ${data['AmountDue']}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .green,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                  InkWell(
                                                    onTap: data["paymentStatus"][1] == "Done" ? null : () {
                                                      redirectToCheckout(
                                                          context);
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.035,
                                                          0,
                                                          0),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      decoration: BoxDecoration(
                                                        color: data["paymentStatus"][1] == "Done" ? secondaryColor : mainColor,
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                              "Pay Contributor",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      fontFam))),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: data["paymentStatus"][1] != "Done" ? null : () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Request refund'),
                                                            content: Form(
                                                              key: _formKey,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  TextFormField(
                                                                    controller:
                                                                        _reasonController,
                                                                    decoration: const InputDecoration(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .person,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                        hintText: 'Enter your username',
                                                                        labelText: 'Username',
                                                                        labelStyle: TextStyle(color: secondaryColor),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: secondaryColor),
                                                                          // borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: mainColor),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          // borderRadius: BorderRadius.circular(0),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        )),
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'Please enter your user name';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.025,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        _descriptionController,
                                                                    decoration: const InputDecoration(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .description,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                        hintText: 'Reason for Refund',
                                                                        labelText: 'Reason',
                                                                        labelStyle: TextStyle(color: secondaryColor),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: secondaryColor),
                                                                          // borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: mainColor),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          // borderRadius: BorderRadius.circular(0),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        )),
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'Please enter your Description';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                        .size
                                                                        .height *
                                                                        0.025,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                    _accountNumberController,
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter.digitsOnly,
                                                                      CreditCardNumberFormater(),
                                                                      LengthLimitingTextInputFormatter(19)
                                                                    ],
                                                                    decoration: const InputDecoration(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .description,
                                                                          color:
                                                                          secondaryColor,
                                                                        ),
                                                                        hintText: 'Bank account number (IBAN)',
                                                                        labelText: 'Bank account',
                                                                        labelStyle: TextStyle(color: secondaryColor),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: secondaryColor),
                                                                          // borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: mainColor),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          // borderRadius: BorderRadius.circular(0),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        )),
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'Please enter your account details';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  if (_formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    //Navigator.of(context).pop();
                                                                  }
                                                                },
                                                                child: Text(
                                                                    'Submit'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.035,
                                                          0,
                                                          0),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      decoration: BoxDecoration(
                                                        color: data["paymentStatus"][1] == "Done" ? mainColor : secondaryColor,
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Text("Refund",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      fontFam))),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.165,
                                                            0,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                "${data['field'][1]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        13,
                                                                    color:
                                                                        secondaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                        0,
                                                        0),
                                                    child: const CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage(
                                                          'happy-bearded-young-man.jpg'),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.01,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.03,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                "${data['Collaborators'][2]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color:
                                                                        mainColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.35,
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.03,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                " ${data['AmountDue']}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .green,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
                                                  ),
                                                  InkWell(
                                                    onTap: data["paymentStatus"][2] == "Done" ? null : () {
                                                      redirectToCheckout(
                                                          context);
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.035,
                                                          0,
                                                          0),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      decoration: BoxDecoration(
                                                        color: data["paymentStatus"][2] == "Done" ? secondaryColor : mainColor,
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                              "Pay Contributor",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      fontFam))),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: data["paymentStatus"][2] != "Done" ? null : () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Request refund'),
                                                            content: Form(
                                                              key: _formKey,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  TextFormField(
                                                                    controller:
                                                                        _reasonController,
                                                                    decoration: const InputDecoration(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .person,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                        hintText: 'Enter your username',
                                                                        labelText: 'Username',
                                                                        labelStyle: TextStyle(color: secondaryColor),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: secondaryColor),
                                                                          // borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: mainColor),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          // borderRadius: BorderRadius.circular(0),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        )),
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'Please enter your user name';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.025,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        _descriptionController,
                                                                    decoration: const InputDecoration(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .description,
                                                                          color:
                                                                              secondaryColor,
                                                                        ),
                                                                        hintText: 'Reason for Refund',
                                                                        labelText: 'Reason',
                                                                        labelStyle: TextStyle(color: secondaryColor),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: secondaryColor),
                                                                          // borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: mainColor),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          // borderRadius: BorderRadius.circular(0),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        )),
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'Please enter your Description';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                        .size
                                                                        .height *
                                                                        0.025,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                    _accountNumberController,
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter.digitsOnly,
                                                                      CreditCardNumberFormater(),
                                                                      LengthLimitingTextInputFormatter(19)
                                                                    ],
                                                                    decoration: const InputDecoration(
                                                                        icon: Icon(
                                                                          Icons
                                                                              .description,
                                                                          color:
                                                                          secondaryColor,
                                                                        ),
                                                                        hintText: 'Bank account number (IBAN)',
                                                                        labelText: 'Bank account',
                                                                        labelStyle: TextStyle(color: secondaryColor),
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: secondaryColor),
                                                                          // borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              width: 1,
                                                                              color: mainColor),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          // borderRadius: BorderRadius.circular(0),
                                                                        ),
                                                                        errorBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.red,
                                                                              width: 1),
                                                                          //borderRadius: BorderRadius.circular(15),
                                                                        )),
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'Please enter your account details';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  if (_formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  }
                                                                },
                                                                child: Text(
                                                                    'Submit'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025,
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.035,
                                                          0,
                                                          0),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      decoration: BoxDecoration(
                                                        color: data["paymentStatus"][2] == "Done" ? mainColor : secondaryColor,
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Text("Refund",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      fontFam))),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Positioned(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.fromLTRB(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.165,
                                                            0,
                                                            0,
                                                            0),
                                                        child: Column(
                                                          children:
                                                              List.generate(1,
                                                                  (index) {
                                                            return Text(
                                                                "${data['field'][2]}",
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                    fontSize:
                                                                        13,
                                                                    color:
                                                                        secondaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        fontFam));
                                                          }),
                                                        )),
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
                            //footer(),
                          ],
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

class CreditCardNumberFormater extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.selection.baseOffset == 0){
      return newValue;
    }
    String enteredData = newValue.text;   // get data enter by used in textField
    StringBuffer buffer = StringBuffer();
    for(int i = 0;i <enteredData.length;i++){
      // add each character into String buffer
      buffer.write(enteredData[i]);
      int index = i + 1;
      if(index % 4 == 0 && enteredData.length != index){
        // add space after 4th digit
        buffer.write(" ");
      }
    }

    return  TextEditingValue(
        text: buffer.toString(),   // final generated credit card number
        selection: TextSelection.collapsed(offset: buffer.toString().length) // keep the cursor at end
    );
  }
}
