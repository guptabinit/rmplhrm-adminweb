import 'package:flutter/material.dart' hide Notification;
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:notification_api/notification_api.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.notification,
    super.key,
  });

  final Notification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: borderColor,
            spreadRadius: 0.2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.heightBox,
          Text(
            '${notification.type?.capitalize()}',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          8.heightBox,
          Text(
            '${notification.message}',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  notification.createdAt.date,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: textGreyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_square,
                  color: primaryColor,
                ),
              ),
              4.widthBox,
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_red_eye_rounded,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
