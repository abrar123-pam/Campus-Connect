import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  final Map<String, dynamic> studentDetails;
  const ProfilePage({Key? key, required this.studentDetails}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0E4192),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: <Widget>[
          _buildProfileHeader(),
          _buildSectionTitle('Student Information'),
          _buildInformationRow('Name', widget.studentDetails['name']),
          _buildInformationRow('Email', widget.studentDetails['email']),
          _buildInformationRow('Register Number',widget.studentDetails['registrationNumber']),
          _buildInformationRow('Year', widget.studentDetails['year']),
          _buildInformationRow('Department', widget.studentDetails['department']),
          _buildInformationRow('Semester',widget.studentDetails['semester']),
          // _buildInformationRow('Section', widget.studentDetails['section'])
        ],
      ),
    );
  }
}

Widget _buildProfileHeader() {
  return Container(
    height: 150,
    color: Colors.blue,
    child: Center(
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.white, // Set default profile image background color
        child: Icon(
          Icons.person,
          size: 80,
          color: Colors.blue, // Set default profile image icon color
        ),
      ),
    ),
  );
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildInformationRow(String label, String value) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xff0E4192),
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsets.all(8),
    child: ListTile(
      title: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16,color: Colors.white),
        ),
      ),
    ),
  );
}


