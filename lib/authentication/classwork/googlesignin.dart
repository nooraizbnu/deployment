// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// void main () => runApp(googleSignIn());
//
// class googleSignIn extends StatefulWidget {
//   const googleSignIn({Key? key}) : super(key: key);
//
//   @override
//   State<googleSignIn> createState() => _googleSignInState();
// }
//
// class _googleSignInState extends State<googleSignIn> {
//
//   final _formKey = GlobalKey<FormState>();
//
//
//   TextEditingController _emailController=new TextEditingController();
//   TextEditingController _passwordController=new TextEditingController();
//
//
//
//
//
//   Future<void> sign_up() async {
//
//
//
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text)
//           .then((value) {
//
//       });
//     } catch (e) {
//
//       setState(() {
//
//       });
//     }
//
//   }
//   Future<void> Signin()  async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text)
//           .then((value) {
//       });
//     } catch (e) {
//
//       setState(() {
//
//       });
//     }
//   }
//   Future<void> ResetPassword()async {
//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
//
//       });
//     } catch (e) {
//       setState(() {
//
//       });
//     }
//   }
//
//   googleSignIn _googleSignIn = GoogleSignIn(
//     scopes: <String>[
//       'email',
//     ],
//   );
//
//   Future<void> _handleSignIn() async {
//     try {
//       final googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) return;
//
//       final googleAuth = await googleUser.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       try {
//         await FirebaseAuth.instance
//             .signInWithCredential(credential)
//             .then((value) {
//
//
//         });
//       } catch (e) {
//
//
//       }
//     } catch (e) {
//       print(e);
//
//     }
//   }
//
//   final GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: true,
//       home: Scaffold(
//         body: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children:
//             [
//
//               Center(child: Text("Signing In with Google"),),
//
//               Container(
//                   padding: const EdgeInsets.only(left: 0.0, top: 40.0),
//                   child:  ElevatedButton(
//                     child:  Text('SignIn with Google'),
//                     onPressed: () {
//                       ResetPassword();
//                       //Navigator.push(context, MaterialPageRoute(builder: (context)=> Second(statusArray: statusArray)));
//
//                     },
//                   )),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
