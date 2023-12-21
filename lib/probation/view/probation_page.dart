import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:probation_repository/probation_repository.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/probation/probation.dart';

class ProbationPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const ProbationPage(),
      );

  const ProbationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProbationBloc(
        repository: context.read<ProbationRepository>(),
      )..add(
          ProbationEmployeesFetched(
            context.read<AppBloc>().state.user.id,
          ),
        ),
      child: const ProbationView(),
    );
  }
}
