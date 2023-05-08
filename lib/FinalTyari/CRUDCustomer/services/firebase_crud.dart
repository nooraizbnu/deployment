import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Customers');

class FirebaseCrud {

  static Future<Response> addCustomer({
    required String name,
    required String address,
    required String ordered,
    required String gender,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "address": address,
      "items_ordered" : ordered,
      "gender" : gender,
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



  static Future<Response> updateCustomer({
    required String name,
    required String address,
    required String ordered,
    required String gender,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "address": address,
      "items_ordered" : ordered,
      "gender" : gender,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "Successfully updated Customer";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

  static Stream<QuerySnapshot> readCustomer() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deleteCustomer({
    required String docId,
  }) async {
     Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
          response.code = 200;
          response.message = "Successfully Deleted Customer";
        })
        .catchError((e) {
           response.code = 500;
            response.message = e;
        });

   return response;
  }

}