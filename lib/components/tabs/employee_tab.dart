import 'package:employee_api/employee_api.dart';
import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class EmployeeTab extends StatelessWidget {
  const EmployeeTab({
    super.key,
    required this.employee,
  });

  final Employee employee;

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
                  '${employee.firstName} ${employee.lastName}',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: darkColor,
                  ),
                ),
                8.heightBox,
                Text(
                  'EID: ${employee.eid}',
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
            title: 'View more',
            onTap: () {
              // Navigator.of(context).push(
              //   EmployeesProfileScreen.route(employee),
              // );
            },
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
