abstract class SalaryApi {
  const SalaryApi();

  Future<void> updateSalary({
    required String employeeId,
    required double amount,
  });

  Future<void> removeSalary({
    required String employeeId,
  });
}
