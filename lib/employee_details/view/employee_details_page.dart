import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const EmployeeDetailsPage(),
      );

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
      child: const EmployeeDetailsView(),
    );
  }
}