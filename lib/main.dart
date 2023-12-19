import 'package:admin_profile_api_client/admin_profile_api_client.dart';
import 'package:attendance_api_client/attendance_api_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api_client/employee_api_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:holiday_api_client/holiday_api_client.dart';
import 'package:leave_api_client/leave_api_client.dart';
import 'package:notification_api_client/notification_api_client.dart';
import 'package:rmpl_hrm_admin/bootstrap.dart';
import 'package:rmpl_hrm_admin/firebase_options.dart';
import 'package:salary_api_client/salary_api_client.dart';

late Size mq;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final app = await Firebase.initializeApp(
    name: 'secondary',
    options: Firebase.app().options,
  );

  final firestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final firebaseAuth = FirebaseAuth.instanceFor(app: app);

  final holidayApi = HolidayApiClient(firestore: firestore);
  final notificationApi = NotificationApiClient(firestore: firestore);
  final leaveApi = LeaveApiClient(firestore: firestore);
  final employeeApi = EmployeeApiClient(
    firestore: firestore,
    firebaseStorage: firebaseStorage,
    firebaseAuth: firebaseAuth,
  );
  final adminProfileApi = AdminProfileApiClient(firestore: firestore);
  final attendanceApi = AttendanceApiClient(firestore: firestore);
  final salaryApi = SalaryApiClient(firestore: firestore);

  await bootstrap(
    holidayApi: holidayApi,
    notificationApi: notificationApi,
    leaveApi: leaveApi,
    employeeApi: employeeApi,
    adminProfileApi: adminProfileApi,
    attendanceApi: attendanceApi,
    salaryApi: salaryApi,
  );
}
