import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/admin_profile/admin_profile.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/root/root.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const RootPage(),
      );

  static Page<void> page() => const MaterialPage<void>(child: RootPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RootCubit(),
      child: BlocListener<AdminProfileBloc, AdminProfileState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isFailure) {
            context.read<AdminProfileBloc>().add(
                  AdminProfileLoaded(
                    context.read<AppBloc>().state.user.id,
                  ),
                );
          }
        },
        child: const RootView(),
      ),
    );
  }
}
