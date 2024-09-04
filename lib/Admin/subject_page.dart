import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectPage extends StatefulWidget {
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  final _subjectController = TextEditingController();
  final _subjectCodeController = TextEditingController();

  List<Map<String, String>> _subjects = [];

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  Future<void> _loadSubjects() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _subjects = (prefs.getStringList('departments') ?? []).map((entry) {
        final parts = entry.split(':');
        return {'name': parts[0], 'code': parts[1]};
      }).toList();
    });
  }

  Future<void> _saveDepartments() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _subjects.map((entry) => '${entry['name']}:${entry['code']}').toList();
    await prefs.setStringList('departments', data);
  }

  void _addDepartment() {
    final departmentName = _subjectController.text;
    final subjectCode = _subjectCodeController.text;
    if (departmentName.isNotEmpty && subjectCode.isNotEmpty) {
      setState(() {
        _subjects.add({'name': departmentName, 'code': subjectCode});
        _saveDepartments();
        _subjectController.clear();
        _subjectCodeController.clear();
      });
    }
  }

  void _deleteDepartment(int index) {
    setState(() {
      _subjects.removeAt(index);
      _saveDepartments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New Subject',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff0E4192),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _subjectController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Subject Name',
                        hintText: 'Engineering mathematics 1',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _subjectCodeController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Subject Code',
                        hintText: 'eg : MA8572',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _addDepartment,
            child: Text('Add'),
          ),
          SizedBox(height: 20),
          const Text(
            'Recent Created Subjects',
            style: TextStyle(color: Colors.blue, fontSize: 21),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _subjects.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        '${_subjects[index]['name']} - ${_subjects[index]['code']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.white),
                        onPressed: () => _deleteDepartment(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
