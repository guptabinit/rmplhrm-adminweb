import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api/employee_api.dart';
import 'package:http/http.dart' as http;
import 'package:notification_api/notification_api.dart';

class NotificationApiClient extends NotificationApi {
  NotificationApiClient({
    FirebaseFirestore? firestore,
    http.Client? client,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _client = client ?? http.Client();

  @override
  Future<void> createNotification({
    required String creator,
    required String branch,
    required String message,
    required String type,
    required String receiver,
    required bool isVisible,
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
          'isVisible': isVisible,
        },
      );

      final employees = await _getEmployees(creator: creator);

      if (isVisible) {
        for (final employee in employees) {
          for (final token in employee.tokens ?? <String?>[]) {
            if (token != null) {
              await _sendNotification(
                token: token,
                title: branch,
                body: message,
              );
            }
          }
        }
      }
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
        .orderBy('createdAt', descending: true)
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

  @override
  Future<void> updateNotification({
    required String id,
    required String creator,
    String? branch,
    String? message,
    String? type,
    String? receiver,
  }) async {
    try {
      final doc = await _firestore
          .collection('notifications')
          .where('id', isEqualTo: id)
          .where(
            'creator',
            isEqualTo: _firestore.collection('admin').doc(creator),
          )
          .get();

      if (!doc.docs.first.exists) {
        throw UpdateNotificationFailure.fromCode('not-found');
      }

      final data = <String, dynamic>{};

      if (branch != null) data['branch'] = branch;
      if (message != null) data['message'] = message;
      if (type != null) data['type'] = type;
      if (receiver != null) data['receiver'] = receiver;

      await _firestore.collection('notifications').doc(id).update(data);
    } on FirebaseException catch (e) {
      throw UpdateNotificationFailure.fromCode(e.code);
    } catch (_) {
      throw const UpdateNotificationFailure();
    }
  }

  Future<List<Employee>> _getEmployees({
    required String creator,
  }) async {
    try {
      final result = await _firestore
          .collection('employees')
          .where(
            'creator',
            isEqualTo: _firestore.collection('admin').doc(creator),
          )
          .get();

      final docs = result.docs
          .map(
            (e) => Employee.fromJson(e.data()),
          )
          .toList();

      return docs;
    } catch (e) {
      return [];
    }
  }

  Future<void> _sendNotification({
    required String token,
    required String title,
    required String body,
  }) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';

    final data = {
      'to': token,
      'notification': {
        'title': title,
        'body': body,
      },
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          'key=AAAAl41URrc:APA91bH9ZrsSJ89lJTZzuUGQz58RFxLsuNQJzzoKbZdAVef9M-gfGRoqINDafxXvxJ8O35UWC3wKBW5_6QezzjVk7U1VWnCz6d8qmLoQsoj8P2LLIEcNJyVz8Oca1d5XN_okCVoWUU2U',
    };

    await _client.post(
      Uri.parse(postUrl),
      body: json.encode(data),
      encoding: Encoding.getByName('utf-8'),
      headers: headers,
    );
  }

  final FirebaseFirestore _firestore;
  final http.Client _client;
}
