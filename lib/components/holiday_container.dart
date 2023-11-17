import 'package:flutter/material.dart';
import 'package:holiday_api/holiday_api.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class HolidayCardWidget extends StatelessWidget {
  final Holiday holiday;

  const HolidayCardWidget({
    super.key,
    required this.holiday,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: primaryColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${holiday.date?.date}",
            style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                // color: textGreyColor,
                fontWeight: FontWeight.w500),
          ),
          const Text(
            ': ',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                // color: textGreyColor,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              "${holiday.title}",
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: textGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget holidayContainer(String date, String reason) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor)),
    child: Row(
      children: [
        Text(
          date,
          style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              // color: textGreyColor,
              fontWeight: FontWeight.w500),
        ),
        const Text(
          ': ',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              // color: textGreyColor,
              fontWeight: FontWeight.w500),
        ),
        Text(
          reason,
          style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: textGreyColor,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
