import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('posts');

class FirebaseCrud {

  static Future<Response> updatePostApproval({
    required String docId, required String approval,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "approval": approval,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Post Successfully Updated";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
