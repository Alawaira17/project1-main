// ignore_for_file: unused_import

import 'dart:convert';
import 'package:intl/intl.dart';

class Employee {
      int empId;
      String empName;
      String empDate;

      Employee({
            required this.empId,
            required this.empName,
            required this.empDate,
      });

      // Deserialize JSON to Employee object
      factory Employee.fromJson(Map<String, dynamic> json) {
            return Employee(
                  empId: json["emp_id"] ?? 0,
                  empName: json["emp_name"] ?? '',
                  empDate: json["emp_date"] ?? '',
            );
      }

      // Serialize Employee object to JSON
      Map<String, dynamic> toJson() {
            return {
                  "P_EMP_ID": empId,
                  "P_EMP_NAME": empName,
                  "P_EMP_DATE": empDate, // Format date before serialization
            };
      }

      // Custom method to format date as "DD-MON-YYYY"
      String formatDate(DateTime date) {
            return DateFormat('dd-MMM-yyyy').format(date).toUpperCase();
      }
}


