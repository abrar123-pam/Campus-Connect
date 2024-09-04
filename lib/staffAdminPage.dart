import 'package:collegeapp/Admin/admin_login_page.dart';
import 'package:collegeapp/hod/hod_login_page.dart';
import 'package:collegeapp/Regular Staff/staff_login_page.dart';
import 'package:flutter/material.dart';

Widget _buildIconButton(String imagePath, String label, VoidCallback onPressed) {
  return Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      color: Color(0xff11479A),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Image.asset(imagePath),
          iconSize: 80,
        ),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}

class AdminPage extends StatefulWidget{
  @override
  State<AdminPage> createState() => _MyAdminPageState();
}

class _MyAdminPageState extends State<AdminPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildIconButton('images/admin.png', 'Admin', () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  AdminLoginPage(),
                    ));
              }),
              _buildIconButton('images/hod.png', 'Hod', () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context) => HodLoginPage(),
                ));
              }),
              _buildIconButton('images/regular_staff.png', 'Regular Staff', () {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => StaffLoginPage(),));
              }),

            ],
          ),
        ),
      ),

    );
  }

}