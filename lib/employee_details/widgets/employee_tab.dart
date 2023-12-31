import 'package:employee_api/employee_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';
import 'package:rmpl_hrm_admin/employee_profile/employee_profile.dart';
import 'package:rmpl_hrm_admin/update_employee_profile/update_employee_profile.dart';
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
                8.heightBox,
                Text(
                  'Status: ${employee.isActive == true ? 'Active' : 'Disabled'}',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: employee.isActive == true ? greenColor : redColor,
                  ),
                ),
              ],
            ),
          ),
          SecondaryButton(
            title: 'View more',
            onTap: () {
              context.read<EmployeeDetailsBloc>().add(
                    EmployeeDetailsSelected(employee.uid ?? ''),
                  );
              Navigator.of(context).push(
                EmployeeProfilePage.route(
                  context.read<EmployeeDetailsBloc>(),
                  context.read<UpdateEmployeeProfileCubit>(),
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
