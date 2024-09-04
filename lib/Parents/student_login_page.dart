import 'package:flutter/material.dart';
import 'package:collegeapp/Parents/student_det.dart'; // Import the StudentDetailsPage
// Import the Student class from student_det.dart
// Your other code remains unchanged


class ParentsLoginPage extends StatefulWidget {
  @override
  State<ParentsLoginPage> createState() {
    return _MyparentsLoginPage();
  }
}

class _MyparentsLoginPage extends State<ParentsLoginPage> {
  TextEditingController registerNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg.jpeg'),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image(image: AssetImage('images/parent.png')),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: registerNumberController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: '   Register Number',
                        labelStyle: TextStyle(color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Color(0xff11479A),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: TextButton(
                        onPressed: () {
                          // Extract register number
                          String registerNumber =
                              registerNumberController.text;
                          // Check if register number is correct
                          if (isCorrectRegisterNumber(registerNumber)) {
                            Student studentDetails =
                            fetchStudentDetails(registerNumber);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentDetailsPage(studentDetails),
                              ),
                            );

                          } else {
                            // Show error dialog for wrong register number
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Oops!'),
                                  content: Text('You have entered a wrong register number.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff11479A)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          ),
                        ),
                        child: const Text(
                          '       Get Details            ',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to check if the register number is correct
  bool isCorrectRegisterNumber(String registerNumber) {
    // Assuming some validation logic here, replace with your actual validation
    // For demonstration purpose, let's check if the register number has a length of 12 characters
    return registerNumber.length == 12;
  }
}

// Dummy Student class and function
// class Student {
//   final String name;
//   final String year;
//   final String department;
//
//   Student({required this.name, required this.year, required this.department});
// }

Student fetchStudentDetails(String registerNumber) {
  // Hardcoded dummy data for demonstration
  if (registerNumber == '311820104004') {
    return Student(
      name: 'Abrar Musharraf P',
      year: 'Final year',
      department: 'Computer Science and Engineering',
    );
  } else if (registerNumber == '311820104033') {
    return Student(
      name: 'Sakthival K H',
      year: 'Final year',
      department: 'Computer Science and Engineering',
    );
  } else if (registerNumber == '311820104019') {
    return Student(
      name: 'Mohamed Hanifa Harish',
      year: 'Final year',
      department: 'Computer Science and Engineering',
    );
  } else if (registerNumber == '311820104027') {
    return Student(
      name: 'Mohammed Siddique C',
      year: 'Final year',
      department: 'Computer Science and Engineering',
    );
  } else if (registerNumber == '311820104021') {
    return Student(
      name: 'Mohammed Nabeel',
      year: 'Final year',
      department: 'Computer Science and Engineering',
    );
  }
  else {
    // Return default student if register number not found
    return Student(
      name: 'Unknown',
      year: 'Unknown',
      department: 'Unknown',
    );
  }
}
