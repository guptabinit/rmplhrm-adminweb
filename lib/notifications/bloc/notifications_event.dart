part of 'notifications_bloc.dart';

sealed class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object?> get props => [];
}

final class NotificationsFetched extends NotificationsEvent {
  const NotificationsFetched(this.creator);

  final String creator;

  @override
  List<Object?> get props => [creator];
}

final class NotificationsToggle extends NotificationsEvent {
  const NotificationsToggle({
    required this.id,
    required this.visible,
    required this.creator,
  });

  final String id;
  final bool visible;
  final String creator;

  @override
  List<Object?> get props => [
        id,
        visible,
        creator,
      ];
}

final class SelectedNotification extends NotificationsEvent {
  const SelectedNotification(this.notification);

  @override
  List<Object?> get props => [notification];

  final Notification notification;
}

final class DeselectedNotification extends NotificationsEvent {
  const DeselectedNotification();
}
