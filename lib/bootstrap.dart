import 'dart:developer';

import 'package:admin_profile_api/admin_profile_api.dart';
import 'package:admin_profile_repository/admin_profile_repository.dart';
import 'package:attendance_api/attendance_api.dart';
import 'package:attendance_repository/attendance_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:employee_api/employee_api.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:holiday_api/holiday_api.dart';
import 'package:holiday_repository/holiday_repository.dart';
import 'package:leave_api/leave_api.dart';
import 'package:leave_repository/leave_repository.dart';
import 'package:live_location_api/live_location_api.dart';
import 'package:live_location_repository/live_location_repository.dart';
import 'package:notification_api/notification_api.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:probation_api/probation_api.dart';
import 'package:probation_repository/probation_repository.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:salary_api/salary_api.dart';
import 'package:salary_repository/salary_repository.dart';

Future<void> bootstrap({
  required HolidayApi holidayApi,
  required NotificationApi notificationApi,
  required LeaveApi leaveApi,
  required EmployeeApi employeeApi,
  required AdminProfileApi adminProfileApi,
  required AttendanceApi attendanceApi,
  required SalaryApi salaryApi,
  required ProbationApi probationApi,
  required LiveLocationApi liveLocationApi,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final authenticationRepository = AuthenticationRepository();
  final holidayRepository = HolidayRepository(
    api: holidayApi,
  );
  final notificationRepository = NotificationRepository(
    api: notificationApi,
  );
  final leaveRepository = LeaveRepository(api: leaveApi);
  final employeeRepository = EmployeeRepository(api: employeeApi);
  final adminProfileRepository = AdminProfileRepository(api: adminProfileApi);
  final attendanceRepository = AttendanceRepository(api: attendanceApi);
  final salaryRepository = SalaryRepository(api: salaryApi);
  final probationRepository = ProbationRepository(api: probationApi);
  final liveLocationRepository = LiveLocationRepository(api: liveLocationApi);

  await authenticationRepository.user.first;

  runApp(
    App(
      authenticationRepository: authenticationRepository,
      holidayRepository: holidayRepository,
      notificationRepository: notificationRepository,
      leaveRepository: leaveRepository,
      employeeRepository: employeeRepository,
      adminProfileRepository: adminProfileRepository,
      attendanceRepository: attendanceRepository,
      salaryRepository: salaryRepository,
      probationRepository: probationRepository,
      liveLocationRepository: liveLocationRepository,
    ),
  );
}
