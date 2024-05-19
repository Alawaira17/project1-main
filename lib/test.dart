// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, unused_local_variable, duplicate_import, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/Model/model.dart';
import 'package:project1/Employee1From.dart';
import 'package:project1/Model/model.dart';
import 'package:project1/delete.dart';
import 'package:project1/update.dart';

import 'Constants/UserController.dart';
import 'Model/model.dart';


class UserListView1 extends StatefulWidget {
  const UserListView1({Key? key, required text}) : super(key: key);

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView1> {
  final UserController _controller = UserController();
  List<Employee> _users = []; // Store fetched users here

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Fetch users from the controller
      _users = await _controller.fetchUsers();
      setState(() {
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load users: $e')),
      );
    }
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Get All Data ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormEmplyee(text: null)),
            );
          },
        ),
      ),



      body: _users.isEmpty
          ? const Center(child: Text("لا يوجد بيانات"))  // Centered text for no data
          : Center(
        child:ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
         Employee myItem = _users[index];

         return Center(
             child: ListTile(
             leading: Icon(Icons.person),
          title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Id: " + myItem.empId.toString()),
                Text("Name: " + myItem.empName.toString()),
                Text("Date: " + myItem.empDate.toString()),
              ],
            ),

            onTap: () {
              // Action when tapping the item
              print("Tapped on ${myItem.empId}");
              print("Tapped on ${myItem.empName}");
              print("Tapped on ${myItem.empDate}");
            },

             ),
          );

        },
      ),

      ),

  bottomNavigationBar: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [

      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>UpdateEmployeeView()),
                    (Route<dynamic> route) => false);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')
              ),
            );
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,),
        child: const Text(
          'Updated User',
          style: TextStyle(fontSize: 24, color: Colors.white,),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> DeleteEmployeeView()),
                    (Route<dynamic> route) => false);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')
              ),
            );
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,),
        child: const Text(
          'Delete User',
          style: TextStyle(fontSize: 24, color: Colors.white,),
        ),
      ),

      ElevatedButton(
        onPressed: () {
          // Remove the first item from the list
          setState(() {
            if (_users.isNotEmpty) {
              _users.removeAt(0);
            }
          });
        },
        child: Text('Delete First Item'),
      ),
      ElevatedButton(
        onPressed: () {
          // Remove the last item from the list
          setState(() {
            if (_users.isNotEmpty) {
              _users.removeLast();
            }
          });
        },
        child: Text('Delete Last Item'),
      ),

    ],
  ),






    );
  }
}

