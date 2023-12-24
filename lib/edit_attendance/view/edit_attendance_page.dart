import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
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
      child: BlocListener<EditAttendanceCubit, EditAttendanceState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  backgroundColor: greenColor,
                  content: Text(
                    'Attendance Updated',
                  ),
                ),
              );
            context.read<AttendanceBloc>().add(
                  AttendanceRefresh(
                    creator: context.read<AppBloc>().state.user.id,
                  ),
                );
            Navigator.of(context).pop();
          }
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: redColor,
                  content: Text(
                    state.errorMessage ?? 'Attendance Update Failed',
                  ),
                ),
              );
          }
        },
        child: const EditAttendanceView(),
      ),
    );
  }
}
