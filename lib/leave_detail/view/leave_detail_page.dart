import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:leave_repository/leave_repository.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/leave/leave.dart';
import 'package:rmpl_hrm_admin/leave_detail/bloc/leave_detail_bloc.dart';
import 'package:rmpl_hrm_admin/leave_detail/cubit/update_leave_detail_cubit.dart';
import 'package:rmpl_hrm_admin/leave_detail/leave_application_detail.dart';

class LeaveDetailPage extends StatelessWidget {
  const LeaveDetailPage({
    super.key,
    required this.bloc,
    required this.cubit,
  });

  static Route<void> route(
    LeaveBloc bloc,
    UpdateLeaveDetailCubit cubit,
  ) =>
      MaterialPageRoute(
        builder: (_) => LeaveDetailPage(
          bloc: bloc,
          cubit: cubit,
        ),
      );

  final LeaveBloc bloc;
  final UpdateLeaveDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: bloc,
        ),
        BlocProvider(
          create: (context) => LeaveDetailBloc(
            leaveRepository: context.read<LeaveRepository>(),
            employeeRepository: context.read<EmployeeRepository>(),
          )..add(
              LeaveDetailLoaded(
                context.read<LeaveBloc>().state.selectedLeave.id!,
              ),
            ),
        ),
        BlocProvider.value(
          value: cubit,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<LeaveDetailBloc, LeaveDetailState>(
            listenWhen: (previous, current) => previous.leave != current.leave,
            listener: (context, state) {
              if (state.leave.isEmpty == false) {
                context.read<UpdateLeaveDetailCubit>()
                  ..onLeaveReasonChanged(state.leave.adminReason)
                  ..onLeaveStatusChanged(state.leave.status);
              }
            },
          ),
          BlocListener<UpdateLeaveDetailCubit, UpdateLeaveDetailState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status.isSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: greenColor,
                      content: Text(
                        'Leave status updated successfully!',
                      ),
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
                        state.errorMessage ?? 'Leave status update failed!',
                      ),
                    ),
                  );
              }
            },
          ),
        ],
        child: const LeaveDetailView(),
      ),
    );
  }
}
