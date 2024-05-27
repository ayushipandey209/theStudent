// ignore_for_file: unnecessary_null_comparison, camel_case_types, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thestudent/Models/studentmodel.dart';
import 'package:thestudent/services/allservices.dart';

class studentdetails extends StatefulWidget {
  const studentdetails({Key? key}) : super(key: key);

  @override
  State<studentdetails> createState() => _studentdetailsState();
}

class _studentdetailsState extends State<studentdetails> {
  late List<Student> data=[]; 

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
   
      data = await StudentService().getAllStudents();
    
      setState(() {}); 
    } catch (e) {
    
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  elevation: 30,
                  child: ListTile(
                    tileColor: Colors.grey,
                    title: Text('ID: ${data[index].id}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${data[index].name}'),
                        Text('Address: ${data[index].address}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
