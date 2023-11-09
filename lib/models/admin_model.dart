import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String uid;
  final String email;
  final String branch;
  final String password;

  const AdminModel({
    required this.uid,
    required this.email,
    required this.branch,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'branch': branch,
    'password': password,
  };

  static AdminModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AdminModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      branch: snapshot['branch'],
      password: snapshot['password'],
    );
  }
}
