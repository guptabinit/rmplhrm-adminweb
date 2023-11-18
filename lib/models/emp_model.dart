import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeProfile {
  const EmployeeProfile({
    required this.uid,
    required this.eid,
    required this.isActive,
    required this.password,
    required this.branch,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.designation,
    required this.dateJoined,
    required this.fathersName,
    required this.address,
    required this.email,
    required this.aadharNumber,
    required this.panNumber,
    required this.basicSalary,
    required this.hra,
    required this.fieldWorkAllowance,
    required this.profileUrl,
    required this.probation,
    required this.probationTill,
  });
  final String uid;
  final String eid;
  final bool isActive;
  final String password;
  final String branch;
  final String firstName;
  final String lastName;
  final String dob;
  final String designation;
  final String dateJoined;
  final String fathersName;
  final String address;
  final String email;
  final String aadharNumber;
  final String panNumber;
  final String basicSalary;
  final String hra;
  final String fieldWorkAllowance;
  final String profileUrl;
  final bool probation;
  final DateTime probationTill;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'eid': eid,
        'isActive': isActive,
        'password': password,
        'branch': branch,
        'firstName': firstName,
        'lastName': lastName,
        'dob': dob,
        'designation': designation,
        'dateJoined': dateJoined,
        'fathersName': fathersName,
        'address': address,
        'email': email,
        'aadharNumber': aadharNumber,
        'panNumber': panNumber,
        'basicSalary': basicSalary,
        'hra': hra,
        'fieldWorkAllowance': fieldWorkAllowance,
        'profileUrl': profileUrl,
        'probation': probation,
        'probationTill': probationTill,
      };

  static EmployeeProfile fromSnap(DocumentSnapshot snap) {
    final snapshot = snap.data()! as Map<String, dynamic>;

    return EmployeeProfile(
      uid: snapshot['uid'] as String,
      eid: snapshot['eid'] as String,
      isActive: snapshot['isActive'] as bool,
      password: snapshot['password'] as String,
      branch: snapshot['branch'] as String,
      firstName: snapshot['firstName'] as String,
      lastName: snapshot['lastName'] as String,
      dob: snapshot['dob'] as String,
      designation: snapshot['designation'] as String,
      dateJoined: snapshot['dateJoined'] as String,
      fathersName: snapshot['fathersName'] as String,
      address: snapshot['address'] as String,
      email: snapshot['email'] as String,
      aadharNumber: snapshot['aadharNumber'] as String,
      panNumber: snapshot['panNumber'] as String,
      basicSalary: snapshot['basicSalary'] as String,
      hra: snapshot['hra'] as String,
      fieldWorkAllowance: snapshot['fieldWorkAllowance'] as String,
      profileUrl: snapshot['profileUrl'] as String,
      probation: snapshot['probation'] as bool,
      probationTill: snapshot['probationTill'] as DateTime,
    );
  }
}
