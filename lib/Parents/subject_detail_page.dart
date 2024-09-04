import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubjectDetails extends StatelessWidget {

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subjects',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0E4192),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('ENGINEERING CHEMISTRY'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _launchURL('https://padeepz.net/cy3151-syllabus-engineering-chemistry-regulation-2021-anna-university/');
              },
            ),
            ListTile(
              title: Text('ENGINEERING MATHEMATICS 1'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                _launchURL('https://www.msajce-edu.in/');

              },
            ),
            ListTile(
              title: Text('C PROGRAMMING'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              title: Text('ENGINEERING PHYSICS'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              title: Text('HUMAN COMPUTER INTERACTION'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ],
        ).toList(),
      ),
    );
  }
}


