import 'dart:io';

import 'package:employee_api/employee_api.dart';

class EmployeeRepository {
  const EmployeeRepository({
    required EmployeeApi api,
  }) : _api = api;

  Stream<List<Employee>> getEmployees({
    required String creator,
  }) =>
      _api.getEmployees(
        creator: creator,
      );

  Future<Employee> getEmployee(
    String id,
  ) =>
      _api.getEmployee(
        id: id,
      );

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
  }) async =>
      _api.createEmployee(
        creator: creator,
        eid: eid,
        password: password,
        branch: branch,
        firstName: firstName,
        lastName: lastName,
        dob: dob,
        designation: designation,
        dateJoined: dateJoined,
        fathersName: fathersName,
        address: address,
        email: email,
        aadharNumber: aadharNumber,
        panNumber: panNumber,
        basicSalary: basicSalary,
        hra: hra,
        fieldWorkAllowance: fieldWorkAllowance,
        file: file,
      );

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
  }) async =>
      _api.updateEmployee(
        creator: creator,
        uid: uid,
        eid: eid,
        password: password,
        branch: branch,
        firstName: firstName,
        lastName: lastName,
        dob: dob,
        designation: designation,
        dateJoined: dateJoined,
        fathersName: fathersName,
        address: address,
        email: email,
        aadharNumber: aadharNumber,
        panNumber: panNumber,
        basicSalary: basicSalary,
        hra: hra,
        fieldWorkAllowance: fieldWorkAllowance,
        file: file,
      );

  Future<void> toggleEmployeeActive({
    required String id,
    required bool isActive,
  }) =>
      _api.toggleEmployeeActive(
        id: id,
        isActive: isActive,
      );

  Future<void> deleteEmployee({
    required String creator,
    required String uid,
  }) =>
      _api.deleteEmployee(creator: creator, uid: uid);

  final EmployeeApi _api;
}
