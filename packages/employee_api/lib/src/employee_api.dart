import 'package:employee_api/employee_api.dart';

abstract class EmployeeApi {
  const EmployeeApi();

  Stream<List<Employee>> getEmployees({
    required String creator,
  });

  Future<Employee> getEmployee({
    required String id,
  });
}

class EmployeeNotFoundFailure implements Exception {
  EmployeeNotFoundFailure([
    this.message = 'Employee not found',
  ]);

  EmployeeNotFoundFailure.fromMessage(String message) : this(message);

  final String message;
}
