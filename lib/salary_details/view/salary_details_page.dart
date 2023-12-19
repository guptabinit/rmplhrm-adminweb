import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/employee_details/bloc/employee_details_bloc.dart';
import 'package:rmpl_hrm_admin/salary_details/bloc/update_salary_details_bloc.dart';
import 'package:rmpl_hrm_admin/salary_details/salary_details.dart';
import 'package:salary_repository/salary_repository.dart';

class SalaryDetailsPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (context) => const SalaryDetailsPage(),
      );

  const SalaryDetailsPage({super.key});

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
          create: (context) => UpdateSalaryDetailsBloc(
            salaryRepository: context.read<SalaryRepository>(),
          ),
        ),
      ],
      child: BlocListener<EmployeeDetailsBloc, EmployeeDetailsState>(
        listenWhen: (previous, current) =>
            previous.employees != current.employees,
        listener: (context, state) {
          if (state.status.isSuccess) {
            for (var element in state.employees) {
              if (element.salaryDetails != null) {
                context.read<UpdateSalaryDetailsBloc>().add(
                      SelectedEmployeeChangedEvent(
                        element,
                      ),
                    );
              }
            }
          }
        },
        child: const SalaryDetailsView(),
      ),
    );
  }
}
