import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import '../../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = FirebaseFirestore.instance.collection("posts");
final CollectionReference _CollectionProfile = FirebaseFirestore.instance.collection("users");

class FirebaseCrud {

  static Future<Response> addEmployee({
    required String tasksdescription,
    required String tasksname,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "tasksname": tasksname,

      "taskdescription": tasksdescription,
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



  static Future<Response> updateTasks({
    required String docId,
    required String tasksname,
    required String tasksdescription,
    required String taskstatuses,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "tasksname": FieldValue.arrayUnion([tasksname]),
      "tasksdescription": FieldValue.arrayUnion([tasksdescription]),
      "taskstatuses": FieldValue.arrayUnion(["Pending"]),
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "Successfully updated Tasks";
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

  static Future<Response> deleteProfile({
    required String docId,
  }) async {
     Response response = Response();
    DocumentReference documentReferencer =
        _CollectionProfile.doc(docId);

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