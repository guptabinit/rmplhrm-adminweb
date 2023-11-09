import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmpl_hrm_admin/screens/other_screens/profile_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';
import '../buttons/secondary_button.dart';

class EmployeeTab extends StatelessWidget {
  final Map<String, dynamic> snap;

  const EmployeeTab({super.key, required this.snap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: lightGreyColor),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: lightGreyColor,
            offset: Offset(1, 1),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${snap['firstName']} ${snap['lastName']}",
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: darkColor,
                  ),
                ),
                8.heightBox,
                Text(
                  "EID: ${snap['eid']}",
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: textGreyColor,
                  ),
                ),
              ],
            ),
          ),
          SecondaryButton(
            title: "View more",
            onTap: () {
              Get.to(
                () => EmployeesProfileScreen(
                  snap: snap,
                ),
              );
            },
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
