import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/allposts.dart';
import 'package:procollab_web/earnings/Earnings.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpostsignin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
    projectId: "fir-authentication-ef41b",
    messagingSenderId: "712311594484",
    appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
  ));
  runApp(earningsMain());
}

class earningsMain extends StatefulWidget {
  const earningsMain({Key? key}) : super(key: key);

  @override
  State<earningsMain> createState() => _earningsMainState();
}

class _earningsMainState extends State<earningsMain> {
  static const mainColor = Color(0xFF5364B8);
  static const secondaryColor = Color(0xFF7886CB);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      headerpostsu(), //Header post SignUp

                      Container(
                        margin: EdgeInsets.only(top: 100),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          "EARNINGS",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.06,
                              color: Colors.white),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          "All Projects",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              color: mainColor),
                        ),
                      ),

                      SPEarnings(), //

                      footer(), // Footer
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
