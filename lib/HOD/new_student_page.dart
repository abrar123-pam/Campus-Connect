import 'package:flutter/material.dart';
import 'package:collegeapp/HOD/student_data_page.dart';
import 'package:collegeapp/HOD/new_student_details.dart';
class NewStudentPage extends StatefulWidget {
  @override
  _NewStudentState createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudentPage> {
  String? selectedYear;
  String? selectedDepartment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add new student',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0), // Padding for the dropdown
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), // Border radius for the dropdown container
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedYear,
                  hint: Text('Select Year'),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedYear = newValue;
                    });
                  },
                  items: <String>['First Year', 'Second Year', 'Third Year', 'Fourth Year']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0), // Padding for the dropdown
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), // Border radius for the dropdown container
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedDepartment,
                  hint: Text('Select Department'),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDepartment = newValue;
                    });
                  },
                  items: <String>['Computer Science and Engineering',
                    'Information Technology',
                    'Artificial Intelligence ',
                    'Mechanical Engineering',


                  ]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => NewStudentprofile(
                        selectedYear: selectedYear,
                        selectedDepartment: selectedDepartment,
                      ),));
                },
                child: Text('Add'),
              ),
              // Add more widgets or buttons here
            ],
          ),
        ),
      ),
    );
  }
}
