import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmpl_hrm_admin/components/manage_leave_card.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class LeaveApplicationScreen extends StatefulWidget {
  const LeaveApplicationScreen({super.key});

  @override
  State<LeaveApplicationScreen> createState() => _LeaveApplicationScreenState();
}

class _LeaveApplicationScreenState extends State<LeaveApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              
              const Text.rich(TextSpan(children: [
                TextSpan(
                  text: '2 Approved leave',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: greenColor,
                      fontWeight: FontWeight.w400),
                ),
                TextSpan(text: '  '),
                TextSpan(
                  text: '2 Rejected leave',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: redColor,
                      fontWeight: FontWeight.w400),
                ),
              ])),
              4.heightBox,
              const Text(
                '1 Pending leave',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: textGreyColor,
                    fontWeight: FontWeight.w400),
              ),
              12.heightBox,
              manageLeaveCard(borderColor),
              manageLeaveCard(redColor),
              manageLeaveCard(greenColor),
              manageLeaveCard(greenColor),
            ],
          ),
        ),
      ),
    );
  }
}