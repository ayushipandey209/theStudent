// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thestudent/Models/studentmodel.dart';
import 'package:thestudent/services/allservices.dart';

class addStu extends StatefulWidget {
  const addStu({Key? key}) : super(key: key);

  @override
  State<addStu> createState() => _addStuState();
}

class _addStuState extends State<addStu> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
   late List<Student> data=[]; 
  // Future<void> fetchData() async {
  //   try {
   
  //     data = await StudentService().addStudent(id, name, address);
    
  //     setState(() {}); 
  //   } catch (e) {
    
  //     print('Error fetching data: $e');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                hintText: 'Enter ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Enter Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
                String id = idController.text;
                String name = nameController.text;
                String address = addressController.text;
                StudentService().addStudent(id, name, address);
                idController.clear();
                 nameController.clear();
                  addressController.clear();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
