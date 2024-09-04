import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyTaskPage extends StatefulWidget {
  @override
  _DailyTaskScreenState createState() => _DailyTaskScreenState();
}

class _DailyTaskScreenState extends State<DailyTaskPage> {
  final TextEditingController _taskController = TextEditingController();
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
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
      body: Column(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: 'Enter task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _showDatePicker();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index].task,
                    style: TextStyle(color: Colors.black)),
                  subtitle: Text(_tasks[index].date,
                      style: TextStyle(color: Colors.black)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteTask(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedDate != null) {
      _addTask(pickedDate);
    }
  }

  void _addTask(DateTime date) async {
    String formattedDate = '${date.day}/${date.month}/${date.year}';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? tasksList = prefs.getStringList('tasks');

    setState(() {
      _tasks.add(Task(task: _taskController.text.trim(), date: formattedDate));
      _taskController.clear();
    });

    // Save tasks to shared preferences
    if (tasksList != null) {
      tasksList.add(json.encode({'task': _taskController.text.trim(), 'date': formattedDate}));
      prefs.setStringList('tasks', tasksList);
    } else {
      prefs.setStringList('tasks', [json.encode({'task': _taskController.text.trim(), 'date': formattedDate})]);
    }
  }

  void _deleteTask(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? tasksList = prefs.getStringList('tasks');

    setState(() {
      _tasks.removeAt(index);
    });

    // Remove task from shared preferences
    if (tasksList != null) {
      tasksList.removeAt(index);
      prefs.setStringList('tasks', tasksList);
    }
  }

  void _loadTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? tasksList = prefs.getStringList('tasks');

    if (tasksList != null) {
      setState(() {
        _tasks = tasksList
            .map((taskJson) => Task.fromJson(json.decode(taskJson)))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }
}

class Task {
  final String task;
  final String date;

  Task({required this.task, required this.date});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      task: json['task'],
      date: json['date'],
    );
  }
}
