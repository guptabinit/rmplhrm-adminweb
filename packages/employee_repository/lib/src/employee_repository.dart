import 'package:employee_api/employee_api.dart';

class EmployeeRepository {
  const EmployeeRepository({
    required EmployeeApi api,
  }) : _api = api;

  Stream<List<Employee>> getEmployees({
    required String creator,
  }) =>
      _api.getEmployees(creator: creator);

  final EmployeeApi _api;
}
