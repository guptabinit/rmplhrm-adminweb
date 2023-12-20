import 'package:salary_api/salary_api.dart';

class SalaryRepository {
  const SalaryRepository({
    required SalaryApi api,
  }) : _api = api;

  Future<void> updateSalary({
    required String employeeId,
    required double amount,
  }) =>
      _api.updateSalary(
        employeeId: employeeId,
        amount: amount,
      );

  Future<void> removeSalary({
    required String employeeId,
  }) =>
      _api.removeSalary(
        employeeId: employeeId,
      );

  final SalaryApi _api;
}
