import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

Widget holidayContainer(String date, String reason) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor)),
    child: Row(
      children: [
        Text(
          date,
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              // color: textGreyColor,
              fontWeight: FontWeight.w500),
        ),
        Text(
          ': ',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              // color: textGreyColor,
              fontWeight: FontWeight.w500),
        ),
        Text(
          reason,
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: textGreyColor,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
