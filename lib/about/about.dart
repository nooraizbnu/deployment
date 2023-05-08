import 'package:flutter/material.dart';
import 'package:procollab_web/about/aboutscreen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => AboutScreen(
                profilePictureUrl: 'https://example.com/profile.png',
                username: 'John Doe',
                fieldOfWork: 'Software Engineer',
                linkedInProfile: 'https://www.linkedin.com/in/johndoe/',
                emailId: 'johndoe@example.com',
                city: 'San Francisco',
                completedProjects: [
                  'Flutter App for XYZ Inc.',
                  'React Native App for ABC Corp.',
                  'Vue.js website for QWE Corp.',
                ],
                ongoingProjects: [
                  'Node.js backend for XYZ Inc.',
                  'Python script for ABC Corp.',
                ],
              ),
            ));
          },
          child: Text('About'),
        ),
      ),
    );
  }
}
