import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('posts');
final CollectionReference _CollectionProfile = _firestore.collection('users');

class FirebaseCrud {

  static Future<Response> addEmployee({
    required String documentId,
    required String name,
    required String projectname,
    required String collaboratorsneeded,
    required String area,
    required String email,
    required String AmountDue,
    required String AmountEarned,
    required String experience,
    required String paihay,
    required String projectdescription,
    required String requirements,
    required String responsibilities,
    required String approval,
    //required String picture,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "AmountDue": AmountDue,
      "AmountEarned": AmountEarned,
      "approval": approval,
      "collaboratorsneeded": collaboratorsneeded,
      "area": area,
      "email": email,
      "experience": experience,
      "paihay": paihay,
      "projectdescription": projectdescription,
      "projectname": projectname,
      "requirements": requirements,
      "responsibilities": responsibilities,
      "ProjectStatus": "In Progress",
      'Collaborators': List.generate(0, (r) => ""),
      'CollaboratorsEmail': List.generate(0, (r) => ""),
      'CollaboratorsField': List.generate(0, (r) => ""),
      'paymentStatus': List.generate(0, (r) => "Pending"),
      "ticketsuid": List.generate(0, (r) => ""),
      // 'tasksdescription': List.generate(0, (r) => ""),
      // 'tasksname': List.generate(0, (r) => ""),
      // 'taskstatuses': List.generate(0, (r) => ""),
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
          response.code = 200;
          response.message = "Successfully added to the database";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

  static Future<Response> updatePost({
    required String name,
    required String projectname,
    required String collaboratorsneeded,
    required String area,
    required String email,
    required String AmountDue,
    required String AmountEarned,
    required String experience,
    required String paihay,
    required String projectdescription,
    required String requirements,
    required String responsibilities,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "AmountDue": AmountDue,
      "AmountEarned": AmountEarned,
      "collaboratorsneeded": collaboratorsneeded,
      "area": area,
      "email": email,
      "experience": experience,
      "paihay": paihay,
      "projectdescription": projectdescription,
      "projectname": projectname,
      "requirements": requirements,
      "responsibilities": responsibilities,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Successfully updated Post";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readPosts() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deletePost({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
      response.code = 200;
      response.message = "Successfully Deleted Post";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> updateProfile({
    required String name,
    required String field,
    required String email,
    required String from,
    required String linkedin,
    required String ongoingprojects,
    required String projectscompleted,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _CollectionProfile.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "field": field,
      "email": email,
      "from": from,
      "linkedin": linkedin,
      "ongoingprojects": ongoingprojects,
      "projectscompleted": projectscompleted,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Successfully updated Profile";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> deleteProfile({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
      response.code = 200;
      response.message = "Successfully Deleted Profile";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

}