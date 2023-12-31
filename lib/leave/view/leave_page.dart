import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_repository/leave_repository.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/leave/leave.dart';
import 'package:rmpl_hrm_admin/leave_detail/cubit/update_leave_detail_cubit.dart';
import 'package:rmpl_hrm_admin/leave_detail/leave_application_detail.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({
    super.key,
  });

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const LeavePage(),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LeaveBloc(
            leaveRepository: context.read<LeaveRepository>(),
          )..add(
              LeaveDateChanged(
                DateTime.now().add(
                  const Duration(seconds: 1),
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => UpdateLeaveDetailCubit(
            repository: context.read<LeaveRepository>(),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<LeaveBloc, LeaveState>(
            listenWhen: (previous, current) => previous.date != current.date,
            listener: (context, state) {
              if (!state.status.isLoading) {
                context.read<LeaveBloc>().add(
                      LeaveLoaded(
                        context.read<AppBloc>().state.user.id,
                      ),
                    );
              }
            },
          ),
          BlocListener<LeaveBloc, LeaveState>(
            listenWhen: (previous, current) =>
                previous.selectedLeave != current.selectedLeave,
            listener: (context, state) {
              if (state.selectedLeave.isEmpty == false) {
                Navigator.of(context).push(
                  LeaveDetailPage.route(
                    context.read<LeaveBloc>(),
                    context.read<UpdateLeaveDetailCubit>(),
                  ),
                );
              }
            },
          ),
        ],
        child: const LeaveView(),
      ),
    );
  }
}
