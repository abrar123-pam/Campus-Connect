import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:collegeapp/Service.dart'; // Import your service class

class AttendancePage extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<AttendancePage> {
  List<Student> students = []; // List to store student details
  List<bool> attendance = []; // List to store attendance status of each student
  DateTime selectedDate = DateTime.now(); // Selected date, initialized to current date

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  Future<void> _fetchStudents() async {
    try {
      // Fetch student details from the database using your service class
      var response = await Service().getUser();
      if (response.statusCode == 200) {
        List<dynamic> studentData = json.decode(response.body);
        setState(() {
          // Extract student details from the response data and convert to Student objects
          students = studentData.map<Student>((student) => Student(id: student['id'], name: student['name'])).toList();
          // Initialize attendance list with all students marked as absent initially
          attendance = List.filled(students.length, false);
        });
      } else {
        print("Failed to fetch students: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching students: $e");
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        if (pickedDate.isAfter(DateTime.now())) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You can only put attendance for up to today, not for future dates.'),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          selectedDate = pickedDate;
        }
      });
    }
  }

  Future<void> _saveAttendance() async {
    try {
      // Prepare attendance data
      List<Map<String, dynamic>> attendanceData = [];
      for (int i = 0; i < students.length; i++) {
        attendanceData.add({
          'studentId': students[i].id, // Use student ID instead of name
          'date': selectedDate.toString(),
          'isPresent': attendance[i],
        });
      }

      // Send attendance data to API
      var response = await Service().saveAttendance(attendanceData);

      // Handle response
      if (response.statusCode == 201) {
        // Attendance saved successfully
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Attendance saved successfully'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        // Failed to save attendance
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save attendance'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print('Error saving attendance: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance - ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0E4192),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: students.isEmpty // Check if student list is empty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: attendance[index] ? Colors.red : Colors.green, // Set color based on attendance
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(
                students[index].name,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                attendance[index] ? 'A' : 'P',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                setState(() {
                  attendance[index] = !attendance[index]; // Toggle attendance status
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveAttendance,
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff0E4192),
      ),
    );
  }
}

class Student {
  final int id;
  final String name;

  Student({required this.id, required this.name});
}
