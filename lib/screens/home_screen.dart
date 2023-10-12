import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rmpl_hrm_admin/components/drawer_header.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/screens/admin_dashboard_screen.dart';
import 'package:rmpl_hrm_admin/screens/attendance_screen.dart';
import 'package:rmpl_hrm_admin/screens/holidays_screen.dart';
import 'package:rmpl_hrm_admin/screens/leave_applications.dart';
import 'package:rmpl_hrm_admin/screens/notification_screen.dart';
import 'package:rmpl_hrm_admin/screens/probation_list_screen.dart';
import 'package:rmpl_hrm_admin/screens/salary_details_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.admin_dashboard;
  int pageNumber = 0;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.admin_dashboard) {
      container = AdminDashboardScreen();
    } else if (currentPage == DrawerSections.attendance) {
      container = AttendanceScreen();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationScreen();
    } else if (currentPage == DrawerSections.attendance) {
      container = AttendanceScreen();
    } else if (currentPage == DrawerSections.holidays) {
      container = HolidayScreen();
    } else if (currentPage == DrawerSections.leave_application) {
      container = LeaveApplicationScreen();
    } else if (currentPage == DrawerSections.salary_details) {
      container = SalaryDetailScreen();
    } else if (currentPage == DrawerSections.probation_list) {
      container = ProbationListScreen();
    } else if (currentPage == DrawerSections.logout) {
      container = () {};
    }
    mq = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData('25% Attendance', 25, Colors.purple[300]!),
      ChartData('8% Leave', 38, Colors.red[300]!),
      ChartData('12% Remaning\nWorking Days', 34, Colors.pink[300]!),
      ChartData('Others', 52, Colors.green[500]!)
    ];

    List<String> appBarTitle = [
      'Hello! Name',
      'Hello! Name',
      'Employee\'s Details',
      'Notifications',
      'Attendance',
      'Holidays',
      'Leave Application',
      'Salary Details',
      'Probation List',
      'Logout'
    ];
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu_outlined),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appBarTitle[pageNumber],
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: pageNumber == 0 || pageNumber == 1 ? 20 : 24,
                    fontWeight: FontWeight.w600),
              ),
              pageNumber == 0 || pageNumber == 1 ? 4.heightBox : Container(),
              pageNumber == 0 || pageNumber == 1
                  ? Text(
                      'Designation',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    )
                  : Container(),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: whiteColor),
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'assets/icons/Notification.svg',
                          width: 16,
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 4,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ))
                    ],
                  )),
            ),
            8.widthBox,
            GestureDetector(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: whiteColor),
                  child: SvgPicture.asset(
                    'assets/icons/Logout.svg',
                    width: 20,
                  )),
            ),
            16.widthBox
          ],
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              // color: primaryColor,
              child: Column(
                children: [MyDrawerHeader(), myDrawerList()],
              ),
            ),
          ),
        ),
        body: container);
  }

  Widget myDrawerList() {
    return Container(
      child: Column(
        children: [
          menuItem(1, "Dashboard",
              currentPage == DrawerSections.admin_dashboard ? true : false),
          menuItem(2, "Employee’s Details",
              currentPage == DrawerSections.employee_details ? true : false),
          menuItem(3, "Notifications",
              currentPage == DrawerSections.notifications ? true : false),
          menuItem(4, "Attendance",
              currentPage == DrawerSections.attendance ? true : false),
          menuItem(5, "Holidays",
              currentPage == DrawerSections.holidays ? true : false),
          menuItem(6, "Leave Application",
              currentPage == DrawerSections.leave_application ? true : false),
          menuItem(7, "Salary Details",
              currentPage == DrawerSections.salary_details ? true : false),
          menuItem(8, "Probation List",
              currentPage == DrawerSections.probation_list ? true : false),
          menuItem(
              9, "Logout", currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, bool selected) {
    return Material(
      child: Container(
        margin: EdgeInsets.only(left: 12, right: 12, top: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? primaryColor.withOpacity(0.3) : Colors.transparent,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                pageNumber = id;
                currentPage = DrawerSections.admin_dashboard;
              } else if (id == 2) {
                pageNumber = id;
                currentPage = DrawerSections.employee_details;
              } else if (id == 3) {
                pageNumber = id;
                currentPage = DrawerSections.notifications;
              } else if (id == 4) {
                pageNumber = id;
                currentPage = DrawerSections.attendance;
              } else if (id == 5) {
                pageNumber = id;
                currentPage = DrawerSections.holidays;
              } else if (id == 6) {
                pageNumber = id;
                currentPage = DrawerSections.leave_application;
              } else if (id == 7) {
                pageNumber = id;
                currentPage = DrawerSections.salary_details;
              } else if (id == 8) {
                pageNumber = id;
                currentPage = DrawerSections.probation_list;
              } else if (id == 9) {
                pageNumber = id;
                currentPage = DrawerSections.logout;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Home.svg',
                  color: darkColor,
                ),
                12.widthBox,
                Expanded(
                    child: Text(
                  title,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  admin_dashboard,
  employee_details,
  notifications,
  attendance,
  holidays,
  leave_application,
  salary_details,
  probation_list,
  logout
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  Color color;
}
