import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String uid;
  final String email;
  final String branch;
  final String password;
  final String inTime;
  final String outTime;
  final String workingHours;


  const AdminModel({
    required this.uid,
    required this.email,
    required this.branch,
    required this.password,
    required this.inTime,
    required this.outTime,
    required this.workingHours,
  });

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
    var snapshot = snap.data() as Map<String, dynamic>;

    return AdminModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      branch: snapshot['branch'],
      password: snapshot['password'],
      inTime: snapshot['in_time'],
      outTime: snapshot['out_time'],
      workingHours: snapshot['working_hours'],
    );
  }
}
