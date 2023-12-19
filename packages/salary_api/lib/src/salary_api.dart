abstract class SalaryApi {
  const SalaryApi();

  Future<void> updateSalary({
    required String employeeId,
    required double amount,
  });
}
