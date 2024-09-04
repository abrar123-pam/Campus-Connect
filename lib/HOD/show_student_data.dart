import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:collegeapp/service.dart'; // Import your Service class

class StudentListPage extends StatefulWidget {
  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<dynamic> students = []; // List to store fetched student data
  bool isLoading = true; // Indicates whether data is being loaded

  // Function to fetch student data
  Future<void> fetchStudents() async {
    setState(() {
      isLoading = true; // Set isLoading to true while fetching data
    });

    try {
      // Call the getUser method from your Service class to fetch student data
      var response = await Service().getUser();

      if (response.statusCode == 200) {
        // If the request is successful (status code 200), parse the response body
        var data = json.decode(response.body);
        setState(() {
          students = data; // Update the students list with fetched data
        });
      } else {
        // If the request fails, print the error message
        print('Failed to load student data: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Catch any exceptions that occur during the request
      print('Error fetching student data: $error');
    } finally {
      setState(() {
        isLoading = false; // Set isLoading to false after fetching data
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStudents(); // Call fetchStudents when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          // Build a list of cards from the fetched student data
          return Card(
            color: Colors.blue, // Set card background color to blue
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${students[index]['name']}', style: TextStyle(color: Colors.white)),
                  Text('Email: ${students[index]['email']}', style: TextStyle(color: Colors.white)),
                  Text('Registration Number: ${students[index]['registrationNumber']}', style: TextStyle(color: Colors.white)),
                  Text('Semester: ${students[index]['semester']}', style: TextStyle(color: Colors.white)),
                  Text('Section: ${students[index]['section']}', style: TextStyle(color: Colors.white)),
                  Text('Year: ${students[index]['year']}', style: TextStyle(color: Colors.white)),
                  Text('Department: ${students[index]['department']}', style: TextStyle(color: Colors.white)),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete,color: Colors.white,size: 30,),
                onPressed: () {
                  // Implement delete functionality here
                  // You can call a function to delete the student from the backend
                  // For example: deleteStudent(students[index]['id'])
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
