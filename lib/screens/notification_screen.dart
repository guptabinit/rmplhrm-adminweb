import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/notification_card.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: primaryColor,
        body: Column(
      children: [
        notificationCard(),
        notificationCard(),
        notificationCard(),
        notificationCard(),
        notificationCard()
      ],
    ));
  }
}
