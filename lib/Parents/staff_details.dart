import 'package:flutter/material.dart';
import 'package:collegeapp/Parents/expand_staff_details.dart';

class StaffDetailPage extends StatefulWidget {
  @override
  _StaffDetailPageState createState() => _StaffDetailPageState();
}

class _StaffDetailPageState extends State<StaffDetailPage> {
  List<Map<String, String>> staffMembers = [
    {
      'name': 'Vimal',
      'designation': 'Head of Coe',
      'Subject': 'Human Computer Interaction',
      'email': 'vimaladithyanmsajce-edu.in',
      'Phone Number': '+91 987654321'
    },
    {
      'name': 'Mohideen',
      'designation': 'Head of Department(CSE)',
      'Subject': 'Engineering Mathematics',
      'email': 'mohideenmsajce-edu.in',
      'Phone Number': '+91 9872342321'
    },
    {
      'name': 'Asrin Mahmoota',
      'designation': 'Assistant Professor',
      'Subject': 'Database Management System',
      'email': 'asrimmahmootaanmsajce-edu.in',
      'Phone Number': '+91 9874653321'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0E4192),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: staffMembers.length,
        itemBuilder: (context, index) {
          final staffMember = staffMembers[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(staffMember['name']!),
              subtitle: Text(staffMember['designation']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpandStaffDetailPage(
                      name: staffMember['name']!,
                      designation: staffMember['designation']!,
                      subject: staffMember['Subject']!,
                      email: staffMember['email']!,
                      phoneNumber: staffMember['Phone Number']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
