import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmpl_hrm_admin/screens/admin_dashboard_screen.dart';
import 'package:rmpl_hrm_admin/screens/splash_screen.dart';

late Size mq;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RMPL HRM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}
