import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class LeaveApplicationCard extends StatelessWidget {
  const LeaveApplicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: borderColor,
            blurRadius: 30,
            // spreadRadius: 12
            blurStyle: BlurStyle.outer,
          )
        ],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/Calendar.svg',
                color: primaryColor,
              ),
              8.widthBox,
              const Expanded(
                child: Text(
                  '01 Sep - 30 Sep',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green, // Variable tag color
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Status: Pending',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          12.heightBox,
          const Text(
            'Leave type: Casual Leave',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                // color: textGreyColor,
                fontWeight: FontWeight.w400),
          ),
          8.heightBox,
          const Text(
            'Applied on: 1 September 2023',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                // color: textGreyColor,
                fontWeight: FontWeight.w400),
          ),
          8.heightBox,
          const Text(
            'Applied by: Ashish Kumar',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                // color: textGreyColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

Widget manageLeaveCard(Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(boxShadow: const [
      BoxShadow(
          color: borderColor,
          blurRadius: 30,
          // spreadRadius: 12
          blurStyle: BlurStyle.outer)
    ], borderRadius: BorderRadius.circular(8), border: Border.all(color: borderColor)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Calendar.svg',
              color: primaryColor,
            ),
            8.widthBox,
            Expanded(
              child: const Text(
                '01 Sep - 30 Sep',
                style: TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
              child: const Text(
                'Status: Pending',
                style: TextStyle(fontFamily: 'Inter', fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        12.heightBox,
        const Text(
          'Leave type: Casual Leave',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              // color: textGreyColor,
              fontWeight: FontWeight.w400),
        ),
        8.heightBox,
        const Text(
          'Applied on: 1 September 2023',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              // color: textGreyColor,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}
