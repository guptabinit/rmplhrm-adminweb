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
    on<NotificationsToggle>(_onNotificationsToggle);
    on<SelectedNotification>(_onSelectedNotification);
    on<DeselectedNotification>(_onDeselectedNotification);
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

  Future<void> _onNotificationsToggle(
    NotificationsToggle event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      state.copyWith(
        toggleStatus: ToggleStatus.loading,
      ),
    );
    try {
      await _notificationRepository.toggleVisibility(
        creator: event.creator,
        id: event.id,
        visible: event.visible,
      );
      emit(
        state.copyWith(
          toggleStatus: ToggleStatus.success,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          toggleStatus: ToggleStatus.failure,
        ),
      );
    }
  }

  void _onSelectedNotification(
    SelectedNotification event,
    Emitter<NotificationsState> emit,
  ) {
    emit(
      state.copyWith(
        selectedNotification: event.notification,
      ),
    );
  }

  void _onDeselectedNotification(
    DeselectedNotification event,
    Emitter<NotificationsState> emit,
  ) {
    emit(
      state.copyWith(
        selectedNotification: Notification.empty,
      ),
    );
  }

  final NotificationRepository _notificationRepository;
}
