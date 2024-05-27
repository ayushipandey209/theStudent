import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thestudent/Models/studentmodel.dart';

class StudentService {
  Future<List<Student>> getAllStudents() async {
  final response = await http.get(Uri.parse('http://192.168.0.247:8081/getAllStudents'));

    if (response.statusCode == 200) {
      
      Iterable list = json.decode(response.body);
      
      List<Student> students = list.map((model) => Student.fromJson(model)).toList();
      return students;
    } else {
    
      throw Exception('Failed to load students');
    }
  }



}
