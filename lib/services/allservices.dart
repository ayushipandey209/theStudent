// ignore_for_file: avoid_print

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

  Future<void> addStudent(String id, String name, String address) async {
    final url = Uri.parse('http://192.168.0.247:8081/addStudent');

    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'rno': id,
          'name': name,
          'address': address,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
       print("sucesss");
      } else {
        // Failed to add student
        throw Exception('Failed to add student');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      rethrow; // Rethrow the exception to propagate it to the caller
    }
  }
 

Future<Student> fetchStudentById(int id) async {
  final response = await http.get(Uri.parse('http://192.168.0.247:8081/getStudent/$id'));
  
  if (response.statusCode == 200) {
    return Student.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load student data');
  }
}

//delete id
Future<void> deleteStudentById(int id) async {
  final response = await http.delete(Uri.parse('http://192.168.0.247:8081/deleteStudent/$id'));
  
  if (response.statusCode == 200) {
    print('Student with ID $id deleted successfully');
  } else {
    throw Exception('Failed to delete student');
  }
}

//update by id
Future<void> updateStudentById(int id, Map<String, dynamic> updatedStudentData) async {
  final String apiUrl = 'http://192.168.0.247:8081/updateStudent/$id';
  
  final response = await http.put(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(updatedStudentData),
  );
  
  if (response.statusCode == 200) {
    print('Student with ID $id updated successfully');
  } else {
    throw Exception('Failed to update student');
  }
}




}
