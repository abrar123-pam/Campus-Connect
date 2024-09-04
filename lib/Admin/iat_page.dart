import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IatPage extends StatefulWidget {
  @override
  _IatPageState  createState() => _IatPageState();
}

class _IatPageState extends State<IatPage>  {
  final _controller = TextEditingController();
  List<String> _iat = [];

  @override
  void initState() {
    super.initState();
    _loadIat();
  }
  Future<void> _loadIat() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _iat = prefs.getStringList('iat') ?? [];
    });
  }

  Future<void> _saveIat() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('iat', _iat);
  }

  void _addIat() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _iat.add(_controller.text);
        _saveIat();
        _controller.clear();
      });
    }
  }

  void _deleteIat(int index) {
    setState(() {
      _iat.removeAt(index);
      _saveIat();
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
                    labelText: 'IAT Name',
                    hintText: 'eg : first IAT results',
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addIat,
            child: Text('Add',),
          ),
          SizedBox(height: 20,),
          const Text('Recent Created IAT',
            style: TextStyle (color: Colors.blue,fontSize: 21),),
          Expanded(
            child: ListView.builder(
              itemCount: _iat.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue, // Set the background color of the container
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(_iat[index],style: TextStyle(color: Colors.white),),

                      trailing: IconButton(
                        icon: Icon(Icons.delete,color: Colors.white,),
                        onPressed: () => _deleteIat(index),
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