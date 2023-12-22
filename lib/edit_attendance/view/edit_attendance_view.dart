import 'package:attendance_api/attendance_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/components/custom_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/edit_attendance/edit_attendance.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class EditAttendanceView extends StatelessWidget {
  const EditAttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) {
        context.read<AttendanceBloc>().add(
              const SelectedAttendance(
                Attendance.empty,
              ),
            );
      },
      canPop: true,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          titleSpacing: 0,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Edit attendance',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<AttendanceBloc, AttendanceState>(
                    builder: (context, state) {
                      return RichText(
                        text: TextSpan(
                          text: 'Employee name: ',
                          style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                          children: [
                            TextSpan(
                              text:
                                  '${state.selectedAttendance.employee?.firstName} ${state.selectedAttendance.employee?.lastName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  BlocBuilder<AttendanceBloc, AttendanceState>(
                    builder: (context, state) {
                      return RichText(
                        text: TextSpan(
                          text: 'Punched in: ',
                          style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                          children: [
                            TextSpan(
                              text:
                                  '${state.selectedAttendance.punchedIn?.onlyTime}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  BlocBuilder<AttendanceBloc, AttendanceState>(
                    builder: (context, state) {
                      return RichText(
                        text: TextSpan(
                          text: 'Punched out: ',
                          style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                          children: [
                            TextSpan(
                              text:
                                  '${state.selectedAttendance.punchedOut?.onlyTime}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  16.heightBox,
                  Text(
                    'Punch in',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  4.heightBox,
                  BlocBuilder<EditAttendanceCubit, EditAttendanceState>(
                    buildWhen: (previous, current) =>
                        previous.punchIn != current.punchIn,
                    builder: (context, state) {
                      return CustomTextFormField(
                        initialValue: state.punchIn.value.toString(),
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (time == null) return;
                          final now = DateTime.now();
                          final date = DateTime(
                            now.year,
                            now.month,
                            now.day,
                            time.hour,
                            time.minute,
                          );
                        },
                        text: 'Punched in',
                        readOnly: true,
                        suffixIcon: const Icon(Icons.punch_clock),
                      );
                    },
                  ),
                  12.heightBox,
                  Text(
                    'Punch out',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  4.heightBox,
                  BlocBuilder<EditAttendanceCubit, EditAttendanceState>(
                    buildWhen: (previous, current) =>
                        previous.punchOut != current.punchOut,
                    builder: (context, state) {
                      return CustomTextFormField(
                        initialValue: state.punchOut.value.toString(),
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (time == null) return;
                          final now = DateTime.now();
                          final date = DateTime(
                            now.year,
                            now.month,
                            now.day,
                            time.hour,
                            time.minute,
                          );
                        },
                        text: 'Punched out',
                        readOnly: true,
                        suffixIcon: const Icon(Icons.lock_clock),
                      );
                    },
                  ),
                  25.heightBox,
                  CustomButton(
                    onPress: () {},
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on DateTime? {
  String get onlyTime => this != null ? DateFormat.jm().format(this!) : 'N/A';
}
