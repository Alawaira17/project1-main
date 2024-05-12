
import 'package:project1/Service/api_serives.dart';

import '../Model/model.dart';

class UserController {
  final ApiService _apiService = ApiService();

  Future<List<Employee>> fetchUsers() async {
    try {
      return await _apiService.getAllEmployees();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }

  Future<void> insertUser(Employee employee) async {
    try {
      await _apiService.createEmployee(employee);
    } catch (e) {
      throw Exception('Failed to insert user: $e');
    }
  }
}