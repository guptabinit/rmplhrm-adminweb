import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  const NotificationModel({
    required this.notificationID,
    required this.branch,
    required this.type,
    required this.receiver,
    required this.message,
    required this.date,
    required this.isVisible,
  });
  final String notificationID;
  final String branch;
  final String type;
  final String receiver;
  final String message;
  final String date;
  final bool isVisible;

  Map<String, dynamic> toJson() => {
        'notificationID': notificationID,
        'branch': branch,
        'type': type,
        'receiver': receiver,
        'message': message,
        'date': date,
        'isVisible': isVisible,
      };

  static NotificationModel fromSnap(DocumentSnapshot snap) {
    final snapshot = snap.data()! as Map<String, dynamic>;

    return NotificationModel(
      notificationID: snapshot['notificationID'] as String,
      branch: snapshot['branch'] as String,
      type: snapshot['type'] as String,
      receiver: snapshot['receiver'] as String,
      message: snapshot['message'] as String,
      date: snapshot['date'] as String,
      isVisible: snapshot['isVisible'] as bool,
    );
  }
}
