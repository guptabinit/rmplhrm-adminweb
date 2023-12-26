import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_repository/leave_repository.dart';
import 'package:rmpl_hrm_admin/leave/leave.dart';
import 'package:rmpl_hrm_admin/leave_detail/bloc/leave_detail_bloc.dart';
import 'package:rmpl_hrm_admin/leave_detail/leave_application_detail.dart';

class LeaveDetailPage extends StatelessWidget {
  const LeaveDetailPage({
    super.key,
    required this.bloc,
  });

  static Route<void> route(LeaveBloc bloc) => MaterialPageRoute(
        builder: (_) => LeaveDetailPage(bloc: bloc),
      );

  final LeaveBloc bloc;

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
      ],
      child: const LeaveDetailView(),
    );
  }
}
