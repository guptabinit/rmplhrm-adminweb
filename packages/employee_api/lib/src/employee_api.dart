import 'package:employee_api/employee_api.dart';

abstract class EmployeeApi {
  const EmployeeApi();

  Stream<List<Employee>> getEmployees({
    required String creator,
  });
}
