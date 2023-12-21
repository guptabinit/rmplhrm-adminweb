import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leave_api/leave_api.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class LeaveApplicationCard extends StatelessWidget {
  const LeaveApplicationCard({
    super.key,
    required this.leave,
  });

  final Leave leave;

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
            blurStyle: BlurStyle.outer,
          ),
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
                colorFilter: const ColorFilter.mode(
                  primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              8.widthBox,
              Expanded(
                child: Text(
                  leave.fromDate != null && leave.fromDate != null
                      ? '${leave.fromDate?.dateWithOutYear} - ${leave.toDate?.dateWithOutYear}'
                      : leave.date.dateWithOutYear,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: leave.color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Status: ${leave.status?.capitalize()}',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          12.heightBox,
          Text(
            'Leave type: ${leave.leaveType?.capitalize()} Leave',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          8.heightBox,
          Text(
            'Applied on: ${leave.createdAt.date}',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          8.heightBox,
          FutureBuilder(
            future: leave.user?.get(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const SizedBox.shrink();
                case ConnectionState.done:
                  final user = User.fromJson(
                    snapshot.data?.data() as Map<String, dynamic>,
                  );
                  return Text(
                    'Applied by: ${user.fullName}',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}

extension UserX on User {
  String get fullName {
    return '$firstName $lastName';
  }
}

extension LeaveX on Leave {
  Color get color {
    switch (status?.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
