import 'package:flutter/material.dart';

class IatMarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0E4192),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          IatMarksCard(
            title: 'IAT Marks 1',
            subjectMarks: {
          'Abrar Musharraf':'311820104004',
              'ENGINEERING CHEMISTRY': '85/100',
              'ENGINEERING MATHEMATICS 1': '90/100',
              'C PROGRAMMING': '75/100',
              'ENGINEERING PHYSICS': '60/100',
              'HUMAN COMPUTER INTERACTION': '55/100',
            },
          ),
          IatMarksCard(
            title: 'IAT Marks 2',
            subjectMarks: {
              'Abrar Musharraf':'311820104004',
              'ENGINEERING CHEMISTRY': '80/100',
              'ENGINEERING MATHEMATICS 1': '50/100',
              'C PROGRAMMING': '95/100',
              'ENGINEERING PHYSICS': '77/100',
              'HUMAN COMPUTER INTERACTION': '89/100',
            },
          ),
          IatMarksCard(
            title: 'IAT Marks 3',
            subjectMarks: {
              'Abrar Musharraf':'311820104004',
              'ENGINEERING CHEMISTRY': '82/100',
              'ENGINEERING MATHEMATICS 1': '68/100',
              'C PROGRAMMING': '91/100',
              'ENGINEERING PHYSICS': '65/100',
              'HUMAN COMPUTER INTERACTION': '93/100',
            },
          ),
        ],
      ),
    );
  }
}

class IatMarksCard extends StatelessWidget {
  final String title;
  final Map<String, String> subjectMarks;

  IatMarksCard({
    required this.title,
    required this.subjectMarks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15.0),
      shape:  RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '${subjectMarks.keys.first}: ${subjectMarks.values.first}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: subjectMarks.entries.skip(1).map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key),
                      Text(entry.value),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

