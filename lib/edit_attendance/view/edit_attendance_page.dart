import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/edit_attendance/edit_attendance.dart';

class EditAttendancePage extends StatelessWidget {
  static Route<void> route({
    required AttendanceBloc bloc,
    required EditAttendanceCubit cubit,
  }) =>
      MaterialPageRoute(
        builder: (_) => EditAttendancePage(
          cubit: cubit,
          bloc: bloc,
        ),
      );

  const EditAttendancePage({
    super.key,
    required this.bloc,
    required this.cubit,
  });

  final AttendanceBloc bloc;
  final EditAttendanceCubit cubit;

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
      child: const EditAttendanceView(),
    );
  }
}
