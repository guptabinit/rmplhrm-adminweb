import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holiday_api/holiday_api.dart';
import 'package:holiday_repository/holiday_repository.dart';
import 'package:leave_api/leave_api.dart';
import 'package:leave_repository/leave_repository.dart';
import 'package:notification_api/notification_api.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:rmpl_hrm_admin/app/app.dart';

Future<void> bootstrap({
  required HolidayApi holidayApi,
  required NotificationApi notificationApi,
  required LeaveApi leaveApi,
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

  await authenticationRepository.user.first;

  runApp(
    App(
      authenticationRepository: authenticationRepository,
      holidayRepository: holidayRepository,
      notificationRepository: notificationRepository,
      leaveRepository: leaveRepository,
    ),
  );
}
