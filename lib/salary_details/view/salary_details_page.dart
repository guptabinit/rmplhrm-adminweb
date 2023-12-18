import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/employee_details/bloc/employee_details_bloc.dart';
import 'package:rmpl_hrm_admin/salary_details/salary_details.dart';

class SalaryDetailsPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (context) => const SalaryDetailsPage(),
      );

  const SalaryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeDetailsBloc(
        employeeRepository: context.read<EmployeeRepository>(),
      )..add(
          EmployeeDetailsFetched(
            context.read<AppBloc>().state.user.id,
          ),
        ),
      child: const SalaryDetailsView(),
    );
  }
}
