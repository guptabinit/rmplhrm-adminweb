import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';
import 'package:rmpl_hrm_admin/employee_profile/employee_profile.dart';
import 'package:rmpl_hrm_admin/update_employee_profile/cubit/update_employee_profile_cubit.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({
    super.key,
    required this.bloc,
    required this.cubit,
  });

  static Route<void> route(
    EmployeeDetailsBloc bloc,
    UpdateEmployeeProfileCubit cubit,
  ) =>
      MaterialPageRoute(
        builder: (_) => EmployeeProfilePage(
          bloc: bloc,
          cubit: cubit,
        ),
      );

  final EmployeeDetailsBloc bloc;
  final UpdateEmployeeProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: bloc,
        ),
        BlocProvider.value(
          value: cubit,
        ),
      ],
      child: const EmployeeProfileView(),
    );
  }
}
