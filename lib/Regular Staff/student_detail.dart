import 'package:collegeapp/Regular%20Staff/profile_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:collegeapp/Service.dart';

class StudentDetailPage extends StatefulWidget {
  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetailPage> {
  List<dynamic> _students = [];

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  Future<void> _fetchStudents() async {
    // Fetch student details from the database
    try {
      var response = await Service().getUser();
      if (response.statusCode == 200) {
        setState(() {
          _students = json.decode(response.body);
        });
      } else {
        print("Failed to fetch students: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching students: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0E4192),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _students.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xff0E4192), // Set the background color here
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                // Navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(studentDetails: _students[index],)),
                );
              },
              child: ListTile(
                title: Text(
                  _students[index]['name'],
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  _students[index]['registrationNumber'],
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    // Navigate to the next page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage(studentDetails: _students[index],)),
                    );
                  },
                ),
                // Add more details as needed
              ),
            ),
          );

        },
      ),
    );
  }
}
