import 'package:attendance_repository/attendance_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/attendance_count/attendance_count.dart';
import 'package:rmpl_hrm_admin/dashboard/dashboard.dart';

class DashboardPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const DashboardPage(),
      );

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AttendanceBloc(
            attendanceRepository: context.read<AttendanceRepository>(),
          )..add(
              AttendanceLoaded(
                creator: context.read<AppBloc>().state.user.id,
              ),
            ),
        ),
        BlocProvider.value(
          value: context.read<AttendanceCountBloc>()
            ..add(
              AttendanceCountDate(
                date: DateTime.now(),
              ),
            ),
        ),
      ],
      child: const DashboardView(),
    );
  }
}
