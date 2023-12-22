import 'package:attendance_repository/attendance_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/edit_attendance/edit_attendance.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const AttendancePage(),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AttendanceBloc(
            attendanceRepository: context.read<AttendanceRepository>(),
          )..add(
              AttendanceDateChanged(
                date: DateTime.now(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => EditAttendanceCubit(
            repository: context.read<AttendanceRepository>(),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AttendanceBloc, AttendanceState>(
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
          ),
          BlocListener<AttendanceBloc, AttendanceState>(
            listenWhen: (previous, current) =>
                previous.selectedAttendance != current.selectedAttendance,
            listener: (context, state) {
              if (state.selectedAttendance.isNotEmpty) {
                context.read<EditAttendanceCubit>()
                  ..punchedInChanged(
                    state.selectedAttendance.punchedIn?.toString() ?? '',
                  )
                  ..punchedOutChanged(
                    state.selectedAttendance.punchedOut?.toString() ?? '',
                  );
                Navigator.of(
                  context,
                ).push(
                  EditAttendancePage.route(
                    bloc: context.read<AttendanceBloc>(),
                    cubit: context.read<EditAttendanceCubit>(),
                  ),
                );
              }
            },
          ),
        ],
        child: const AttendanceView(),
      ),
    );
  }
}
