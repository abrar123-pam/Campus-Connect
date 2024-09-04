import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class NotesScreen extends StatelessWidget {
  final List<String> pdfNames = [
    'question_paper_cc',
    'Java_Notes',
    'Linked_List_Notes',
    'Flutter_Notes',
    'MA8151'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0E4192),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: pdfNames.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xff0E4192),
            elevation: 4,
            margin: EdgeInsets.symmetric(
                horizontal: 18, vertical: 10),
            child: ListTile(
              leading: Icon(Icons.picture_as_pdf,color: Colors.white,),
              title: Text(pdfNames[index],style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.download,color: Colors.white,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPdfViewer(pdfName: pdfNames[index])));
              },
            ),
          );
        },
      ),
    );
  }
}

class MyPdfViewer extends StatelessWidget {
  final String pdfName;

  MyPdfViewer({required this.pdfName});

  @override
  Widget build(BuildContext context) {
    String pdfPath = 'assets/pdf/$pdfName.pdf'; // Construct the path to the selected PDF file

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PDF View'),
      ),
      body: SfPdfViewer.asset(pdfPath), // Load the selected PDF file from assets
    );
  }
}

