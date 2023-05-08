import 'package:procollab_web/CRUD/main.dart';
import 'package:procollab_web/FinalTyari/CRUD/page/addpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:procollab_web/FinalTyari/CRUDCustomer/main.dart';
import 'package:procollab_web/FinalTyari/ProductCRUD/main.dart';

// import 'Input_/switch.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBJ9HcdFos8Bx85m9Jj2X3BPt3U7MhRV50",
        projectId: "fir-authentication-ef41b",
        messagingSenderId: "712311594484",
        appId: "1:712311594484:web:15e0dcb3b32f4406c36da1",
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: EmployeeHome(title: appTitle),
    );
  }
}

class EmployeeHome extends StatelessWidget {
  const EmployeeHome({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: AddPage(),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Employees CRUD'),
            ),
            ListTile(
              title: const Text('Customer'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomerHome(title: title,)));
              },
            ),
            ListTile(
              title: const Text('Employees'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeeHome(title: title)));
              },
            ),
            ListTile(
              title: const Text('Product'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductHome(title: title)));
              },
            ),
          ],
        ),
      ),
    );
  }
}

