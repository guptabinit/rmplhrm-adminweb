import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';
import 'package:rmpl_hrm_admin/update_employee_profile/update_employee_profile.dart';

class UpdateEmployeeProfilePage extends StatelessWidget {
  const UpdateEmployeeProfilePage({
    super.key,
    required UpdateEmployeeProfileCubit cubit,
    required EmployeeDetailsBloc bloc,
  })  : _cubit = cubit,
        _bloc = bloc;

  static Route<void> route(
    UpdateEmployeeProfileCubit cubit,
    EmployeeDetailsBloc bloc,
  ) =>
      MaterialPageRoute(
        builder: (_) => UpdateEmployeeProfilePage(
          cubit: cubit,
          bloc: bloc,
        ),
      );

  final UpdateEmployeeProfileCubit _cubit;
  final EmployeeDetailsBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _cubit,
        ),
        BlocProvider.value(
          value: _bloc,
        ),
      ],
      child: const UpdateEmployeeProfileForm(),
    );
  }
}
