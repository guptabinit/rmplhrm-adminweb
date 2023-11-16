import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:rmpl_hrm_admin/components/manage_leave_card.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/screens/other_screens/leave_application_detail_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

import '../components/buttons/secondary_button.dart';

class LeaveApplicationScreen extends StatefulWidget {
  const LeaveApplicationScreen({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const LeaveApplicationScreen(),
      );

  @override
  State<LeaveApplicationScreen> createState() => _LeaveApplicationScreenState();
}

class _LeaveApplicationScreenState extends State<LeaveApplicationScreen> {
  DateTime selectedDate = DateTime.now();
  var formatterDate = DateFormat('MMM yyyy');
  var monthFormatter = DateFormat('MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 0),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  Text(
                    formatterDate.format(selectedDate),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.widthBox,
                  SecondaryButton(
                    title: "Change Duration",
                    onTap: () {
                      showMonthPicker(
                        context: context,
                        initialDate: selectedDate,
                      ).then((date) {
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      });
                    },
                    fontSize: 14,
                  ),
                ],
              ),
              12.heightBox,
              const Text.rich(
                TextSpan(
                  style: TextStyle(
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: '2 Approved leave',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: greenColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: '  '),
                    TextSpan(
                      text: '2 Rejected leave',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: redColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: '1 Pending leave',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: textGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              8.heightBox,
              const Divider(
                color: textGreyColor,
              ),
              4.heightBox,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    LeaveApplicationDetailScreen.route(),
                  );
                },
                child: const LeaveApplicationCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
