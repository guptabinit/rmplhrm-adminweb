import 'dart:io';

import 'package:employee_api/employee_api.dart';

abstract class EmployeeApi {
  const EmployeeApi();

  Stream<List<Employee>> getEmployees({
    required String creator,
  });

  Future<Iterable<String>> getEmployeeIds({
    required String creator,
  });

  Future<Employee> getEmployee({
    required String id,
  });

  Future<void> createEmployee({
    required String creator,
    required String eid,
    required String password,
    required String branch,
    required String firstName,
    required String lastName,
    required DateTime dob,
    required String designation,
    required DateTime dateJoined,
    required String fathersName,
    required String address,
    required String email,
    required String aadharNumber,
    required String panNumber,
    required double basicSalary,
    required double hra,
    required String fieldWorkAllowance,
    required File file,
  });

  Future<void> updateEmployee({
    required String creator,
    required String uid,
    String? eid,
    String? password,
    String? branch,
    String? firstName,
    String? lastName,
    DateTime? dob,
    String? designation,
    DateTime? dateJoined,
    String? fathersName,
    String? address,
    String? email,
    String? aadharNumber,
    String? panNumber,
    double? basicSalary,
    double? hra,
    String? fieldWorkAllowance,
    File? file,
  });
}

class EmployeeNotFoundFailure implements Exception {
  EmployeeNotFoundFailure([
    this.message = 'Employee not found',
  ]);

  EmployeeNotFoundFailure.fromMessage(String message) : this(message);

  final String message;
}

class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  final String message;
}
