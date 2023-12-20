import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api/employee_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime/mime.dart';

class EmployeeApiClient extends EmployeeApi {
  const EmployeeApiClient({
    required FirebaseFirestore firestore,
    required FirebaseStorage firebaseStorage,
    required FirebaseAuth firebaseAuth,
  })  : _firestore = firestore,
        _firebaseStorage = firebaseStorage,
        _firebaseAuth = firebaseAuth;

  @override
  Stream<List<Employee>> getEmployees({
    required String creator,
  }) {
    return _firestore
        .collection('employees')
        .where(
          'creator',
          isEqualTo: _firestore.collection('admin').doc(creator),
        )
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Employee.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }

  @override
  Future<Iterable<String>> getEmployeeIds({
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
      return result.docs.map((e) => e.id);
    } catch (e) {
      throw EmployeeNotFoundFailure();
    }
  }

  @override
  Future<Employee> getEmployee({
    required String id,
  }) async {
    try {
      final doc = await _firestore.collection('employees').doc(id).get();
      return Employee.fromJson(doc.data()!);
    } on FirebaseException catch (e) {
      throw EmployeeNotFoundFailure.fromMessage(
        e.message ?? 'Something went wrong',
      );
    } catch (_) {
      throw EmployeeNotFoundFailure();
    }
  }

  @override
  Future<void> createEmployee({
    required String creator,
    required String eid,
    required String password,
    required String branch,
    required String firstName,
    required String lastName,
    required DateTime dob,
    required String designation,
    required DateTime dateJoined,
    required String fathersName,
    required String address,
    required String email,
    required String aadharNumber,
    required String panNumber,
    required double basicSalary,
    required double hra,
    required String fieldWorkAllowance,
    required File file,
  }) async {
    try {
      final userCredentials =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final profilePicTask = await _firebaseStorage
          .ref()
          .child('profile_pic')
          .child(userCredentials.user!.uid)
          .putFile(
            file,
            SettableMetadata(
              contentType: lookupMimeType(file.path),
            ),
          );

      final profilePic = await profilePicTask.ref.getDownloadURL();

      await _firestore
          .collection('employees')
          .doc(userCredentials.user!.uid)
          .set({
        'eid': eid,
        'password': password,
        'branch': branch,
        'firstName': firstName,
        'lastName': lastName,
        'dob': Timestamp.fromDate(dob),
        'designation': designation,
        'dateJoined': Timestamp.fromDate(dateJoined),
        'fathersName': fathersName,
        'address': address,
        'email': email,
        'aadharNumber': aadharNumber,
        'panNumber': panNumber,
        'basicSalary': basicSalary,
        'hra': hra,
        'fieldWorkAllowance': fieldWorkAllowance,
        'profilePic': profilePic,
        'creator': _firestore.collection('admin').doc(creator),
        'probation': false,
        'uid': userCredentials.user!.uid,
      });
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure(e.code);
    } catch (e) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> updateEmployee({
    required String creator,
    required String uid,
    String? eid,
    String? password,
    String? branch,
    String? firstName,
    String? lastName,
    DateTime? dob,
    String? designation,
    DateTime? dateJoined,
    String? fathersName,
    String? address,
    String? email,
    String? aadharNumber,
    String? panNumber,
    double? basicSalary,
    double? hra,
    String? fieldWorkAllowance,
    File? file,
  }) async {
    try {
      final data = <String, dynamic>{
        'creator': _firestore.collection('admin').doc(creator),
        'probation': false,
      };

      String? profilePic;
      if (file != null && file.existsSync()) {
        final profilePicTask = await _firebaseStorage
            .ref()
            .child('profile_pic')
            .child(uid)
            .putFile(
              file,
              SettableMetadata(
                contentType: lookupMimeType(file.path),
              ),
            );

        profilePic = await profilePicTask.ref.getDownloadURL();
      }

      if (eid != null) data['eid'] = eid;
      if (password != null) data['password'] = password;
      if (branch != null) data['branch'] = branch;
      if (firstName != null) data['firstName'] = firstName;
      if (lastName != null) data['lastName'] = lastName;
      if (dob != null) data['dob'] = dob;
      if (designation != null) data['designation'] = designation;
      if (dateJoined != null) data['dateJoined'] = dateJoined;
      if (fathersName != null) data['fathersName'] = fathersName;
      if (address != null) data['address'] = address;
      if (email != null) data['email'] = email;
      if (aadharNumber != null) data['aadharNumber'] = aadharNumber;
      if (panNumber != null) data['panNumber'] = panNumber;
      if (basicSalary != null) data['basicSalary'] = basicSalary;
      if (hra != null) data['hra'] = hra;
      if (fieldWorkAllowance != null) {
        data['fieldWorkAllowance'] = fieldWorkAllowance;
      }
      if (profilePic != null) data['profilePic'] = profilePic;

      await _firestore.collection('employees').doc(uid).update(data);
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure(e.code);
    } catch (e) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> toggleEmployeeActive({
    required String id,
    required bool isActive,
  }) async {
    try {
      await _firestore.collection('employees').doc(id).update({
        'isActive': isActive,
      });
    } on FirebaseAuthException catch (e) {
      throw EmployeeIsActiveToggleFailure.fromCode(e.code);
    } catch (_) {
      throw const EmployeeIsActiveToggleFailure();
    }
  }
}
