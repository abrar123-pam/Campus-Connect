import 'package:collegeapp/Admin/department_page.dart';
import 'package:collegeapp/Admin/subject_page.dart';
import 'package:collegeapp/Admin/semester_page.dart';
import 'package:collegeapp/Admin/iat_page.dart';

import 'package:flutter/material.dart';
import 'package:collegeapp/utils/colors/colors.dart';


class CustomDialogHelper {
  static Widget buildElevatedButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(text,style: TextStyle (color:  Colors.white),),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        height: 500.0,
        decoration: BoxDecoration(
          color: Colors.blue, // Change the color of the rectangle box
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomDialogHelper.buildElevatedButton(
                'Create Department', Color(0xff0E4192), () {
              // Add your onPressed code here!
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) => DepartmentPage()));
            }),
            SizedBox(height: 20),
            CustomDialogHelper.buildElevatedButton(
                'Create Semester',Color(0xff0E4192), () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SemesterPage()));
            }),
            SizedBox(height: 20),
            CustomDialogHelper.buildElevatedButton('Create Subject', Color(0xff0E4192), () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SubjectPage()));
            }),
            SizedBox(height: 20),
            CustomDialogHelper.buildElevatedButton('Create Sessional Title', Color(0xff0E4192), () {
              // Add your onPressed code here!
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => IatPage()));
            }),
            SizedBox(height: 20),
            CustomDialogHelper.buildElevatedButton('Create Password', Color(0xff0E4192), () {
              // Add your onPressed code here!
            }),
          ],
        ),
      ),
    );
  }
}


