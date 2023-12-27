import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/attendance_count/attendance_count.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/root/root.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(),
        margin: const EdgeInsets.only(),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              16.heightBox,
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Punch In',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Punch Out',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Working Hours',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: borderColor,
                    endIndent: 16,
                    indent: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '10:00 AM',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '06:00 PM',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '8 Hours',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              20.heightBox,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Attendance',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 220,
                child: BlocBuilder<AttendanceCountBloc, AttendanceCountState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status ||
                      previous.attendanceCount != current.attendanceCount,
                  builder: (context, state) {
                    switch (state.status) {
                      case AttendanceCountStatus.initial:
                      case AttendanceCountStatus.loading:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case AttendanceCountStatus.success:
                        final presentPercent = state.attendanceCount.present /
                            state.attendanceCount.total *
                            100;
                        final absentPercent = state.attendanceCount.absent /
                            state.attendanceCount.total *
                            100;
                        return AspectRatio(
                          aspectRatio: 1.3,
                          child: Row(
                            children: [
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: PieChart(
                                    PieChartData(
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      centerSpaceRadius: 0,
                                      sections: [
                                        PieChartSectionData(
                                          color: Colors.purple[300]!,
                                          title: '${presentPercent.toInt()}%',
                                          titleStyle: const TextStyle(
                                            color: whiteColor,
                                          ),
                                          value: presentPercent,
                                          radius: 90,
                                        ),
                                        PieChartSectionData(
                                          color: Colors.red[300]!,
                                          title: '${absentPercent.toInt()}%',
                                          titleStyle: const TextStyle(
                                            color: whiteColor,
                                          ),
                                          value: absentPercent,
                                          radius: 90,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Indicator(
                                    color: Colors.purple[300]!,
                                    text:
                                        '${presentPercent.toInt()}% Attendance',
                                    isSquare: false,
                                  ),
                                  Indicator(
                                    text: '${absentPercent.toInt()}% Absent',
                                    color: Colors.red[300]!,
                                    isSquare: false,
                                  ),
                                ],
                              ),
                              20.widthBox,
                            ],
                          ),
                        );
                      case AttendanceCountStatus.failure:
                        return Center(
                          child: Column(
                            children: [
                              const Text('Something went wrong'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                    }
                  },
                ),
              ),
              BlocBuilder<AttendanceBloc, AttendanceState>(
                builder: (context, state) {
                  switch (state.status) {
                    case AttendanceStatus.initial:
                    case AttendanceStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case AttendanceStatus.success:
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Attendance Report',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SecondaryButton(
                                  title: 'View all',
                                  onTap: () {
                                    context.read<RootCubit>().navigateTo(
                                          AppRoute.attendance,
                                        );
                                  },
                                ),
                              ],
                            ),
                            8.heightBox,
                            BlocBuilder<AttendanceCountBloc,
                                AttendanceCountState>(
                              buildWhen: (previous, current) =>
                                  previous.status != current.status,
                              builder: (context, state) {
                                return Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${state.attendanceCount.present} already in',
                                        style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          color: greenColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const TextSpan(text: '    '),
                                      TextSpan(
                                        text:
                                            '${state.attendanceCount.absent} remaining',
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
                            const Divider(
                              color: textGreyColor,
                            ),
                            if (state.attendances.isEmpty) ...[
                              const Text(
                                'No attendance data',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: state.attendances.take(5).length,
                              separatorBuilder: (_, __) => 8.heightBox,
                              itemBuilder: (context, index) {
                                final attendance =
                                    state.attendances.elementAt(index);
                                return Row(
                                  children: [
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: primaryColor,
                                      size: 16,
                                    ),
                                    2.widthBox,
                                    Expanded(
                                      child: Text(
                                        '${attendance.employee?.firstName} ${attendance.employee?.lastName} punched in at ${attendance.punchedIn != null ? DateFormat.jm().format(attendance.punchedIn!) : 'N/A'}',
                                        style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          color: darkColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            28.heightBox,
                          ],
                        ),
                      );
                    case AttendanceStatus.failure:
                      return const Text('Something went wrong');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });

  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(text),
      ],
    );
  }
}
