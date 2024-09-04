import 'package:collegeapp/Regular%20Staff/daily_task.dart';
import 'package:collegeapp/Regular Staff/student_detail.dart';
import 'package:collegeapp/Regular%20Staff/overall_page.dart';
import 'package:collegeapp/Regular%20Staff/upload_pdf.dart';
import 'package:collegeapp/Regular Staff/attendance_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collegeapp/HOD/student_data_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:collegeapp/Regular Staff/iat_marks_page.dart';
class StaffHomePage extends StatefulWidget {
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
  _StaffHomeScreenState createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomePage> {
  int _currentIndex = 0;

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
                  imagePath: 'images/attendance.png',
                  label: 'Take Attendance',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AttendancePage()));
                  },
                ),
                CustomButton(
                  imagePath: 'images/performace.png',
                  label: 'Overall Performance',
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OverAllPage()));
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  imagePath: 'images/task.png',
                  label: 'Daily Task',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (
                                context)=> DailyTaskPage()));
                  },
                ),
                CustomButton(
                  imagePath: 'images/notes.png',
                  label: 'Add Study Materials',
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => PDFListScreen()));
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
                  label: 'Student Details',
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context) => StudentDetailPage()));
                  },
                ),
                CustomButton(
                  imagePath: 'images/notes.png',
                  label: 'Upload IAT MArks',
                  onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=> IatMarksPage()));
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



