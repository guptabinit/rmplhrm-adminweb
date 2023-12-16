import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notification_api/notification_api.dart';

class NotificationApiClient extends NotificationApi {
  NotificationApiClient({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createNotification({
    required String creator,
    required String branch,
    required String message,
    required String type,
    required String receiver,
  }) async {
    try {
      final doc = _firestore.collection('notifications').doc();
      await doc.set(
        {
          'id': doc.id,
          'creator': _firestore.collection('admin').doc(creator),
          'branch': branch,
          'message': message,
          'type': type,
          'receiver': receiver,
          'createdAt': FieldValue.serverTimestamp(),
        },
      );
    } catch (_) {
      throw const CreateNotificationFailure();
    }
  }

  @override
  Future<void> toggleVisibility({
    required String id,
    required bool visible,
    required String creator,
  }) async {
    try {
      await _firestore
          .collection(
            'notifications',
          )
          .doc(id)
          .update({
        'isVisible': visible,
      });
    } on FirebaseException catch (e) {
      throw ToggleNotificationFailure.fromCode(e.code);
    } catch (_) {
      throw const ToggleNotificationFailure();
    }
  }

  @override
  Stream<List<Notification>> getAllNotifications({
    required String creator,
  }) {
    return _firestore
        .collection('notifications')
        .where(
          'creator',
          isEqualTo: _firestore.collection('admin').doc(creator),
        )
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Notification.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }

  final FirebaseFirestore _firestore;
}
