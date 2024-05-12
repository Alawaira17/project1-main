import 'package:flutter/material.dart';
import 'package:project1/Model/model.dart';
import 'package:project1/Service/api_serives.dart';




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Employee>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getAllEmployees())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),body: _userModel == null || _userModel!.isEmpty
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : ListView.builder(
        itemCount: _userModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_userModel![index].empId.toString()),
                   // Text(_userModel![index].empName),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_userModel![index].empName.toString()),
                    Text(_userModel![index].empDate.toString()),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}