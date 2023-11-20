import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/notifications/notifications.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16),
        margin: const EdgeInsets.only(),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            switch (state.status) {
              case NotificationStatus.initial:
              case NotificationStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case NotificationStatus.success:
                return ListView.separated(
                  separatorBuilder: (_, __) => 14.heightBox,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: state.notifications.length,
                  itemBuilder: (BuildContext context, int index) {
                    final notification = state.notifications[index];
                    return NotificationCard(notification: notification);
                  },
                );
              case NotificationStatus.failure:
                return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}
