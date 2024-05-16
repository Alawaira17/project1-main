// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:project1/GetById.dart';
import 'package:project1/add.dart';
import 'package:project1/delete.dart';
import 'package:project1/Employee1From.dart';
import 'package:project1/test.dart';
import 'package:project1/update.dart';
import 'UserListView.dart';

// Import your home page class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const UserListView1(text: null,)// Set your home page here
    );
  }
}