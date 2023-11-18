import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:holiday_api_client/holiday_api_client.dart';
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

  await bootstrap(holidayApi: holidayApi);
}
