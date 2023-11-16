import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rmpl_hrm_admin/models/emp_model.dart';
import 'package:rmpl_hrm_admin/models/notification_model.dart';
import 'package:rmpl_hrm_admin/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class FirestoreMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // function for creating a new employee
  Future<String> createNewEmployee(
      {required String eid,
      required String password,
      required String branch,
      required String firstName,
      required String lastName,
      required String dob,
      required String designation,
      required String dateJoined,
      required String fathersName,
      required String address,
      required String email,
      required String aadharNumber,
      required String panNumber,
      required String basicSalary,
      required String hra,
      required String fieldWorkAllowance,
      required Uint8List file}) async {
    String res = "Some error occurred";

    if (eid.isNotEmpty &&
        password.isNotEmpty &&
        branch.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        dob.isNotEmpty &&
        designation.isNotEmpty &&
        dateJoined.isNotEmpty &&
        fathersName.isNotEmpty &&
        address.isNotEmpty &&
        email.isNotEmpty &&
        aadharNumber.isNotEmpty &&
        panNumber.isNotEmpty &&
        basicSalary.isNotEmpty &&
        hra.isNotEmpty &&
        fieldWorkAllowance.isNotEmpty &&
        file != null) {
      FirebaseApp app = await Firebase.initializeApp(
        name: 'Secondary',
        options: Firebase.app().options,
      );

      try {
        UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
            .createUserWithEmailAndPassword(email: email, password: password);

        try {
          String photoUrl = await StorageMethods()
              .uploadImageToStorage(uid: userCredential.user!.uid, file: file);

          try {
            EmployeeProfile employee = EmployeeProfile(
              uid: userCredential.user!.uid,
              eid: eid,
              isActive: true,
              password: password,
              branch: branch,
              firstName: firstName,
              lastName: lastName,
              dob: dob,
              designation: designation,
              dateJoined: dateJoined,
              fathersName: fathersName,
              address: address,
              email: email,
              aadharNumber: aadharNumber,
              panNumber: panNumber,
              basicSalary: basicSalary,
              hra: hra,
              fieldWorkAllowance: fieldWorkAllowance,
              profileUrl: photoUrl,
              probation: false,
              probationTill: DateTime.now(),
            );

            // adding employee info in database
            await _firestore
                .collection('employees')
                .doc(userCredential.user!.uid)
                .set(employee.toJson());

            res = "success";
          } catch (e) {
            userCredential.user!.delete();
            res = "Some error occurred while uploading data";
          }
        } catch (e) {
          userCredential.user!.delete();
          res = "Some error occurred while uploading profile picture";
        }
      } catch (e) {
        res = e.toString();
      }

      await app.delete();
    } else {
      res = "Enter all the details carefully";
    }

    return res;
  }

  // add new notification
  Future<String> createNewNotification({
    required String branch,
    required String type,
    required String receiver,
    required String message,
  }) async {
    String res = "Some error occurred";

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss dd/MM/yyyy').format(now);

    if (branch.isNotEmpty &&
        type.isNotEmpty &&
        receiver.isNotEmpty &&
        message.isNotEmpty) {
      String notificationID = const Uuid().v1();

      NotificationModel notification = NotificationModel(
        notificationID: notificationID,
        branch: branch,
        type: type,
        receiver: receiver,
        message: message,
        date: formattedDate,
        isVisible: true,
      );

      // adding employee info in database
      await _firestore
          .collection('notifications')
          .doc(notificationID)
          .set(notification.toJson());

      res = "success";
    } else {
      res = "We need all the fields to be filled.";
    }

    return res;
  }

  // add holiday
  Future<String> addHoliday({
    required String date,
    required String formattedDate,
    required String title,
  }) async {
    String res = "Some error occurred";

    if (date.isNotEmpty && title.isNotEmpty) {
      // String holidayID = const Uuid().v1();

      // HolidayModel holiday = HolidayModel(
      //   holidayID: holidayID,
      //   date: date,
      //   title: title,
      //   formattedDate: formattedDate,
      // );

      // adding employee info in database
      // await _firestore
      //     .collection('holidays')
      //     .doc(holidayID)
      //     .set(holiday.toJson());

      res = "success";
    } else {
      res = "We need all the fields to be filled.";
    }

    return res;
  }
}
