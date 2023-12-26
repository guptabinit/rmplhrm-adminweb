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
    required bool isVisible,
  }) =>
      _api.createNotification(
        creator: creator,
        branch: branch,
        message: message,
        type: type,
        receiver: receiver,
        isVisible: isVisible,
      );

  Future<void> updateNotification({
    required String id,
    required String creator,
    String? branch,
    String? message,
    String? type,
    String? receiver,
  }) =>
      _api.updateNotification(
        id: id,
        creator: creator,
        branch: branch,
        message: message,
        receiver: receiver,
        type: type,
      );

  Future<void> toggleVisibility({
    required String id,
    required bool visible,
    required String creator,
  }) =>
      _api.toggleVisibility(
        creator: creator,
        id: id,
        visible: visible,
      );

  final NotificationApi _api;
}
