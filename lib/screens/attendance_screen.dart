import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/buttons/secondary_button.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const AttendanceScreen(),
      );

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Container(
          margin: const EdgeInsets.only(top: 0),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Calendar.svg',
                    colorFilter: const ColorFilter.mode(
                      primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  8.widthBox,
                  const Text(
                    '22 Sep 2023',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  12.widthBox,
                  SecondaryButton(
                    title: "Change Date",
                    onTap: () {},
                    fontSize: 14,
                  ),
                ],
              ),
              16.heightBox,
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '7 already in',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: greenColor,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(text: '   '),
                    TextSpan(
                      text: '2 remaining',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: redColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: textGreyColor,
              ),
              12.heightBox,
              const Text(
                '1. Riya punched in at 10:35 AM',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: darkColor,
                    fontWeight: FontWeight.w400),
              ),
              12.heightBox,
              const Text(
                '2. Ashish punched in at 10:25 AM',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: darkColor,
                    fontWeight: FontWeight.w400),
              ),
              12.heightBox,
              const Text(
                '3. Akash punched in at 10:10 AM',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: darkColor,
                    fontWeight: FontWeight.w400),
              ),
              12.heightBox,
              const Text(
                '4. Vishesh punched in at 10:00 AM',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: darkColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ));
  }
}
