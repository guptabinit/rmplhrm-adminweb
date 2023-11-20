import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday_repository/holiday_repository.dart';
import 'package:leave_repository/leave_repository.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/splash/splash.dart';

class App extends StatelessWidget {
  const App({
    required this.authenticationRepository,
    required this.holidayRepository,
    required this.notificationRepository,
    required this.leaveRepository,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
        RepositoryProvider.value(
          value: holidayRepository,
        ),
        RepositoryProvider.value(
          value: notificationRepository,
        ),
        RepositoryProvider.value(
          value: leaveRepository,
        ),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: const AppView(),
      ),
    );
  }

  final AuthenticationRepository authenticationRepository;
  final HolidayRepository holidayRepository;
  final NotificationRepository notificationRepository;
  final LeaveRepository leaveRepository;
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RMPL HRM ADMIN',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      home: const SplashPage(),
    );
  }
}
