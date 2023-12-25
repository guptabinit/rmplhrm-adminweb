import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

class LiveLocationView extends StatelessWidget {
  const LiveLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          "Employee's Profile",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
