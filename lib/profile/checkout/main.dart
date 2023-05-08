import 'package:flutter/material.dart';
import 'stripe_checkout.dart';
import 'package:firebase_core/firebase_core.dart';

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
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stripe Checkout Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (_) => HomePage(),
        '/success': (_) => SuccessPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => redirectToCheckout(context),
          child: Text('Stripe Checkout in Flutter!'),
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Success',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}