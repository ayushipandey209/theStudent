// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:thestudent/Screens/addstu.dart';
import 'package:thestudent/Screens/byid.dart';
import 'package:thestudent/Screens/studentdeatils.dart';
import 'package:thestudent/Screens/updateStudent.dart';

class crudop extends StatefulWidget {
  const crudop({Key? key}) : super(key: key);

  @override
  State<crudop> createState() => _crudopState();
}

class _crudopState extends State<crudop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Operations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const addStu()));
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
              ),
              child: const Text('Add Student'),
            ),
            const SizedBox(height: 16), 
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const studentdetails()));
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
              ),
              child: const Text('Retrieve Student'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const updateStudent()));
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
              ),
              child: const Text('Update'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
          
              onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const byid()));
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
              ),
              child: const Text('Delete'),
            ),
             const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const byid()));
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
              ),
              child: const Text('Retrieve by id'),
            ),
          ],
        ),
      ),
    );
  }
}
