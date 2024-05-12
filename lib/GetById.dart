
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/Model/model.dart';
import 'package:project1/Service/api_serives.dart';
import 'package:project1/Employee1From.dart';

class GetEmployeeByIdView extends StatefulWidget {
  @override
  _GetEmployeeByIdViewState createState() => _GetEmployeeByIdViewState();
}

class _GetEmployeeByIdViewState extends State<GetEmployeeByIdView> {
  TextEditingController _idController = TextEditingController();
  Employee? _employee; // Declare _employee as late-initialized

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Get Employee by ID',style: TextStyle(color: Colors.white)),
        leading:  IconButton(
          icon:Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormEmplyee(text: null, )),);},
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _idController,
            decoration: InputDecoration(labelText: 'Enter Employee ID'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _getEmployeeById,
            child: Text('Get Employee'),
          ),
          SizedBox(height: 20),
          if (_employee != null) ...[
            Text('Employee ID: ${_employee!.empId}'),
            Text('Employee Name: ${_employee!.empName}'),
            // Add more Text widgets for additional fields
          ],
        ],
      ),
    );
  }

  Future<void> _getEmployeeById() async {
    int empId = int.tryParse(_idController.text) ?? 0;
    try {
      // Call your API service method to get employee by ID
      _employee = await ApiService().getEmployeeById(empId);
      setState(() {}); // Call setState to trigger UI update
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to get employee: $e')),
      );
    }
  }
}