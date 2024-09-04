import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DepartmentPage extends StatefulWidget {
  @override
  _DepartmentPageState  createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage>  {
  final _controller = TextEditingController();
  List<String> _departments = [];

  @override
  void initState() {
    super.initState();
    _loadDepartments();
  }
  Future<void> _loadDepartments() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _departments = prefs.getStringList('departments') ?? [];
    });
  }

  Future<void> _saveDepartments() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('departments', _departments);
  }

  void _addDepartment() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _departments.add(_controller.text);
        _saveDepartments();
        _controller.clear();
      });
    }
  }

  void _deleteDepartment(int index) {
    setState(() {
      _departments.removeAt(index);
      _saveDepartments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Department',
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
                    labelText: 'Department Name',
                    hintText: 'Enter department name',
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
          const Text('Recent Created Department',
          style: TextStyle (color: Colors.blue,fontSize: 21),),
          Expanded(
            child: ListView.builder(
              itemCount: _departments.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue, // Set the background color of the container
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(_departments[index],style: TextStyle(color: Colors.white),),

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