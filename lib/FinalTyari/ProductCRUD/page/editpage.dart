
import 'package:flutter/material.dart';

import '../models/employee.dart';
import '../services/firebase_crud.dart';
import 'listpage.dart';

class EditProduct extends StatefulWidget {
final Product? product;
 EditProduct({this.product});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditProduct();
  }
}

class _EditProduct extends State<EditProduct> {
  final name = TextEditingController();
  final details = TextEditingController();
  final quantity = TextEditingController();
  final price = TextEditingController();
  final _docid = TextEditingController();

   
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
    _docid.value = TextEditingValue(text: widget.product!.uid.toString());
    name.value = TextEditingValue(text: widget.product!.name.toString());
    details.value = TextEditingValue(text: widget.product!.details.toString());
    quantity.value = TextEditingValue(text: widget.product!.quantity.toString());
    price.value = TextEditingValue(text: widget.product!.price.toString());

}

  @override
  Widget build(BuildContext context) {


    final DocIDField = TextField(
        controller: _docid,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Doc Id",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));



    final nameField = TextFormField(
        controller: name,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Name",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final detailsField = TextFormField(
        controller: details,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Details",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final quantityField = TextFormField(
        controller: quantity,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Quantity",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final priceField = TextFormField(
        controller: price,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Price",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListPage(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        },
        child: const Text('View List of Products'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.updateProduct(
                name: name.text,
                details: details.text,
                quantity: quantity.text,
                price: price.text,
                docId: _docid.text);
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
        child: Text(
          "Update",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Update Product'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DocIDField,
                  const SizedBox(height: 25.0),
                  nameField,
                  const SizedBox(height: 25.0),
                  detailsField,
                  const SizedBox(height: 35.0),
                  quantityField,
                  const SizedBox(height: 35.0),
                  priceField,
                  const SizedBox(height: 35.0),
                  viewListbutton,
                  const SizedBox(height: 45.0),
                  SaveButon,
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
