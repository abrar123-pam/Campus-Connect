import 'package:collegeapp/Admin/admin_home_page.dart';
import 'package:collegeapp/custom_page.dart';
import 'package:collegeapp/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

// C:\Users\Abrar Musharraf P\Downloads
class EventScreen extends StatefulWidget {
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
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MSAJCE',
        style: TextStyle(color: Colors.white),),
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
            SizedBox(height: 20,),
            CarouselSlider.builder(
              itemCount: widget.imagePaths.length,
              itemBuilder: (context, index, realIndex) {
                return
                  EventCard(
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
            SizedBox(height: 10,),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         showDialog(context: context,
           builder: (BuildContext context) => CustomDialog(),
         );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


class EventCard extends StatelessWidget {
  final String imagePath;
  final String websiteUrl;

  EventCard({required this.imagePath,required this.websiteUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        launch(websiteUrl);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(imagePath,fit: BoxFit.cover,)
      ),
    );
  }
}
