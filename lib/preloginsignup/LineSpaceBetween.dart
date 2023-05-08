import 'package:flutter/material.dart';


class LineSpacing extends StatefulWidget {
  const LineSpacing({Key? key}) : super(key: key);

  @override
  State<LineSpacing> createState() => _LineSpacingState();
}

class _LineSpacingState extends State<LineSpacing> {

  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);
  static const fontFam = "DM Sans";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.1, MediaQuery.of(context).size.height*0.025, MediaQuery.of(context).size.height*0.045),
          height: MediaQuery.of(context).size.height*0.005,
          width: MediaQuery.of(context).size.width*0.65,
          decoration: BoxDecoration(
            color: mainColor,
            // border: Border.all(color: mainColor, width: 2.5),
            borderRadius: new BorderRadius.circular(10),
          ),


        ),
      ),
    );
  }
}

