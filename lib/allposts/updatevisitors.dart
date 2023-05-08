import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('stats');

class FirebaseVisitors {

  static Future<Response> updateVisitors({
    required String visitors,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc("docvisitors");

    Map<String, dynamic> data = <String, dynamic>{
      "visitors": visitors.toString(),
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      print("Visitors updated");
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
