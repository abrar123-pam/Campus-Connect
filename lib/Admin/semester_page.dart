import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SemesterPage extends StatefulWidget {
  @override
  _SemesterPageState  createState() => _SemesterPageState();

}

class _SemesterPageState extends State<SemesterPage>  {
  final _controller = TextEditingController();
  List<String> _semester = [];

  @override
  void initState() {
    super.initState();
    _loadSemster();
  }

  Future<void> _loadSemster() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _semester = prefs.getStringList('semester') ?? [];
    });
  }

  Future<void> _saveSemester() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('semester', _semester);
  }

  void _addDepartment() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _semester.add(_controller.text);
        _saveSemester();
        _controller.clear();
      });
    }
  }

  void _deleteDepartment(int index) {
    setState(() {
      _semester.removeAt(index);
      _saveSemester();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Semester',
          style: TextStyle( color:  Colors.white),),
        backgroundColor: Color(0xff0E4192) ,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),

      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Semester Name',
                    hintText: 'eg : first semester',
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addDepartment,
            child: Text('Add',),
          ),
          SizedBox(height: 20,),
          const Text('Recent Created Semster',
            style: TextStyle (color: Colors.blue,fontSize: 21),),
          Expanded(
            child: ListView.builder(
              itemCount: _semester.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue, // Set the background color of the container
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(_semester[index],style: TextStyle(color: Colors.white),),

                      trailing: IconButton(
                        icon: Icon(Icons.delete,color: Colors.white,),
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