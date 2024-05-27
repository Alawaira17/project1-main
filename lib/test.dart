import 'package:flutter/material.dart';
import 'package:project1/Constants/UserController.dart';
import 'package:project1/Model/model.dart';

class UserGridView extends StatefulWidget {
  const UserGridView({Key? key, required text}) : super(key: key);

  @override
  _UserGridViewState createState() => _UserGridViewState();
}

class _UserGridViewState extends State<UserGridView> {
  final UserController _controller = UserController();
  List<Employee> _users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
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
          "Get All Data from json inside gridview",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _users.isEmpty
          ? const Center(child: Text("لا يوجد بيانات"))
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10, // Horizontal space between items
          mainAxisSpacing: 10, // Vertical space between items
          childAspectRatio: 2, // Aspect ratio of the cards
        ),
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
          Employee myItem = _users[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ID: ${myItem.empId}", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Name: ${myItem.empName}"),
                  Text("Date: ${myItem.empDate}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}