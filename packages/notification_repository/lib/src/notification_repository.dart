import 'package:notification_api/notification_api.dart';

class NotificationRepository {
  const NotificationRepository({
    required NotificationApi api,
  }) : _api = api;

  Stream<List<Notification>> getNotifications({
    required String creator,
  }) =>
      _api.getAllNotifications(creator: creator);

  Future<void> createNotification({
    required String creator,
    required String branch,
    required String message,
    required String type,
    required String receiver,
  }) =>
      _api.createNotification(
        creator: creator,
        branch: branch,
        message: message,
        type: type,
        receiver: receiver,
      );

  final NotificationApi _api;
}
