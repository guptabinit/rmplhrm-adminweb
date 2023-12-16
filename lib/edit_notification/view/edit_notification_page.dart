import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/add_notification/add_notification.dart';
import 'package:rmpl_hrm_admin/edit_notification/edit_notification.dart';
import 'package:rmpl_hrm_admin/notifications/notifications.dart';

class EditNotificationPage extends StatelessWidget {
  const EditNotificationPage({
    super.key,
    required this.cubit,
    required this.bloc,
  });

  static Route<void> route(
    AddNotificationCubit cubit,
    NotificationsBloc bloc,
  ) =>
      MaterialPageRoute(
        builder: (_) => EditNotificationPage(
          cubit: cubit,
          bloc: bloc,
        ),
      );

  final AddNotificationCubit cubit;
  final NotificationsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cubit,
        ),
        BlocProvider.value(
          value: bloc,
        ),
      ],
      child: const EditNotificationForm(),
    );
  }
}
