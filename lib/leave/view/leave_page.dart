import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_repository/leave_repository.dart';
import 'package:rmpl_hrm_admin/leave/leave.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const LeavePage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaveBloc(
        leaveRepository: context.read<LeaveRepository>(),
      )..add(LeaveDateChanged(DateTime.now())),
      child: BlocListener<LeaveBloc, LeaveState>(
        listenWhen: (previous, current) => previous.date != current.date,
        listener: (context, state) {
          if (!state.status.isLoading) {
            context.read<LeaveBloc>().add(LeaveFeatched());
          }
        },
        child: const LeaveView(),
      ),
    );
  }
}
