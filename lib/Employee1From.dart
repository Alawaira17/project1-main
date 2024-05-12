// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project1/GetById.dart';
import 'package:project1/Service/api_serives.dart';
import 'package:project1/UserListView.dart';
import 'package:project1/add.dart';
import 'package:project1/delete.dart';
import 'package:project1/update.dart';



class FormEmplyee extends StatefulWidget {
  const FormEmplyee({super.key, required text});

  @override
  State<FormEmplyee> createState() => _FormEmplyeeState();
}

class _FormEmplyeeState extends State<FormEmplyee> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text(" Employee Form", style: TextStyle(color: Colors.white)),
    elevation: 10.0,
    backgroundColor:Colors.blue,
    //elevation: 10.0,
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(15),
    ),
    ),

          leading:  IconButton(
            icon:Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => FormEmplyee(text: null, )),);},
          ),


        ),



      body: Form(
    key : _formKey,
    child: SingleChildScrollView(
    //  padding: const EdgeInsets.all(10),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 100,),

        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const UserListView(text: null,)),
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
            'Get All ',
            style: TextStyle(fontSize: 24, color: Colors.white,),
          ),
        ),
        SizedBox(height: 20,),


        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> AddEmployeeView()),
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
            'Add User',
            style: TextStyle(fontSize: 24, color: Colors.white,),
          ),
        ),
SizedBox(height: 20,),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> GetEmployeeByIdView()),
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
            'Get By Id ',
            style: TextStyle(fontSize: 24, color: Colors.white,),
          ),
        ),


        SizedBox(height: 20,),

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

        SizedBox(height: 20,),

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


      ],
    ),
          ),
    ),
      ),
    );
  }
}

