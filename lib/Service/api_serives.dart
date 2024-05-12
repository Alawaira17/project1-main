// ignore_for_file: unused_import, unused_local_variable, body_might_complete_normally_nullable, unnecessary_null_comparison, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:project1/Constants/UserController.dart';
import 'package:project1/Model/model.dart';



class ApiService {
  Future<List<Employee>> getAllEmployees() async {
    var url = Uri.parse(
        'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tbt//emp_tbt/');
    try {
      var response = await http.get(url);
      if (response.statusCode != null && response.statusCode == 200) {
        // Convert the response body bytes to a string
        String responseBody = utf8.decode(response.bodyBytes);
        print(responseBody);
        var jsonData = jsonDecode(responseBody);
        // print(response.body);
        List<Employee> users = [];
        for (var item in jsonData['items']) {
          // Convert each item into a UserModel and add to the list
          users.add(Employee.fromJson(item));
        }
        return users;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> createEmployee(Employee employee) async {
    var url = Uri.parse('https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/');

    try {
      if (employee != null) {
        var employeeJson = employee.toJson();
        print('Employee JSON: $employeeJson');

        var requestBody = jsonEncode(employeeJson);
        print('Request Body: $requestBody');

        var response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
            // Add any required headers for session handling/authentication
          },
          body: requestBody,
          encoding: Encoding.getByName('utf-8'),
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          print('Employee inserted successfully');
        } else {
          throw Exception('Failed to insert employee. Status code: ${response.statusCode}');
        }
      } else {
        throw Exception('Employee data is null');
      }
    } catch (e) {
      throw Exception('Failed to insert employee: $e');
    }
  }


  Future<Employee> getEmployeeById(int empId) async {
    var url = Uri.parse('https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/$empId');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // Convert the response body bytes to a string
        String responseBody = utf8.decode(response.bodyBytes);
        // Parse the JSON directly into an Employee object
        Employee employee = Employee.fromJson(jsonDecode(responseBody));
        print(employee);
        return employee;
      } else {
        throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }


  Future<void> updateEmployee(int empId, Employee employee) async {
    var url = Uri.parse('https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/$empId');

    try {
      if (employee == null) {
        throw Exception('Employee data is null');
      }

      var employeeJson = employee.toJson();
      var requestBody = jsonEncode(employeeJson);

      var response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          // Add any required headers for session handling/authentication
        },
        body: requestBody,
        encoding: Encoding.getByName('utf-8'),
      );

      if (response.statusCode == 200) {
        print('Employee updated successfully');
      } else {
        var errorMessage = response.body.isNotEmpty ? response.body : 'No error message provided by server';
        throw Exception('Failed to update employee. Status code: ${response.statusCode}, Error: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to update employee: $e');
    }
  }





  Future<void> deleteEmployee(int empId) async {
    var url = Uri.parse('https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/$empId');

    try {
      var response = await http.delete(
        url,
      );
      if (response.statusCode == 200) {
        print('Employee deleted successfully');
      } else {
        var errorMessage = response.body.isNotEmpty ? response.body : 'No error message provided by server';
        throw Exception('Failed to delete employee. Status code: ${response.statusCode}, Error: $errorMessage');
      }
    } catch (e) {
      throw Exception('Failed to delete employee: $e');
    }
  }



}

/*class ApiService{
  Future<List<Employee>> getAllEmployees() async {
    final response = await http.get(Uri.parse(
        'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tbt//emp_tbt/'));
    if (response.statusCode == 200) {
      Iterable jsonList = jsonDecode(response.body);
      return jsonList.map((employee) => Employee.fromJson(employee)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }
  }
*/












  /*Future<Employee> getEmployeeById(int id) async {
    final response = await http.get(Uri.parse(
        'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/'));
    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load employee');
    }
  } */


  /*Future<void> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse('https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/'),
      body: jsonEncode(employee),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create employee');
    }
  }*/


 /* Future<void> updateEmployee(Employee employee) async {

/*P_EMP_ID this parameter is the same parameter which we are writing when we call the api in postman*/
    final response = await http.put(
      Uri.parse('https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/'),
      //?P_EMP_ID=${employee.empID}');
      body: jsonEncode(employee),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }*/

  /*Future<void> deleteEmployee(int id) async {

/*P_EMP_ID this parameter is the same parameter which we are writing when we call the api in postman*/
    final response = await http.delete(Uri.parse(
        'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/')); //?P_EMP_ID=$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }*/



/*

1- Service Class: This class will handle all API calls.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_app_name/models/employee.dart';

class ApiService {
  /*This URL for verbs GetByID, Post, Put, and Delete*/
  static const String baseUrlForEmp_tb = 'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tb//emp_tb/';

 /*This URL for verbs Get all employees*/
  static const String baseUrlForEmp_tbt = 'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tbt//emp_tbt/';

/*This method to call api which get all employees*/

  Future<List<Employee>> getAllEmployees() async {
    final response = await http.get(Uri.parse('$baseUrlForEmp_tbt'));
    if (response.statusCode == 200) {
      Iterable jsonList = jsonDecode(response.body);
      return jsonList.map((employee) => Employee.fromJson(employee)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

/*This method to call api which get employee by ID*/

  Future<Employee> getEmployeeById(int id) async {
    final response = await http.get(Uri.parse('$baseUrlForEmp_tb?id=$id'));
    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load employee');
    }
  }

/*This method to call api which insert/add new employee */

  Future<void> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse('$baseUrlForEmp_tb'),
      body: jsonEncode(employee),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create employee');
    }
  }

/*This method to call api which update/modify employee detail*/

  Future<void> updateEmployee(Employee employee) async {

/*P_EMP_ID this parameter is the same parameter which we are writing when we call the api in postman*/
    final response = await http.put(Uri.parse('$baseUrlForEmp_tb?P_EMP_ID=${employee.empID}'),
      body: jsonEncode(employee),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }

/*This method to call api which delete employee detail*/

  Future<void> deleteEmployee(int id) async {

/*P_EMP_ID this parameter is the same parameter which we are writing when we call the api in postman*/
    final response = await http.delete(Uri.parse('$baseUrlForEmp_tb?P_EMP_ID=$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }
}


 */






/*class ApiService {
  Future<List<Employee>?> getAllEmployees() async {
    try {
      var baseUrl;

      var usersEndpoint;
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(Uri.parse(
          'https://apex.oracle.com/pls/apex/alqarar_ws/emp_tbt//emp_tbt/'));
      if (response.statusCode == 200) {
        List<Employee> model = userModelFromJson(response.body) as List<Employee>;
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  userModelFromJson(String body) {}
}*/
