import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notification_api/notification_api.dart';
import 'package:notification_repository/notification_repository.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc({
    required NotificationRepository notificationRepository,
  })  : _notificationRepository = notificationRepository,
        super(const NotificationsState()) {
    on<NotificationsFetched>(_onNotificationsFetched);
  }

  Future<void> _onNotificationsFetched(
    NotificationsFetched event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: NotificationStatus.loading,
      ),
    );
    await emit.forEach<List<Notification>>(
      _notificationRepository.getNotifications(
        creator: event.creator,
      ),
      onData: (notifications) => state.copyWith(
        status: NotificationStatus.success,
        notifications: notifications,
      ),
      onError: (_, __) => state.copyWith(
        status: NotificationStatus.failure,
      ),
    );
  }

  final NotificationRepository _notificationRepository;
}
