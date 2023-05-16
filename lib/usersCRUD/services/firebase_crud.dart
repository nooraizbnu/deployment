import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import '../../signup/details.dart';
import '../models/response.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('users');

class FirebaseCrud {

  static Future<Response> addUser({
    required String email,
    required String username,
    required String firstName,
    required String lastName,
    required String dob,
    required String gender,
    required String city,
    required String state,
    required String fieldofwork,
    required String description,
    required String linkedin,
    required String name,
    required String area,
    required String from,

  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(FirebaseAuth.instance.currentUser!.uid);

    Map<String, dynamic> data = <String, dynamic>{
      "email": email,
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "dob" : dob,
      "gender" : gender,
      "city" : city,
      "state" : state,
      "fieldofwork" : fieldofwork,
      "description" : description,
      "linkedin" : linkedin,
      "status" : "unavailable",
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "name": name,
      "field": area,
      "from": from,
      "projectscompleted": 0,
      "ongoingprojects": 0,
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
          response.code = 200;
          response.message = "User successfully added to the database";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

}