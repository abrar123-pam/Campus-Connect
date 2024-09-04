import 'package:collegeapp/HOD/show_student_data.dart';
import 'package:flutter/material.dart';
import 'package:collegeapp/HOD/student_data_page.dart';
import 'package:collegeapp/HOD/new_student_page.dart';
class StudentDataPage extends StatefulWidget {
  @override
  _StudentPageScreenState createState() => _StudentPageScreenState();
}

class _StudentPageScreenState extends State<StudentDataPage> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MSAJCE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0E4192),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: CustomButton(
                icon: Icons.add,
                label: 'Add new student',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> NewStudentPage()));               },
              ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 150,
              height: 150,
              child: CustomButton(
                icon: Icons.edit,
                label: 'Update or delete student',
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> StudentListPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10), // Reduce padding to prevent overflow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Color(0xff0E4192),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.white,
            ),
            SizedBox(height: 5), // Adjusted SizedBox height
            Flexible( // Use Flexible to allow text to wrap
              child: Text(
                label,
                textAlign: TextAlign.center, // Center text
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
