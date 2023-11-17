import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday_repository/holiday_repository.dart';
import 'package:provider/provider.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/providers/admin_provider.dart';
import 'package:rmpl_hrm_admin/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.holidayRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: holidayRepository,
        ),
      ],
      child: const AppView(),
    );
  }

  final HolidayRepository holidayRepository;
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AdminProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RMPL HRM ADMIN',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
