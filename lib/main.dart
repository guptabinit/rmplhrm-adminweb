import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_api_client/employee_api_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:holiday_api_client/holiday_api_client.dart';
import 'package:leave_api_client/leave_api_client.dart';
import 'package:notification_api_client/notification_api_client.dart';
import 'package:rmpl_hrm_admin/bootstrap.dart';
import 'package:rmpl_hrm_admin/firebase_options.dart';

late Size mq;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestore = FirebaseFirestore.instance;

  final holidayApi = HolidayApiClient(firestore: firestore);
  final notificationApi = NotificationApiClient(firestore: firestore);
  final leaveApi = LeaveApiClient(firestore: firestore);
  final employeeApi = EmployeeApiClient(firestore: firestore);

  await bootstrap(
    holidayApi: holidayApi,
    notificationApi: notificationApi,
    leaveApi: leaveApi,
    employeeApi: employeeApi,
  );
}
