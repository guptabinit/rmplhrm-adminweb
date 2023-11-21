import 'package:employee_api/employee_api.dart';
import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/employee_profile/employee_profile.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({
    super.key,
    required this.employee,
  });

  static Route<void> route(Employee employee) => MaterialPageRoute(
        builder: (_) => EmployeeProfilePage(
          employee: employee,
        ),
      );

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return EmployeeProfileView(
      employee: employee,
    );
  }
}
