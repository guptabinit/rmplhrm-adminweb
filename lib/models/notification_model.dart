import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String notificationID;
  final String branch;
  final String type;
  final String receiver;
  final String message;
  final String date;
  final bool isVisible;

  const NotificationModel({
    required this.notificationID,
    required this.branch,
    required this.type,
    required this.receiver,
    required this.message,
    required this.date,
    required this.isVisible,
  });

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
    var snapshot = snap.data() as Map<String, dynamic>;

    return NotificationModel(
      notificationID: snapshot['notificationID'],
      branch: snapshot['branch'],
      type: snapshot['type'],
      receiver: snapshot['receiver'],
      message: snapshot['message'],
      date: snapshot['date'],
      isVisible: snapshot['isVisible'],
    );
  }
}
