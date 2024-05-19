
// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/Model/model.dart';
import 'package:project1/Employee1From.dart';
import 'package:project1/delete.dart';
import 'package:project1/update.dart';
import 'Constants/UserController.dart';



class UserListView2 extends StatefulWidget {
  const UserListView2({Key? key, required text}) : super(key: key);

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView2> {
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
      setState(() {});
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
          ? const Center(child: Text("لا يوجد بيانات"))
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
          Employee myItem = _users[index];
          return ListTile(
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

            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Implement or navigate to update logic
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            UpdateEmployeeView()
                    ));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
          Navigator.push(context, MaterialPageRoute(
          builder: (context) =>
          DeleteEmployeeView()
          ));


                    // Implement deletion logic
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Delete'),
                            content: Text(
                                'Are you sure you want to delete this user?'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _users.removeAt(index);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Yes')
                              ),
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('No')
                              ),
                            ],
                          );
                        }

                    );

                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}