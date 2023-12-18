import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/add_salary_detail/add_salary_detail.dart';

class AddSalaryDetailPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const AddSalaryDetailPage(),
      );

  const AddSalaryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddSalaryDetailView();
  }
}
