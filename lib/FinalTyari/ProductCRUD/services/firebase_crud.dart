import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Products');

class FirebaseCrud {

  static Future<Response> addProduct({
    required String name,
    required String details,
    required String quantity,
    required String price,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "details": details,
      "quantity" : quantity,
      "price" : price,
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



  static Future<Response> updateProduct({
    required String name,
    required String details,
    required String quantity,
    required String price,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "details": details,
      "quantity" : quantity,
      "price" : price,
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

  static Stream<QuerySnapshot> readProduct() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deleteProduct({
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