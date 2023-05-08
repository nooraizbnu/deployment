import 'package:flutter/material.dart';
import 'package:procollab_web/postdetail/details.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpostsignin.dart';

class fetchDetails extends StatefulWidget {
  //const fetchDetails({Key? key}) : super(key: key);
  final String documentId;

  fetchDetails({required this.documentId});


  @override
  State<fetchDetails> createState() => _fetchDetailsState(documentId: this.documentId);
}

class _fetchDetailsState extends State<fetchDetails> {
  final String documentId;
  //
  _fetchDetailsState({required this.documentId});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    headerpostsu(),
                    SPDetail(documentId: documentId),
                    footer(),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
