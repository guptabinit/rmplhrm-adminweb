import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/add_employee/add_employee.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const AddEmployeePage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddEmployeeCubit(),
      child: const AddEmployeeForm(),
    );
  }
}
