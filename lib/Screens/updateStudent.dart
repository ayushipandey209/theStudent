import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class updateStudent extends StatefulWidget {
  const updateStudent({super.key});

  @override
  State<updateStudent> createState() => _updateStudentState();
}

class _updateStudentState extends State<updateStudent> {
  TextEditingController _rnoController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Future<void> _updateStudent() async {
    int id = int.parse(_rnoController.text); // Assuming rno is the ID
    String name = _nameController.text;
    String address = _addressController.text;

    Map<String, dynamic> updatedStudentData = {
      'name': name,
      'address': address,
    };

    try {
      await updateStudentById(id, updatedStudentData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student updated successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update student: $error')),
      );
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _rnoController,
              decoration: InputDecoration(labelText: 'Roll Number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateStudent,
              child: Text('Update Student'),
            ),
          ],
        ),
      ),
    );
  }
}
