import 'package:attendance_repository/attendance_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const AttendancePage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendanceBloc(
        attendanceRepository: context.read<AttendanceRepository>(),
      )..add(
          AttendanceDateChanged(
            date: DateTime.now(),
          ),
        ),
      child: BlocListener<AttendanceBloc, AttendanceState>(
        listenWhen: (previous, current) => previous.date != current.date,
        listener: (context, state) {
          if (!state.status.isLoading) {
            context.read<AttendanceBloc>().add(
                  AttendanceLoaded(
                    creator: context.read<AppBloc>().state.user.id,
                  ),
                );
          }
        },
        child: const AttendanceView(),
      ),
    );
  }
}
