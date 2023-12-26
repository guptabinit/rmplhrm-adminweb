import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/attendance_count/attendance_count.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
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
                      context.read<AttendanceCountBloc>().add(
                            AttendanceCountDate(
                              date: date,
                            ),
                          );
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
            BlocBuilder<AttendanceCountBloc, AttendanceCountState>(
              builder: (context, state) {
                return Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${state.attendanceCount.present} already in',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: greenColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: '   '),
                      TextSpan(
                        text: '${state.attendanceCount.absent} remaining',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: redColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
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
                                  PopupMenuItem(
                                    child: const Text(
                                      'Revoke',
                                    ),
                                    onTap: () async {
                                      final result = await showDialog<bool>(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                const Text('Revoke Attendance'),
                                            content: const Text(
                                              'Are you sure you want to revoke this attendance?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.of(
                                                  context,
                                                ).pop(
                                                  true,
                                                ),
                                                child: const Text('Yes'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.of(
                                                  context,
                                                ).pop(
                                                  false,
                                                ),
                                                child: const Text('Cancel'),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      if (result == true && context.mounted) {
                                        context.read<AttendanceBloc>().add(
                                              AttendanceRevoke(
                                                createdAt:
                                                    attendance.createdAt!,
                                                punchedBy:
                                                    attendance.punchedBy!.id,
                                              ),
                                            );
                                      }
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: const Text(
                                      'Edit',
                                    ),
                                    onTap: () {
                                      context.read<AttendanceBloc>().add(
                                            SelectedAttendance(attendance),
                                          );
                                    },
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
