import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/models/models.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    final chartData = <ChartData>[
      ChartData('25% Attendance', 25, Colors.purple[300]!),
      ChartData('8% Leave', 38, Colors.red[300]!),
      ChartData('12% Remaining\nWorking Days', 34, Colors.pink[300]!),
      ChartData('Others', 52, Colors.green[500]!),
    ];
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.heightBox,
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Punch In',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Punch Out',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Working Hours',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: borderColor,
                    endIndent: 16,
                    indent: 16,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      20.widthBox,
                      Expanded(
                        flex: 5,
                        child: Text(
                          'inTime',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'outTime',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'workingHours',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      28.widthBox,
                    ],
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
                child: SfCircularChart(
                  legend: const Legend(
                    isResponsive: true,
                    isVisible: true,
                  ),
                  selectionGesture: ActivationMode.singleTap,
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                      angle: 300,
                      radius: '40%',
                      widget: const Text('25%'),
                    ),
                    CircularChartAnnotation(
                      angle: 200,
                      radius: '40%',
                      widget: const Text('38%'),
                    ),
                    CircularChartAnnotation(
                      angle: 100,
                      radius: '40%',
                      widget: const Text('34%'),
                    ),
                    CircularChartAnnotation(
                      angle: 0,
                      radius: '40%',
                      widget: const Text('52%'),
                    ),
                  ],
                  series: <CircularSeries>[
                    // Render pie chart
                    PieSeries<ChartData, String>(
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    ),
                  ],
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
                                  onTap: () {},
                                ),
                              ],
                            ),
                            8.heightBox,
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
                                  TextSpan(text: '    '),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Probation',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SecondaryButton(
                                  title: 'View all',
                                  onTap: () {},
                                ),
                              ],
                            ),
                            const Divider(
                              color: textGreyColor,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: 5,
                              separatorBuilder: (_, __) => 8.heightBox,
                              itemBuilder: (context, index) {
                                return Text(
                                  '${index + 1}. Riya punched in at 10:35 AM',
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    color: darkColor,
                                    fontWeight: FontWeight.w400,
                                  ),
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
