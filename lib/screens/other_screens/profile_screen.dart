import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/buttons/secondary_button.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/screens/other_screens/update_profile_info.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

class EmployeesProfileScreen extends StatefulWidget {
  final Map<String, dynamic> snap;

  static Route<void> route(Map<String, dynamic> snap) {
    return MaterialPageRoute(
      builder: (context) => EmployeesProfileScreen(
        snap: snap,
      ),
    );
  }

  const EmployeesProfileScreen({super.key, required this.snap});

  @override
  State<EmployeesProfileScreen> createState() => _EmployeesProfileScreenState();
}

class _EmployeesProfileScreenState extends State<EmployeesProfileScreen> {
  final fieldController = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          "Employee's Profile",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                UpdateProfileScreen.route(
                  widget.snap,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
              ),
              child: const Icon(
                Icons.info_outline,
                color: primaryColor,
              ),
            ),
          ),
          16.widthBox
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: mq.width * 0.3,
                          width: mq.width * 0.25,
                          decoration: BoxDecoration(
                              color: lightGreyColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: CachedNetworkImage(
                            imageUrl: widget.snap['profileUrl'],
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        ),
                        16.widthBox,
                        Expanded(
                          child: SizedBox(
                            height: mq.width * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Text(
                                  '${widget.snap['firstName']} ${widget.snap['lastName']}',
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                Text(
                                  '${widget.snap['designation']}',
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Text(
                                  'Employee since ${widget.snap['dateJoined']}',
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              12.heightBox,
              const Divider(
                thickness: 1,
                color: borderColor,
                endIndent: 16,
                indent: 16,
              ),

              // if under-probation
              widget.snap['probation']
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              'Under Probation',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: whiteColor,
                              ),
                            ),
                          ),
                          SecondaryButton(
                            title: "Review & Update",
                            onTap: () {},
                            fontSize: 14,
                            titleColor: whiteColor,
                            backgroundColor: whiteColor,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: const BoxDecoration(
                        color: lightGreyColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              'Under Probation',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: darkColor,
                              ),
                            ),
                          ),
                          SecondaryButton(
                            title: "Review & Update",
                            onTap: () {},
                            fontSize: 14,
                            titleColor: whiteColor,
                            backgroundColor: whiteColor,
                          ),
                        ],
                      ),
                    ),
              8.heightBox,
              // attendance report
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Attendance Report:',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SecondaryButton(
                      title: "More info",
                      onTap: () {},
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: SfCircularChart(
                  legend: const Legend(
                    isResponsive: true,
                    // toggleSeriesVisibility: false,
                    isVisible: true,
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
                  ],
                ),
              ),
              12.heightBox,
              // Salary Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Salary Details:',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SecondaryButton(
                      title: "More info",
                      onTap: () {},
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: SfCircularChart(
                  legend: const Legend(
                    isResponsive: true,
                    // toggleSeriesVisibility: false,
                    isVisible: true,
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
                      yValueMapper: (ChartData data, _) => data.y,
                    ),
                  ],
                ),
              ),
              16.heightBox,
              // Delete employee & Disable Employee Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 16),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(textGreyColor),
                      elevation: const MaterialStatePropertyAll(3.0)),
                  child: const Center(
                    child: Text("Disable Account"),
                  ),
                ),
              ),
              12.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 16),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(redColor),
                      elevation: const MaterialStatePropertyAll(3.0)),
                  child: const Center(
                    child: Text("Delete Account"),
                  ),
                ),
              ),
              24.heightBox,
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
