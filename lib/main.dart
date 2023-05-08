import 'package:flutter/material.dart';
import 'package:procollab_web/allposts/updatevisitors.dart';
import 'package:procollab_web/headerfooter/footer.dart';
import 'package:procollab_web/headerfooter/headerpresignup.dart';
import 'package:procollab_web/preloginsignup/projects.dart';
import 'package:procollab_web/preloginsignup/tasks.dart';
import 'package:procollab_web/preloginsignup/LineSpaceBetween.dart';
import 'package:procollab_web/preloginsignup/earnings.dart';
import 'package:procollab_web/preloginsignup/progress.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
        projectId: "fir-authentication-ef41b",
        messagingSenderId: "712311594484",
        appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
        storageBucket: "fir-authentication-ef41b.appspot.com",
      )
  );
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  CollectionReference users = FirebaseFirestore.instance.collection("stats");
  var visitors;
  var temp = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context) {
            return Scaffold(

              body:
              SingleChildScrollView(

                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      FutureBuilder<DocumentSnapshot>(
                        future: users.doc("docvisitors").get(),
                        builder: ((context, snapshot){
                          if (snapshot.connectionState == ConnectionState.done) {
                            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                            visitors = int.parse("${data["visitors"]}");
                            print("VISITORS: $visitors");
                            visitors = visitors + 1;
                            if(temp == 0) {
                              FirebaseVisitors.updateVisitors(
                                visitors: visitors.toString(),
                              );
                              temp++;
                            }
                          }
                          return Container();
                        }

                        ),
                      ),

                      header(),

                      ProjectsSt(),

                      LineSpacing(),

                      TaskSt(),

                      LineSpacing(),

                      ProgressSt(),

                      LineSpacing(),

                      EarningsSt(),

                      footer(),

                    ],
                  ),
                ),


              ),


            );
          }
      ),
    );
  }
}

