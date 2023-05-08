import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/authentication/classwork/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Text_field());
}

class Text_field extends StatefulWidget {
  const Text_field({Key? key}) : super(key: key);

  @override
  State<Text_field> createState() => _Text_fieldState();
}

class _Text_fieldState extends State<Text_field> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();

  Future<void> sign_up() async {

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text
      )
      .then((value){
        print(_emailController);
        print(_passwordController);

      // Navigator.push(context, MaterialPageRoute(builder: (context)=> Text_field1()));
      });
    }

    catch(e) {
      print(e);
      setState(() {});
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
                  children:[
                    Center(child: Text("SIGN UP"),),
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
                        labelText: 'Passwod',
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
                        child:  Text('Register'),
                        onPressed: () {
                          sign_up();
                          // It returns true if the form is valid, otherwise returns false
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a Snackbar.
                            print(_emailController.text);
                            print(_passwordController.text);
                          }
                        },
                    )),

                    Container(
                      padding: const EdgeInsets.only(left: 0.0, top: 0.0),
                      child:  ElevatedButton(
                        child:  Text('SignIn'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Text_field1()));

                        },
                      )),


                  ],
                ),
            ),
          );
        }
        ),
    );
  }
}
