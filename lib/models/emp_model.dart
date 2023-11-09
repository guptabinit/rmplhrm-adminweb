import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeProfile {
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
  });

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
      };

  static EmployeeProfile fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return EmployeeProfile(
      uid: snapshot['uid'],
      eid: snapshot['eid'],
      isActive: snapshot['isActive'],
      password: snapshot['password'],
      branch: snapshot['branch'],
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      dob: snapshot['dob'],
      designation: snapshot['designation'],
      dateJoined: snapshot['dateJoined'],
      fathersName: snapshot['fathersName'],
      address: snapshot['address'],
      email: snapshot['email'],
      aadharNumber: snapshot['aadharNumber'],
      panNumber: snapshot['panNumber'],
      basicSalary: snapshot['basicSalary'],
      hra: snapshot['hra'],
      fieldWorkAllowance: snapshot['fieldWorkAllowance'],
      profileUrl: snapshot['profileUrl'],
    );
  }
}
