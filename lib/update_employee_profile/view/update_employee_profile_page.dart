import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/update_employee_profile/update_employee_profile.dart';

class UpdateEmployeeProfilePage extends StatelessWidget {
  const UpdateEmployeeProfilePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const UpdateEmployeeProfilePage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateEmployeeProfileCubit(),
      child: const UpdateEmployeeProfileView(),
    );
  }
}
