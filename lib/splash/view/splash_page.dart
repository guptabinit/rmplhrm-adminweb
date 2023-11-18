import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/splash/splash.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const SplashPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..onLoaded(),
      child: const SplashView(),
    );
  }
}
