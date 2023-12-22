import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/edit_attendance/edit_attendance.dart';

class EditAttendancePage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const EditAttendancePage(),
      );

  const EditAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditAttendanceView();
  }
}
