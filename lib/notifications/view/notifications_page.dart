import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/notifications/notifications.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const NotificationsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationsBloc(
        notificationRepository: context.read<NotificationRepository>(),
      )..add(
          NotificationsFetched(
            context.read<AppBloc>().state.user.id,
          ),
        ),
      child: BlocListener<NotificationsBloc, NotificationsState>(
        listener: (context, state) {
          if (state.toggleStatus.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Notification toggled'),
              ),
            );
          }
          if (state.toggleStatus.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Failed to toggle notification'),
              ),
            );
          }
        },
        listenWhen: (previous, current) =>
            previous.toggleStatus != current.toggleStatus,
        child: const NotificationView(),
      ),
    );
  }
}
