import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:rmpl_hrm_admin/add_notification/add_notification.dart';

class AddNotificationPage extends StatelessWidget {
  const AddNotificationPage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const AddNotificationPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotificationCubit(
        notificationRepository: context.read<NotificationRepository>(),
      ),
      child: const AddNotificationForm(),
    );
  }
}
