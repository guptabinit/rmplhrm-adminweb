import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/edit_attendance/edit_attendance.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: const EdgeInsets.only(),
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
                BlocBuilder<AttendanceBloc, AttendanceState>(
                  buildWhen: (previous, current) =>
                      previous.date != current.date,
                  builder: (context, state) {
                    return Text(
                      state.date?.date ?? '',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
                12.widthBox,
                SecondaryButton(
                  title: 'Change Date',
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1970),
                      lastDate: DateTime.now(),
                    );
                    if (date != null && context.mounted) {
                      context.read<AttendanceBloc>().add(
                            AttendanceDateChanged(date: date),
                          );
                    }
                  },
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: '   '),
                  TextSpan(
                    text: '2 remaining',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: redColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: textGreyColor),
            12.heightBox,
            BlocBuilder<AttendanceBloc, AttendanceState>(
              builder: (context, state) {
                switch (state.status) {
                  case AttendanceStatus.initial:
                  case AttendanceStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case AttendanceStatus.success:
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.attendances.length,
                        itemBuilder: (context, index) {
                          final attendance = state.attendances[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            title: Text(
                              '${index + 1}. ${attendance.employee?.firstName} punched in at ${attendance.punchedIn.onlyTime}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: darkColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: PopupMenuButton(
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                    child: Text(
                                      'Revoke',
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: const Text(
                                      'Edit',
                                    ),
                                    onTap: () => Navigator.of(
                                      context,
                                    ).push(
                                      EditAttendancePage.route(),
                                    ),
                                  ),
                                ];
                              },
                              icon: const Icon(Icons.more_vert),
                            ),
                          );
                        },
                      ),
                    );
                  case AttendanceStatus.failure:
                    return Text('Error ${state.errorMessage}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension on DateTime? {
  String get onlyTime => this != null ? DateFormat.jm().format(this!) : 'N/A';
}
