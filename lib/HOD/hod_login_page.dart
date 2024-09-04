import 'package:flutter/material.dart';
import 'package:collegeapp/Admin/admin_login_page.dart';
import 'package:collegeapp/HOD/hod_home_page.dart';

class HodLoginPage extends StatefulWidget {
  @override
  State<HodLoginPage> createState() {
    return _MyHodLoginPage();
  }
}

class _MyHodLoginPage extends State<HodLoginPage> {
  String _selectedDepartment = 'CSE Hod'; // Set initial value to 'CSE Hod'
  String _userId = '';
  String _password = '';

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
                        _userId = value;
                      },
                    ),
                    SizedBox(height: 20),
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
                        _password = value;
                      },
                    ),
                    SizedBox(height: 20),
                    // Dropdown menu for department selection
                    DropdownButtonFormField<String>(
                      value: _selectedDepartment,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDepartment = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Department',
                        labelStyle: TextStyle(color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.black), // Set dropdown text color to white
                      items: <String>[
                        'CSE Hod',
                        'IT Hod',
                        'Mechanical Hod',
                        'Civil Hod',
                        'ECE Hod',
                        'EEE Hod',
                        'CSBS Hod',
                        'AIDS Hod',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0), // Set the border radius
                      child: TextButton(
                        onPressed: () {
                          _validateCredentials();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff11479A)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          ),
                        ),
                        child: const Text(
                          '       Get in            ',
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

  void _validateCredentials() {
    // Validate credentials based on selected department
    switch (_selectedDepartment) {
      case 'CSE Hod':
        if (_userId == 'mohideen' && _password == 'hod@cse') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HodHomePage()));
        }
        break;
      case 'IT Hod':
        if (_userId == 'weslin' && _password == 'hod@it') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HodHomePage()));
        }
        break;
      case 'Mechanical Hod':
        if (_userId == 'mohan' && _password == 'hod@mech') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HodHomePage()));
        }
        break;
      case 'Civil Hod':
        if (_userId == 'somasundaran' && _password == 'hod@civil') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HodHomePage()));
        }
        break;
      case 'ECE Hod':
        if (_userId == 'manju' && _password == 'hod@ece') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HodHomePage()));
        }
        break;
      case 'EEE Hod':
        if (_userId == 'vimal' && _password == 'hod@eee') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HodHomePage()));
        }
        break;
      case 'CSBS Hod':
      case 'AIDS Hod':
        if (_userId == 'name' && _password == 'hod@csbs') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HodHomePage()));
        }
        break;
      default:
      // Handle other departments
        break;
    }
  }
}
