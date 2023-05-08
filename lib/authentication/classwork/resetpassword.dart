import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Text_field2 extends StatefulWidget {
  const Text_field2({Key? key}) : super(key: key);

  @override
  State<Text_field2> createState() => _Text_field2State();
}

class _Text_field2State extends State<Text_field2> {

  final _formKey = GlobalKey<FormState>();


  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();

  Future<void> ResetPassword()async {
    try {
      print("Email: ${_emailController}");
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text).then((value) {

      });
    } catch (e) {
      print("Reset Failed");
      setState(() {

      });
    }
  }



  @override
  Widget build(BuildContext context) {



    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [

                  Center(child: Text("RESET PASSWORD"),),

                  // TextFormField(
                  //   controller:_emailController ,
                  //   decoration:  InputDecoration(
                  //       icon: const Icon(Icons.person),
                  //       hintText: 'Enter your full name',
                  //       labelText: 'Name',
                  //       labelStyle: TextStyle(color: Color.fromRGBO(248, 185, 48, 1)),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(width: 10, color: Colors.green),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(width: 10, color: Colors.red),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       focusedErrorBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.red, width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ) ,
                  //       errorBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.red, width: 1),
                  //         borderRadius: BorderRadius.circular(15),
                  //       )
                  //   ),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter some text';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your email address',
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter valid email address';
                      }
                      return null;
                    },
                  ),

                  Container(
                      padding: const EdgeInsets.only(left: 0.0, top: 40.0),
                      child:  ElevatedButton(
                        child:  Text('OK'),
                        onPressed: () {
                          ResetPassword();
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> Second(statusArray: statusArray)));
                          // It returns true if the form is valid, otherwise returns false
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a Snackbar.
                            print(_emailController.text);
                            print(_passwordController.text);
                          }
                        },
                      )),

                ],
              ),
            ),
            ),
        );
    }
}
