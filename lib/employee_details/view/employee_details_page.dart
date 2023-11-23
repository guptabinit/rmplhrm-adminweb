import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';
import 'package:rmpl_hrm_admin/update_employee_profile/update_employee_profile.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const EmployeeDetailsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmployeeDetailsBloc(
            employeeRepository: context.read<EmployeeRepository>(),
          )..add(
              EmployeeDetailsFetched(
                context.read<AppBloc>().state.user.id,
              ),
            ),
        ),
        BlocProvider(
          create: (_) => UpdateEmployeeProfileCubit(
            employeeRepository: context.read<EmployeeRepository>(),
          ),
        ),
      ],
      child: const EmployeeDetailsView(),
    );
  }
}
