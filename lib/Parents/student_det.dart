import 'package:collegeapp/Parents/parents_home_page.dart';
import 'package:collegeapp/Parents/student_login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Regular Staff/staff_home_page.dart';
import '../auth_service.dart';

class StudentDetailsPage extends StatelessWidget {
  final Student student;

  StudentDetailsPage(this.student);

  TextEditingController _phoneContoller = TextEditingController();
  TextEditingController _otpContoller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();


  void handleSubmit(BuildContext context) {
    if (_formKey1.currentState!.validate()) {
      AuthService.loginWithOtp(otp: _otpContoller.text).then((value) {
        if (value == "Success") {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ParentsHomePage()));
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0E4192),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 180,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Name: ',
                    textAlign: TextAlign.center,

                  ),
                  Text(
                    '${student.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Year: ${student.year}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Department: ${student.department}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300, // Adjust width as needed
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _phoneContoller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Phone Number',
                            border: InputBorder.none,
                          ),
                          validator: (value){
                            if(value!.length!=10)
                              return "Invalid Phone Number";
                            else
                              return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AuthService.sentOtp(
                            phone: _phoneContoller.text,
                            errorStep: () => ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                              content: Text(
                                "Error in sending OTP",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            )),
                            nextStep: () {
                              // start lisenting for otp
                              // listenToIncomingSMS(context);
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("OTP Verification"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("Enter 6 digit OTP"),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Form(
                                          key: _formKey1,
                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.number,
                                            controller: _otpContoller,
                                            decoration: InputDecoration(
                                                labelText:
                                                "Enter OTP",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        32))),
                                            validator: (value) {
                                              if (value!.length != 6)
                                                return "Invalid OTP";
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              handleSubmit(context),
                                          child: Text("Submit"))
                                    ],
                                  ));
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff0E4192),
                    ),
                    child: Text('Get OTP',style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class CheckUserLoggedInOrNot extends StatefulWidget {
  const CheckUserLoggedInOrNot({super.key});

  @override
  State<CheckUserLoggedInOrNot> createState() => _CheckUserLoggedInOrNotState();
}

class _CheckUserLoggedInOrNotState extends State<CheckUserLoggedInOrNot> {
  @override
  void initState() {
    AuthService.isLoggedIn().then((value) {
      if (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ParentsHomePage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ParentsLoginPage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}



class Student {
  final String name;
  final String year;
  final String department;

  Student({required this.name, required this.year, required this.department});
}
