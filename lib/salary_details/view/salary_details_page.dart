import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/salary_details/salary_details.dart';

class SalaryDetailsPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (context) => const SalaryDetailsPage(),
      );

  const SalaryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SalaryDetailsView();
  }
}
