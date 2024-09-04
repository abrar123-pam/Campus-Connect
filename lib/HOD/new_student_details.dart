import 'dart:io';
import 'package:collegeapp/Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class NewStudentprofile extends StatefulWidget {
  final String? selectedYear;
  final String? selectedDepartment;

  NewStudentprofile({
    required this.selectedYear,
    required this.selectedDepartment,
  });
  @override
  _NewStudentProfileState createState() => _NewStudentProfileState();
}

class _NewStudentProfileState extends State<NewStudentprofile> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? _selectedSemester;
  late List<String> _semesters;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController regNoController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  Service service = Service();

  @override
  void initState() {
    super.initState();
    _loadSemesters();
  }

  Future<void> _loadSemesters() async {
    final prefs = await SharedPreferences.getInstance();
    final semesterList = prefs.getStringList('semester') ?? [];
    setState(() {
      _semesters = semesterList;
      _selectedSemester = _semesters.isNotEmpty ? _semesters.first : null;
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Student',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0E4192),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                _image != null ? FileImage(File(_image!.path)) : null,
                child: _image == null
                    ? Icon(Icons.add_a_photo, size: 50)
                    : null,
              ),
            ),
            SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0E4192)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0E4192)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0E4192)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: regNoController,
                decoration: InputDecoration(
                  labelText: 'Registration Number',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0E4192)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedSemester,
                hint: Text('Select Semester'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSemester = newValue;
                  });
                },
                items: _semesters.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0E4192)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: sectionController,
                decoration: InputDecoration(
                  labelText: 'Section',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                String email = emailController.text;
                String registrationNumber = regNoController.text;
                String semester = _selectedSemester ?? ''; // Ensure to handle null if no semester is selected
                String section = sectionController.text;
                String year = widget.selectedYear ?? ''; // Use selectedYear from widget
                String department = widget.selectedDepartment ?? '';

                service.saveUser(name, email, registrationNumber, semester, section,year,department);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
