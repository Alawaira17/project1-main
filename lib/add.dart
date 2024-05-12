// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project1/Model/model.dart';
import 'package:project1/Service/api_serives.dart';
import 'package:project1/Employee1From.dart';

// Import your Employee model class

class AddEmployeeView extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Add Employee', style: TextStyle(color: Colors.white)),

        leading:  IconButton(
          icon:Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormEmplyee(text: null, )),);},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'Enter Employee ID'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Enter Employee Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Enter Employee Date ( DD-MM-YYYY )'),
            ),
            const SizedBox(height: 20),
    ElevatedButton(
    onPressed: () async {
    int id = int.tryParse(_idController.text) ?? 0;
    String name = _nameController.text.trim();
    String dateStr = _dateController.text.trim();

    if (id != 0 && name.isNotEmpty && dateStr.isNotEmpty) {
      try {
        // Define the correct DateFormat pattern for parsing "DD-MMM-YYYY" format
        DateFormat inputFormat = DateFormat('dd-MMM-yyyy', 'en_US'); // Specify locale to ensure correct month parsing

        // Parse the date string into a DateTime object
        DateTime date = inputFormat.parse(dateStr);
        DateFormat outputFormat = DateFormat('dd-MMM-yyyy', 'en_US');
        String formattedDate = outputFormat.format(date);

        // Create an Employee object with the parsed date
        Employee employee = Employee(empId: id, empName: name, empDate: formattedDate);

        // Call ApiService to create the employee
        await ApiService().createEmployee(employee);

        // Show success message using ScaffoldMessenger
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Employee added successfully')),
        );
      } catch (e) {
        // Handle errors and show error message
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add employee')),
        );
      }
    }  else {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Please enter valid details')),
    );
    }
    },
    child: Text('Add Employee'),
    )

          ],
        ),
      ),
    );
  }
}