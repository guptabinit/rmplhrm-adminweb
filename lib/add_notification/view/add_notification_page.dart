import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/add_notification/add_notification.dart';
import 'package:rmpl_hrm_admin/notifications/notifications.dart';

class AddNotificationPage extends StatelessWidget {
  const AddNotificationPage({
    super.key,
    required this.cubit,
  });

  static Route<void> route(
    AddNotificationCubit cubit,
  ) =>
      MaterialPageRoute(
        builder: (_) => AddNotificationPage(
          cubit: cubit,
        ),
      );

  final AddNotificationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: cubit,
        ),
      ],
      child: const AddNotificationForm(),
    );
  }
}
