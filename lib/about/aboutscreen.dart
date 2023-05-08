import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  final String profilePictureUrl;
  final String username;
  final String fieldOfWork;
  final String linkedInProfile;
  final String emailId;
  final String city;
  final List<String> completedProjects;
  final List<String> ongoingProjects;

  AboutScreen({
    required this.profilePictureUrl,
    required this.username,
    required this.fieldOfWork,
    required this.linkedInProfile,
    required this.emailId,
    required this.city,
    required this.completedProjects,
    required this.ongoingProjects,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(profilePictureUrl),
              radius: 50.0,
            ),
            SizedBox(height: 16.0),
            Text(
              username,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              fieldOfWork,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(emailId),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text(city),
            ),
            SizedBox(height: 16.0),
            Text(
              'Completed Projects',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: completedProjects
                  .map((project) => Text('- $project'))
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ongoing Projects',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ongoingProjects
                  .map((project) => Text('- $project'))
                  .toList(),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => launch(linkedInProfile),
              child: Text(
                'LinkedIn Profile',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
