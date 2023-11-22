import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';
import 'package:rmpl_hrm_admin/employee_profile/employee_profile.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({
    super.key,
    required this.bloc,
  });

  static Route<void> route(
    EmployeeDetailsBloc bloc,
  ) =>
      MaterialPageRoute(
        builder: (_) => EmployeeProfilePage(
          bloc: bloc,
        ),
      );

  final EmployeeDetailsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: const EmployeeProfileView(),
    );
  }
}
