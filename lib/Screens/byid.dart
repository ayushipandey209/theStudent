// ignore_for_file: prefer_const_constructors, avoid_print


import 'package:flutter/material.dart';
import 'package:thestudent/Models/studentmodel.dart';
import 'package:thestudent/services/allservices.dart';

class byid extends StatefulWidget {
  const byid({Key? key}) : super(key: key);

  @override
  State<byid> createState() => _byidState();
}

class _byidState extends State<byid> {
  TextEditingController rollNoController = TextEditingController();
   late List<Student> students=[]; 
  StudentService studentService = StudentService();
void fetchStudentData(int id) {
  studentService.getStudentById(id).then((result) {
    setState(() {
      students = [result];
    });
  }).catchError((error) {
    print('Error fetching data: $error');
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data by Roll Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: rollNoController,
              decoration: InputDecoration(
                hintText: 'Enter Roll Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {
    int id = int.tryParse(rollNoController.text) ?? 0;
    fetchStudentData(id);
  },
  child: Text('Fetch'),
),

            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('ID: ${students[index].id}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${students[index].name}'),
                        Text('Address: ${students[index].address}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
