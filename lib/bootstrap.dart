import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holiday_api/holiday_api.dart';
import 'package:rmpl_hrm_admin/app/app.dart';

void bootstrap({
  required HolidayApi holidayApi,
}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  runApp(const App());
}
