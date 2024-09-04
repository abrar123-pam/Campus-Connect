import 'package:flutter/material.dart';
import 'package:collegeapp/Admin/admin_home_page.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  State<AdminLoginPage> createState() {
    return _MyAdminLoginPageState();
  }
}

class _MyAdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Container(
                  width:  200,
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
                      controller: _userIdController,
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
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
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
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: TextButton(
                        onPressed: () {
                          String userId = _userIdController.text;
                          String password = _passwordController.text;
                          if (userId == 'admin@sathak' && password == 'admin') {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => EventScreen()),
                            );
                          } else {
                            // Handle incorrect credentials
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Invalid Credentials'),
                                  content: Text('Please enter valid user ID and password.'),
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
}
