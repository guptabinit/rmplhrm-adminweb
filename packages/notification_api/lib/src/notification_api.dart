import 'package:notification_api/notification_api.dart';

abstract class NotificationApi {
  const NotificationApi();

  Stream<List<Notification>> getAllNotifications({
    required String creator,
  });

  Future<void> createNotification({
    required String creator,
    required String branch,
    required String message,
    required String type,
    required String receiver,
  });

  Future<void> toggleVisibility({
    required String id,
    required bool visible,
    required String creator,
  });
}

class CreateNotificationFailure implements Exception {
  const CreateNotificationFailure([
    this.message = 'Failed to create notification',
  ]);

  factory CreateNotificationFailure.fromCode(String code) {
    switch (code.toLowerCase()) {
      case 'failed_precondition':
        return const CreateNotificationFailure('The query requires an index.');
      default:
        return const CreateNotificationFailure();
    }
  }

  final String message;
}

class ToggleNotificationFailure implements Exception {
  const ToggleNotificationFailure([
    this.message = 'Failed to toggle notification visibility',
  ]);

  factory ToggleNotificationFailure.fromCode(String code) {
    switch (code.toLowerCase()) {
      case 'failed_precondition':
        return const ToggleNotificationFailure('The query requires an index.');
      default:
        return const ToggleNotificationFailure();
    }
  }

  final String message;
}
