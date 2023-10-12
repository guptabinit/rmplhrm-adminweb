import 'package:flutter/material.dart';

class ProbationListScreen extends StatefulWidget {
  const ProbationListScreen({super.key});

  @override
  State<ProbationListScreen> createState() => _ProbationListScreenState();
}

class _ProbationListScreenState extends State<ProbationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ProbationListScreen'),
      ),
    );
  }
}