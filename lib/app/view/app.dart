import 'package:admin_profile_repository/admin_profile_repository.dart';
import 'package:attendance_repository/attendance_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday_repository/holiday_repository.dart';
import 'package:leave_repository/leave_repository.dart';
import 'package:live_location_repository/live_location_repository.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:probation_repository/probation_repository.dart';
import 'package:rmpl_hrm_admin/admin_profile/admin_profile.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/attendance_count/bloc/attendance_count_bloc.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/splash/splash.dart';
import 'package:salary_repository/salary_repository.dart';

class App extends StatelessWidget {
  const App({
    required this.authenticationRepository,
    required this.holidayRepository,
    required this.notificationRepository,
    required this.leaveRepository,
    required this.employeeRepository,
    required this.adminProfileRepository,
    required this.attendanceRepository,
    required this.salaryRepository,
    required this.probationRepository,
    required this.liveLocationRepository,
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
        RepositoryProvider.value(
          value: employeeRepository,
        ),
        RepositoryProvider.value(
          value: adminProfileRepository,
        ),
        RepositoryProvider.value(
          value: attendanceRepository,
        ),
        RepositoryProvider.value(
          value: salaryRepository,
        ),
        RepositoryProvider.value(
          value: probationRepository,
        ),
        RepositoryProvider.value(
          value: liveLocationRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => AdminProfileBloc(
              adminProfileRepository: context.read<AdminProfileRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => AttendanceCountBloc(
              repository: context.read<AttendanceRepository>(),
            ),
          ),
        ],
        child: BlocListener<AttendanceCountBloc, AttendanceCountState>(
          listenWhen: (previous, current) => previous.date != current.date,
          listener: (context, state) {
            if (state.date != null) {
              context.read<AttendanceCountBloc>().add(
                    AttendanceCountLoaded(
                      creator: context.read<AppBloc>().state.user.id,
                      date: state.date,
                    ),
                  );
            }
          },
          child: const AppView(),
        ),
      ),
    );
  }

  final AuthenticationRepository authenticationRepository;
  final HolidayRepository holidayRepository;
  final NotificationRepository notificationRepository;
  final LeaveRepository leaveRepository;
  final EmployeeRepository employeeRepository;
  final AdminProfileRepository adminProfileRepository;
  final AttendanceRepository attendanceRepository;
  final SalaryRepository salaryRepository;
  final ProbationRepository probationRepository;
  final LiveLocationRepository liveLocationRepository;
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
