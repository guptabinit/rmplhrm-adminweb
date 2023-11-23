import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rmpl_hrm_admin/add_employee/add_employee.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const AddEmployeePage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddEmployeeCubit(
        employeeRepository: context.read<EmployeeRepository>(),
      ),
      child: BlocListener<AddEmployeeCubit, AddEmployeeState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Employee Added'),
                ),
              );
            Navigator.of(context).pop();
          }

          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.errorMessage ?? 'Error Adding Employee'),
                ),
              );
          }
        },
        child: const AddEmployeeForm(),
      ),
    );
  }
}
