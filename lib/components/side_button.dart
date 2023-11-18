import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

Widget sideButton(String title, void Function()? ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: buttonColor.withOpacity(0.3),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: primaryColor,
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}
