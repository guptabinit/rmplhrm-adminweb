part of 'notifications_bloc.dart';

enum NotificationStatus {
  initial,
  loading,
  success,
  failure,
}

final class NotificationsState extends Equatable {
  const NotificationsState({
    this.status = NotificationStatus.initial,
    this.notifications = const [],
  });

  NotificationsState copyWith({
    NotificationStatus? status,
    List<Notification>? notifications,
  }) =>
      NotificationsState(
        status: status ?? this.status,
        notifications: notifications ?? this.notifications,
      );

  @override
  List<Object?> get props => [status, notifications];

  final NotificationStatus status;
  final List<Notification> notifications;
}

extension NotificationStatusX on NotificationStatus {
  bool get isInitial => this == NotificationStatus.initial;
  bool get isLoading => this == NotificationStatus.loading;
  bool get isSuccess => this == NotificationStatus.success;
  bool get isFailure => this == NotificationStatus.failure;
}
