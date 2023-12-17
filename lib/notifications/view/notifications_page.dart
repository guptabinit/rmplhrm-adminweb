import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:rmpl_hrm_admin/add_notification/add_notification.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/edit_notification/edit_notification.dart';
import 'package:rmpl_hrm_admin/notifications/notifications.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const NotificationsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<NotificationsBloc>()
            ..add(
              NotificationsFetched(
                context.read<AppBloc>().state.user.id,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => EditNotificationCubit(
            notificationRepository: context.read<NotificationRepository>(),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<NotificationsBloc, NotificationsState>(
            listener: (
              context,
              state,
            ) {
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
          ),
          BlocListener<NotificationsBloc, NotificationsState>(
            listener: (context, state) {
              if (state.selectedNotification != null &&
                  state.selectedNotification?.isEmpty == false) {
                final selectedNotification = state.selectedNotification;

                context.read<EditNotificationCubit>()
                  ..selectNotificationReceiver(selectedNotification?.receiver)
                  ..selectNotificationType(selectedNotification?.type)
                  ..changeNotificationMessage(selectedNotification?.message);

                Navigator.of(context).push(
                  EditNotificationPage.route(
                    context.read<EditNotificationCubit>(),
                    context.read<NotificationsBloc>(),
                  ),
                );
              }
            },
            listenWhen: (previous, current) =>
                previous.selectedNotification != current.selectedNotification,
          )
        ],
        child: const NotificationView(),
      ),
    );
  }
}
