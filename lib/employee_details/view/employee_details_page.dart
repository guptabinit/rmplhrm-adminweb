import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';
import 'package:rmpl_hrm_admin/employee_profile/employee_profile.dart';
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
          create: (_) => UpdateEmployeeProfileCubit(),
        ),
      ],
      child: BlocListener<EmployeeDetailsBloc, EmployeeDetailsState>(
        listenWhen: (previous, current) =>
            previous.selectedEmployee != current.selectedEmployee,
        listener: (context, state) {
          if (state.selectedEmployee != null &&
              state.selectedEmployee?.isNotEmpty == true) {
            final employee = state.selectedEmployee!;

            context.read<UpdateEmployeeProfileCubit>()
              ..employeeIdChanged(employee.eid)
              ..passwordChanged(employee.password)
              ..firstNameChanged(employee.firstName)
              ..lastNameChanged(employee.lastName)
              ..dateOfBirthChanged(employee.dob.toString())
              ..designationChanged(employee.designation)
              ..dateJoinedChanged(employee.dateJoined.toString())
              ..fathersNameChanged(employee.fathersName)
              ..addressChanged(employee.address)
              ..emailChanged(employee.email)
              ..aadharCardChanged(employee.aadharNumber)
              ..panCardChanged(employee.panNumber)
              ..basicSalaryChanged(employee.basicSalary)
              ..hraChanged(employee.hra)
              ..fieldWorkAllowanceChanged(employee.fieldWorkAllowance);

            Navigator.of(context).push(
              EmployeeProfilePage.route(
                context.read<EmployeeDetailsBloc>(),
                context.read<UpdateEmployeeProfileCubit>(),
              ),
            );
          }
        },
        child: const EmployeeDetailsView(),
      ),
    );
  }
}
