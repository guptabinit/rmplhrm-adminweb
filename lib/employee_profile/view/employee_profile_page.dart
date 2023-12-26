import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:probation_repository/probation_repository.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';
import 'package:rmpl_hrm_admin/employee_profile/employee_profile.dart';
import 'package:rmpl_hrm_admin/update_employee_profile/cubit/update_employee_profile_cubit.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({
    super.key,
    required this.bloc,
    required this.cubit,
  });

  static Route<void> route(
    EmployeeDetailsBloc bloc,
    UpdateEmployeeProfileCubit cubit,
  ) =>
      MaterialPageRoute(
        builder: (_) => EmployeeProfilePage(
          bloc: bloc,
          cubit: cubit,
        ),
      );

  final EmployeeDetailsBloc bloc;
  final UpdateEmployeeProfileCubit cubit;

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
        BlocProvider(
          create: (context) => EmployeeProfileBloc(
            employeeRepository: context.read<EmployeeRepository>(),
            probationRepository: context.read<ProbationRepository>(),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<EmployeeProfileBloc, EmployeeProfileState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status.isSuccess) {
                context.read<EmployeeDetailsBloc>().add(
                      EmployeeDetailsSelected(
                        context
                            .read<EmployeeDetailsBloc>()
                            .state
                            .selectedEmployee
                            .uid!,
                      ),
                    );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Account active status changed.'),
                    ),
                  );
              }
              if (state.status.isFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Failed to change account active status.'),
                    ),
                  );
              }
            },
          ),
          BlocListener<EmployeeProfileBloc, EmployeeProfileState>(
            listenWhen: (previous, current) =>
                previous.deleteEmployeeProfileStatus !=
                current.deleteEmployeeProfileStatus,
            listener: (context, state) {
              if (state.deleteEmployeeProfileStatus.isSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Account successfully deleted.'),
                    ),
                  );
                Navigator.of(context).pop();
              }
              if (state.deleteEmployeeProfileStatus.isFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Failed to delete this account.'),
                    ),
                  );
              }
            },
          ),
          BlocListener<EmployeeProfileBloc, EmployeeProfileState>(
            listenWhen: (previous, current) =>
                previous.markProbationEmployeeStatus !=
                current.markProbationEmployeeStatus,
            listener: (context, state) {
              if (state.markProbationEmployeeStatus.isSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Account successfully marked as probation employee.',
                      ),
                    ),
                  );
                context.read<EmployeeDetailsBloc>().add(
                      EmployeeDetailsSelected(
                        context
                            .read<EmployeeDetailsBloc>()
                            .state
                            .selectedEmployee
                            .uid!,
                      ),
                    );
              }
              if (state.markProbationEmployeeStatus.isFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Failed to mark this account as probation employee.',
                      ),
                    ),
                  );
              }
            },
          ),
          BlocListener<EmployeeProfileBloc, EmployeeProfileState>(
            listenWhen: (previous, current) =>
                previous.removeProbationEmployeeStatus !=
                current.removeProbationEmployeeStatus,
            listener: (context, state) {
              if (state.removeProbationEmployeeStatus.isSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Account successfully removed from probation.',
                      ),
                    ),
                  );
                context.read<EmployeeDetailsBloc>().add(
                      EmployeeDetailsSelected(
                        context
                            .read<EmployeeDetailsBloc>()
                            .state
                            .selectedEmployee
                            .uid!,
                      ),
                    );
              }
              if (state.removeProbationEmployeeStatus.isFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Failed to remove this account from probation.',
                      ),
                    ),
                  );
              }
            },
          ),
        ],
        child: const EmployeeProfileView(),
      ),
    );
  }
}
