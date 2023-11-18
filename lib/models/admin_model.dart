import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  const AdminModel({
    required this.uid,
    required this.email,
    required this.branch,
    required this.password,
    required this.inTime,
    required this.outTime,
    required this.workingHours,
  });
  final String uid;
  final String email;
  final String branch;
  final String password;
  final String inTime;
  final String outTime;
  final String workingHours;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'branch': branch,
        'password': password,
        'in_time': inTime,
        'out_time': outTime,
        'working_hours': workingHours,
      };

  static AdminModel fromSnap(DocumentSnapshot snap) {
    final snapshot = snap.data()! as Map<String, dynamic>;

    return AdminModel(
      uid: snapshot['uid'] as String,
      email: snapshot['email'] as String,
      branch: snapshot['branch'] as String,
      password: snapshot['password'] as String,
      inTime: snapshot['in_time'] as String,
      outTime: snapshot['out_time'] as String,
      workingHours: snapshot['working_hours'] as String,
    );
  }
}
