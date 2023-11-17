import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const LoginPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const LoginForm();
  }
}
