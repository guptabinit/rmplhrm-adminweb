import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/admin_model.dart';
import '../resources/auth_methods.dart';

class AdminDashboardScreen extends StatefulWidget {
  final bool isLogoutTrigger;
  const AdminDashboardScreen({super.key, this.isLogoutTrigger = false});

  static Route<void> route(
    bool isLogoutTrigger,
  ) {
    return MaterialPageRoute(
      builder: (_) => AdminDashboardScreen(
        isLogoutTrigger: isLogoutTrigger,
      ),
    );
  }

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  String inTime = "09:00 AM";
  String outTime = "05:00 PM";
  String workingHours = "08:00 Hrs";

  getAdminData() async {
    AdminModel adminDetails = await AuthMethods().getAdminDetails();
    setState(() {
      inTime = adminDetails.inTime;
      outTime = adminDetails.outTime;
      workingHours = adminDetails.workingHours;
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
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
        padding: const EdgeInsets.only(top: 0),
        margin: const EdgeInsets.only(top: 0),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
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
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Punch Out',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Working Hours',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
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
                          inTime,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          outTime,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        workingHours,
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      28.widthBox
                    ],
                  ),
                ],
              ),
              20.heightBox,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Attendance',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 220,
                child: SfCircularChart(
                    legend: const Legend(
                      isResponsive: true,
                      // toggleSeriesVisibility: false,
                      isVisible: true,
                      // title: LegendTitle(
                      //     text: 'Attendance Report',
                      //     textStyle: TextStyle(
                      //       fontFamily: 'Inter',
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 14,
                      //     ))
                    ),
                    selectionGesture: ActivationMode.singleTap,
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                          angle: 300, radius: '40%', widget: const Text('25%')),
                      CircularChartAnnotation(
                          angle: 200, radius: '40%', widget: const Text('38%')),
                      CircularChartAnnotation(
                          angle: 100, radius: '40%', widget: const Text('34%')),
                      CircularChartAnnotation(
                          angle: 0, radius: '40%', widget: const Text('52%')),
                    ],
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataSource: chartData,
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y)
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                              fontWeight: FontWeight.w600),
                        ),
                        SecondaryButton(
                          title: "View all",
                          onTap: () {},
                        ),
                      ],
                    ),
                    8.heightBox,
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                        text: '7 already in',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: greenColor,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(text: '    '),
                      TextSpan(
                        text: '2 remaining',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: redColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ])),
                    const Divider(
                      color: textGreyColor,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_forward,
                          color: primaryColor,
                          size: 16,
                        ),
                        2.widthBox,
                        const Expanded(
                          child: Text(
                            'Riya punched in at 10:35 AM',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: darkColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    8.heightBox,
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_forward,
                          color: primaryColor,
                          size: 16,
                        ),
                        2.widthBox,
                        const Expanded(
                          child: Text(
                            'Riya punched in at 10:35 AM',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: darkColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    8.heightBox,
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_forward,
                          color: primaryColor,
                          size: 16,
                        ),
                        2.widthBox,
                        const Expanded(
                          child: Text(
                            'Riya punched in at 10:35 AM',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: darkColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    8.heightBox,
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_forward,
                          color: primaryColor,
                          size: 16,
                        ),
                        2.widthBox,
                        const Expanded(
                          child: Text(
                            'Riya punched in at 10:35 AM',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: darkColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
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
                              fontWeight: FontWeight.w600),
                        ),
                        SecondaryButton(
                          title: "View all",
                          onTap: () {},
                        ),
                      ],
                    ),
                    const Divider(
                      color: textGreyColor,
                    ),
                    const Text(
                      '1.Riya punched in at 10:35 AM',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: darkColor,
                          fontWeight: FontWeight.w400),
                    ),
                    8.heightBox,
                    const Text(
                      '2.Ashish punched in at 10:25 AM',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: darkColor,
                          fontWeight: FontWeight.w400),
                    ),
                    8.heightBox,
                    const Text(
                      '3.Akash punched in at 10:10 AM',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: darkColor,
                          fontWeight: FontWeight.w400),
                    ),
                    8.heightBox,
                    const Text(
                      '4.Vishesh punched in at 10:00 AM',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: darkColor,
                          fontWeight: FontWeight.w400),
                    ),
                    28.heightBox,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}
