import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  // Method to save user
  Future<http.Response> saveUser(
      String name,
      String email,
      String registrationNumber,
      String semester,
      String section,
      String year,
      String department ) async {
    var uri = Uri.parse("http://192.168.158.157:8080/register");
  //  var uri = Uri.parse("http://localhost:8080/register");

    Map<String, String> headers = {"Content-Type": "application/json"};
    // Body
    Map data = {
      'name': '$name',
      'email': '$email',
      'registrationNumber': '$registrationNumber',
      'semester': '$semester',
      'section': '$section',
      'year': '$year',
      'department': '$department',
    };
    // Convert data to JSON
    var body = json.encode(data);
    // Send POST request
    var response = await http.post(uri, headers: headers, body: body);

    // Print response body
    print("${response.body}");

    return response;
  }

  Future<http.Response> getUser() async{
      var uri = Uri.parse("http://192.168.158.157:8080/students");
    // Send GET request
    var response = await http.get(uri);

    print("${response.body}");

    return response;
  }

  Future<http.Response> saveAttendance(List<Map<String, dynamic>> attendanceData) async {
    var uri = Uri.parse("http://192.168.158.157:8080/attendance/mark");
    Map<String, String> headers = {"Content-Type": "application/json"};
    // Convert data to JSON
    var body = json.encode(attendanceData);
    // Send POST request
    var response = await http.post(uri, headers: headers, body: body);

    // Print response body
    print("${response.body}");

    return response;
  }


}
