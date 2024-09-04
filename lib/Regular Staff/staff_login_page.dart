import 'package:flutter/material.dart';
import 'package:collegeapp/Regular%20Staff/staff_home_page.dart';

class StaffLoginPage extends StatefulWidget {
  @override
  State<StaffLoginPage> createState() {
    return _MyStaffLoginPageState();
  }
}

class _MyStaffLoginPageState extends State<StaffLoginPage> {
  String _selectedDepartment = ''; // Selected department
  String _selectedStaff = ''; // Selected staff
  String _userId = ''; // User ID
  String _password = ''; // Password

  // Mapping of department names to their respective staff names
  Map<String, List<String>> _departmentStaffMap = {
    'CSE': ['Mr. VIMALATHITHAN S', 'Dr. PARAMESH J', 'Mr. MOHIDEEN ABDUL KADHER M', 'Mrs. GAYATHRI S','Mrs. ANGAYARKANNI N'],
    'IT': ['Dr. WESLIN D', 'Dr. PRAKASH D', 'Mrs. JEBA MALAR M','Mrs. VISWAJA S','Mrs. SANTHANA LAKSHMI S'],
    'MECH': ['Dr. SHUNMUGASUNDARAM M', 'Dr. JANNARTHANAN B', 'Dr. RAMESH G','Dr. SARAVANAN A','Mr. SYED ABUTHAHIR S','Mr. MOHAN S R','Mr.RAJESH J'],
    'CIVIL': ['Dr. SOMESWARAN R', 'Dr. ELLISS YOGESH R', 'Mr. RIZHA UR RAHMAN','Mrs. JANAKI V','Mrs. KAVITHRA P'],
    'ECE': ['Dr. SRINIVASAN K S', 'Dr. MANJU I', 'Dr. GOPALAKRISHNAN S','Mr. KAMARAJAN M','Mrs. SUGANTHI I','Mrs. PIRIYADHARSHINI S'],
    'EEE': ['Dr. JEHA J', 'Dr. DEVIKALA S', 'Dr. KAMALASELVAN A','Mr. CHINTALA VENKATESH','Mr. VINODH S V'],
    'CSBS': ['Staff13', 'Staff14', 'Staff15'],
    'AIDS': ['Staff16', 'Staff17', 'Staff18'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image(image: AssetImage('images/profileTop.png')),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Department Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedDepartment.isNotEmpty ? _selectedDepartment : null,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDepartment = newValue!;
                          _selectedStaff = ''; // Reset selected staff when department changes
                          _userId = ''; // Reset user ID when department changes
                          _password = ''; // Reset password when department changes
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Department',
                        labelStyle: TextStyle(color: Colors.black),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.black),
                      items: _departmentStaffMap.keys.map((String department) {
                        return DropdownMenuItem<String>(
                          value: department,
                          child: Text(department),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),

                    // Staff Dropdown
                    if (_selectedDepartment.isNotEmpty)
                      DropdownButtonFormField<String>(
                        value: _selectedStaff.isNotEmpty ? _selectedStaff : null,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedStaff = newValue!;
                            _userId = ''; // Reset user ID when staff changes
                            _password = ''; // Reset password when staff changes
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Staff',
                          labelStyle: TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                        items: _departmentStaffMap[_selectedDepartment]!.map((String staff) {
                          return DropdownMenuItem<String>(
                            value: staff,
                            child: Text(staff),
                          );
                        }).toList(),
                      ),
                    SizedBox(height: 20),

                    // User ID TextField
                    if (_selectedDepartment.isNotEmpty && _selectedStaff.isNotEmpty)
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'User ID',
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Color(0xff11479A),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _userId = value;
                          });
                        },
                      ),
                    SizedBox(height: 20),

                    // Password TextField
                    if (_selectedDepartment.isNotEmpty && _selectedStaff.isNotEmpty)
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: Color(0xff11479A),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                      ),
                    SizedBox(height: 20),

                    if (_selectedDepartment.isNotEmpty && _selectedStaff.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: TextButton(
                          onPressed: () {
                            // Perform login logic based on selected department and staff
                            if (_selectedDepartment.isNotEmpty && _selectedStaff.isNotEmpty) {
                              String userId = '';
                              String password = '';

                              // Determine user ID and password based on selected department and staff
                              if (_selectedDepartment == 'CSE' && _selectedStaff == 'Mr. VIMALATHITHAN S') {
                                userId = 'vimalcse';
                                password = 'vimal@123';
                              } else if (_selectedDepartment == 'CSE' && _selectedStaff == 'Dr. PARAMESH J') {
                                // Add similar conditions for other departments and staff
                                userId = 'parameshcse';
                                password = 'pramesh@123';
                              } else if (_selectedDepartment == 'IT' && _selectedStaff == 'Dr. WESLIN D') {
                                userId = 'weslinit';
                                password = 'weslin@234';
                              } else if (_selectedDepartment == 'IT' && _selectedStaff == 'Dr. PRAKASH D') {
                                // Add similar conditions for other departments and staff
                                userId = 'prakashcse';
                                password = 'prakash@123';
                              }

                              // Check if the entered user ID and password match the expected values
                              if (_userId == userId && _password == password) {
                                // Navigate to the staff home page if login is successful
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StaffHomePage()));
                              } else {
                                // Show an error message if login fails
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Login Failed'),
                                      content: Text('Invalid user ID or password. Please try again.'),
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
                            }
                          },

                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff11479A)),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            ),
                          ),
                          child: const Text(
                            'Get in',
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
}
