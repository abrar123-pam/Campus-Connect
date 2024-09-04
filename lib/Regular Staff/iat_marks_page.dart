import 'package:flutter/material.dart';

class IatMarksPage extends StatefulWidget {
  @override
  _IatMarksPageState createState() => _IatMarksPageState();
}

class _IatMarksPageState extends State<IatMarksPage> {
  String? _selectedStudent;
  int? _maxMarks;
  List<String?> _selectedSubjects = List.filled(5, null);
  List<TextEditingController> _marksControllers = List.generate(5, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    List<String> availableSubjects = [
      'CS2351',
      'CS2301 ',
      'MA1011 ',
      'EC1302 ',
      'IT2401 '
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload IAT Marks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0E4192),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 70,),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedStudent,
                  items: [
                    '311820104001',
                    '311820104002',
                    '311820104003',
                    '311820104004',
                    '311820104005',
                    '311820104006',
                    '311820104007',
                    '311820104008',
                    '311820104009',
                    '311820104010',
                    '311820104011',
                    '311820104012',
                    '311820104013',
                    '311820104014',
                    '311820104015',
                    '311820104016',
                    '311820104017',
                    '311820104018',
                    '311820104019',
                    '311820104020',
                    '311820104021',
                    '311820104022',
                    '311820104023',
                    '311820104024',
                    '311820104025',
                  ].map((String student) {
                    return DropdownMenuItem<String>(
                      value: student,
                      child: Text(student),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedStudent = value;
                    });
                  },
                  hint: Text('Select Student'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Max Marks',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String value) {
                    _maxMarks = int.tryParse(value);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          for (int i = 0; i < 5; i++)
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedSubjects[i],
                        items: availableSubjects
                            .where((subject) => !_selectedSubjects.sublist(0, i).contains(subject))
                            .map((String subject) {
                          return DropdownMenuItem<String>(
                            value: subject,
                            child: Text(subject),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedSubjects[i] = value;
                          });
                        },
                        hint: Text('Select Subject'),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: _marksControllers[i],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter Marks',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value) {
                          // Handle mark input for each subject
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () {
              _submitMarks(context);
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _submitMarks(BuildContext context) {
    if (_selectedStudent != null && _maxMarks != null) {
      // Show a dialog with a success message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Marks added for student $_selectedStudent'),
            actions: [
              TextButton(
                onPressed: () {
                  // Clear fields and dismiss the dialog
                  Navigator.of(context).pop();
                  _maxMarks = null;
                  _selectedSubjects = List.filled(5, null);
                  _marksControllers.forEach((controller) => controller.clear());
                  setState(() {
                    _selectedStudent = null;
                  });
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Show an error message if required fields are not filled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select student and enter max marks.'),
        ),
      );
    }
  }
}
