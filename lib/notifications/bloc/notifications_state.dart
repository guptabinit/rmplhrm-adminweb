part of 'notifications_bloc.dart';

enum NotificationStatus {
  initial,
  loading,
  success,
  failure,
}

enum ToggleStatus {
  initial,
  loading,
  success,
  failure,
}

final class NotificationsState extends Equatable {
  const NotificationsState({
    this.status = NotificationStatus.initial,
    this.toggleStatus = ToggleStatus.initial,
    this.notifications = const [],
    this.selectedNotification,
  });

  NotificationsState copyWith({
    NotificationStatus? status,
    ToggleStatus? toggleStatus,
    List<Notification>? notifications,
    Notification? selectedNotification,
  }) =>
      NotificationsState(
        status: status ?? this.status,
        toggleStatus: toggleStatus ?? this.toggleStatus,
        notifications: notifications ?? this.notifications,
        selectedNotification: selectedNotification ?? this.selectedNotification,
      );

  @override
  List<Object?> get props => [
        status,
        toggleStatus,
        notifications,
        selectedNotification,
      ];

  final NotificationStatus status;
  final ToggleStatus toggleStatus;
  final List<Notification> notifications;
  final Notification? selectedNotification;
}

extension NotificationStatusX on NotificationStatus {
  bool get isInitial => this == NotificationStatus.initial;

  bool get isLoading => this == NotificationStatus.loading;

  bool get isSuccess => this == NotificationStatus.success;

  bool get isFailure => this == NotificationStatus.failure;
}

extension ToggleStatusX on ToggleStatus {
  bool get isInitial => this == ToggleStatus.initial;

  bool get isLoading => this == ToggleStatus.loading;

  bool get isSuccess => this == ToggleStatus.success;

  bool get isFailure => this == ToggleStatus.failure;
}
