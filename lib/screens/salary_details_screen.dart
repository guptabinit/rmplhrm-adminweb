import 'package:flutter/material.dart';

class SalaryDetailScreen extends StatefulWidget {
  const SalaryDetailScreen({super.key});

  @override
  State<SalaryDetailScreen> createState() => _SalaryDetailScreenState();
}

class _SalaryDetailScreenState extends State<SalaryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SalaryDetailScreen'),
      ),
    );
  }
}