import 'package:collegeapp/Parents/about_page.dart';
import 'package:collegeapp/Parents/iat_marks_student.dart';
import 'package:collegeapp/Parents/show_attendance.dart';
import 'package:collegeapp/Parents/student_login_page.dart';
import 'package:collegeapp/Parents/student_profile.dart';
import 'package:collegeapp/Parents/staff_details.dart';
import 'package:collegeapp/Regular Staff/attendance_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collegeapp/Parents/notes_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:collegeapp/Parents/subject_detail_page.dart';
import 'package:alan_voice/alan_voice.dart';

import '../auth_service.dart';

class ParentsHomePage extends StatefulWidget {
  final List<Map<String, String>> imagePaths = [
    {
      'imagePath': 'images/Events/circular.jpeg',
      'websiteUrl': 'https://example.com/circular',
    },
    {
      'imagePath': 'images/Events/iitm.jpeg',
      'websiteUrl': 'https://shaastramag.iitm.ac.in/',
    },
    {
      'imagePath': 'images/Events/hiring.jpeg',
      'websiteUrl': 'https://freshercareers.in/',
    },
    {
      'imagePath': 'images/Events/sathak.jpeg',
      'websiteUrl': 'https://www.msajce-edu.in/',
    },
  ];

  @override
  _parentsHomeScreenState createState() => _parentsHomeScreenState();
}

class _parentsHomeScreenState extends State<ParentsHomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initAlan();
  }

  @override
  void dispose() {
    super.dispose();
    disposeAlan();
  }


  initAlan(){
    AlanVoice.addButton(
        "b3563d80106ce65ee8b9c40a3c349f502e956eca572e1d8b807a3e2338fdd0dc/stage",

    buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    AlanVoice.onCommand.add((command) => handleCommand(command.data));

  }
  handleCommand(Map<String, dynamic> command) {
    String commandString = command['command'];

    if (commandString == 'attendance') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AttendancePage()));
    } else if (commandString == 'notes') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NotesScreen()));
    } else if (commandString == 'marks') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => IatMarks()));
    } else if (commandString == 'detail') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailPage()));
    }
    else if (commandString == 'subject') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectDetails()));
    }
    else if (commandString == 'staff') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => StaffDetailPage()));
    }
  }

  disposeAlan() {
    AlanVoice.removeButton();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
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
      ),
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff0E4192),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                    radius: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Abrar Musharraf P',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ParentsHomePage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileDetailPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Notes'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NotesScreen()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
            ),
            Divider(),
            Container(
              child: ListTile(
                title: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    Text('Logout'),
                  ],
                ),
                onTap: () {
                  AuthService.logout();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ParentsLoginPage()));
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: widget.imagePaths.length,
              itemBuilder: (context, index, realIndex) {
                return EventCard(
                  imagePath: widget.imagePaths[index]['imagePath']!,
                  websiteUrl: widget.imagePaths[index]['websiteUrl']!,
                );
              },
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imagePaths.length,
                      (index) => Container(
                    width: 20,
                    height: 2,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  imagePath: 'images/performace.png',
                  label: 'Attendance',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowAttendancePage(
                          totalDays: 75,
                          presentDays: 65,
                          absentDays: 5,
                        ),
                      ),
                    );

                  },
                ),
                CustomButton(
                  imagePath: 'images/notes1.png',
                  label: 'Notes',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)
                        => NotesScreen()));
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  imagePath: 'images/exam.png',
                  label: 'IAT Marks',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (
                                context)=> IatMarks()));
                  },
                ),
                CustomButton(
                  imagePath: 'images/subject.png',
                  label: 'Subject Detail',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)
                        => SubjectDetails()));
                  },
                ),


              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  imagePath: 'images/student.png',
                  label: 'Student Detail',
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context) => ProfileDetailPage()));
                  },
                ),
                CustomButton(
                  imagePath: 'images/teacher.png',
                  label: 'Staff Details',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=> StaffDetailPage()));
                  },
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imagePath;
  final String websiteUrl;

  EventCard({required this.imagePath, required this.websiteUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(websiteUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff0E4192),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 60, height: 60),
            SizedBox(height: 10),
            Text(label,style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}



