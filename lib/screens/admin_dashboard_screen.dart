import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/constants/dimensions.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData('25% Attendance', 25, Colors.purple[300]!),
      ChartData('8% Leave', 38, Colors.red[300]!),
      ChartData('12% Remaning\nWorking Days', 34, Colors.pink[300]!),
      ChartData('Others', 52, Colors.green[500]!)
    ];
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: mq.height * 0.1),
        margin: EdgeInsets.only(top: mq.height * 0.1),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Container(
              width: double.infinity,
              color: Colors.red[800],
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Center(
                child: Text(
                  'You are under probation which will last till 2.04.2024',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: whiteColor),
                ),
              ),
            ),
            20.heightBox,
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Punch In',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Punch Out',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Working Hours',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
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
                      28.widthBox,
                      const Expanded(
                        flex: 5,
                        child: Text(
                          '10:00 AM',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Expanded(
                        flex: 6,
                        child: Text(
                          '05:00 PM',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Text(
                        '08:00 Hrs',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      28.widthBox
                    ],
                  ),
                ],
              ),
            ),
            20.heightBox,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'My Dashboard',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SfCircularChart(
                legend: const Legend(
                    isResponsive: true,
                    // toggleSeriesVisibility: false,
                    isVisible: true,
                    title: LegendTitle(
                        text: 'Attendance Report',
                        textStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ))),
                selectionGesture: ActivationMode.singleTap,
                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                      angle: 300,
                      radius: '40%',
                      widget: const Text('25%')),
                  CircularChartAnnotation(
                      angle: 200,
                      radius: '40%',
                      widget: const Text('38%')),
                  CircularChartAnnotation(
                      angle: 100,
                      radius: '40%',
                      widget: const Text('34%')),
                  CircularChartAnnotation(
                      angle: 0,
                      radius: '40%',
                      widget: const Text('52%')),
                ],
                series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<ChartData, String>(
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) =>
                          data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y)
                ]),
            
          ],
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
