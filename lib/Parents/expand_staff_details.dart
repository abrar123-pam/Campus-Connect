import 'package:flutter/material.dart';

class ExpandStaffDetailPage extends StatelessWidget {
  final String name;
  final String designation;
  final String subject;
  final String email;
  final String phoneNumber;

  ExpandStaffDetailPage({
    required this.name,
    required this.designation,
    required this.subject,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0E4192),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Card(
          color: Color(0xff0E4192),
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('Name',style: TextStyle(color: Colors.white),),
                  subtitle: Text(name,style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  title: Text('Designation',style: TextStyle(color: Colors.white)),
                  subtitle: Text(designation,style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  title: Text('Subject',style: TextStyle(color: Colors.white)),
                  subtitle: Text(subject,style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  title: Text('Email',style: TextStyle(color: Colors.white)),
                  subtitle: Text(email,style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  title: Text('Phone Number',style: TextStyle(color: Colors.white)),
                  subtitle: Text(phoneNumber,style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
