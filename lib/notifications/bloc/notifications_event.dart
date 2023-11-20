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
