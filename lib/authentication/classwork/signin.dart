import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/authentication/classwork/resetpassword.dart';

class Text_field1 extends StatefulWidget {
  const Text_field1({Key? key}) : super(key: key);

  @override
  State<Text_field1> createState() => _Text_field1State();
}

class _Text_field1State extends State<Text_field1> {

  final _formKey = GlobalKey<FormState>();


  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();



  Future<void> sign_in() async
  {
    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      )
          .then((value){
        print("Login Successful");
      });
    }

    catch(e)
    {
      print("Enter correct email or password");
      setState(() {

      });
    }

  }


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) {
              return Scaffold(
                body: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Center(child: Text("SIGN IN"),),


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
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.password),
                          hintText: 'Enter your Password',
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter valid Password';
                          }
                          return null;
                        },
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 0.0, top: 40.0),
                          child:  ElevatedButton(
                            child:  Text('Login'),
                            onPressed: () {
                              sign_in();
                              // It returns true if the form is valid, otherwise returns false
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar.
                                print(_emailController.text);
                                print(_passwordController.text);
                              }
                            },
                          )
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 0.0, top: 40.0),
                          child:  ElevatedButton(
                            child:  Text('Reset Password'),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Text_field2()));

                            },
                          )
                      ),

                    ],
                  ),
                ),
              );
            }
            ),
        );
    }
}
