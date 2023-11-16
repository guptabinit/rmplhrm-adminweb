import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rmpl_hrm_admin/components/drawer_header.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/constants/consts.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/screens/admin_dashboard_screen.dart';
import 'package:rmpl_hrm_admin/screens/attendance_screen.dart';
import 'package:rmpl_hrm_admin/screens/authentication/login_screen.dart';
import 'package:rmpl_hrm_admin/screens/employee_details_screen.dart';
import 'package:rmpl_hrm_admin/screens/holidays_screen.dart';
import 'package:rmpl_hrm_admin/screens/leave_applications.dart';
import 'package:rmpl_hrm_admin/screens/notification_screen.dart';
import 'package:rmpl_hrm_admin/screens/other_screens/add_holiday_screen.dart';
import 'package:rmpl_hrm_admin/screens/other_screens/add_new_employee_screen.dart';
import 'package:rmpl_hrm_admin/screens/other_screens/add_notification_screen.dart';
import 'package:rmpl_hrm_admin/screens/probation_list_screen.dart';
import 'package:rmpl_hrm_admin/screens/salary_details_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/admin_model.dart';
import '../resources/auth_methods.dart';
import '../utils/utils.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  String branch = "Branch";

  getAdminData() async {
    AdminModel adminDetails = await AuthMethods().getAdminDetails();
    setState(() {
      branch = adminDetails.branch;
    });
  }

  @override
  void initState() {
    try {
      getAdminData();
    } catch (e) {
      print("Some error: $e");
    }
    super.initState();
  }

  var currentPage = DrawerSections.admin_dashboard;
  int pageNumber = 0;

  bool _isLoading = false;

  void loggingOut() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signOut();

    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      Get.offAll(() => const LoginScreen());
    } else {
      showCustomToast(
        message: res,
        bgColor: redColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.admin_dashboard) {
      container = const AdminDashboardScreen();
    } else if (currentPage == DrawerSections.employee_details) {
      container = EmployeeDetailScreen(branch: branch);
    } else if (currentPage == DrawerSections.notifications) {
      container = const NotificationScreen();
    } else if (currentPage == DrawerSections.attendance) {
      container = const AttendanceScreen();
    } else if (currentPage == DrawerSections.holidays) {
      container = const HolidayScreen();
    } else if (currentPage == DrawerSections.leave_application) {
      container = const LeaveApplicationScreen();
    } else if (currentPage == DrawerSections.salary_details) {
      container = const SalaryDetailScreen();
    } else if (currentPage == DrawerSections.probation_list) {
      container = const ProbationListScreen();
    }
    mq = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData('25% Attendance', 25, Colors.purple[300]!),
      ChartData('8% Leave', 38, Colors.red[300]!),
      ChartData('12% Remaining\nWorking Days', 34, Colors.pink[300]!),
      ChartData('Others', 52, Colors.green[500]!),
    ];

    List<String> appBarTitle = [
      'Hello Admin!',
      'Hello Admin!',
      'Employee\'s Details',
      'Notifications',
      'Attendance',
      'Holidays',
      'Leave Application',
      'Salary Details',
      'Probation List',
    ];

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
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
                fontSize: pageNumber == 0 || pageNumber == 1 ? 18 : 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            pageNumber == 0 || pageNumber == 1 ? 4.heightBox : Container(),
            pageNumber == 0 || pageNumber == 1 || pageNumber == 9
                ? Text(
                    branch,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  )
                : Container(),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (pageNumber == 8) {
              } else if (pageNumber == 2) {
                Get.to(() => AddNewEmployeeScreen(branch: branch,));
              } else if (pageNumber == 3) {
                Get.to(() => const NewNotificationScreen());
              } else if (pageNumber == 5) {
                Get.to(() => const AddHolidayScreen());
              } else {
                showCustomDialog(
                  context: context,
                  title: "Do you really want to log out?",
                  btn1: "Logout",
                  btn1fun: () {
                    loggingOut();
                  },
                  btn2: "Cancel",
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
              ),
              child: Icon(
                pageNumber == 2 || pageNumber == 3 || pageNumber == 5 || pageNumber == 8 ? Icons.add : Icons.logout,
                color: primaryColor,
              ),
            ),
          ),
          16.widthBox
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyDrawerHeader(),
              myDrawerList(),
            ],
          ),
        ),
      ),
      body: container,
    );
  }

  Widget myDrawerList() {
    return Column(
      children: [
        menuItem(1, "Dashboard", currentPage == DrawerSections.admin_dashboard ? true : false),
        menuItem(2, "Employee’s Details", currentPage == DrawerSections.employee_details ? true : false),
        menuItem(3, "Notifications", currentPage == DrawerSections.notifications ? true : false),
        menuItem(4, "Attendance", currentPage == DrawerSections.attendance ? true : false),
        menuItem(5, "Holidays", currentPage == DrawerSections.holidays ? true : false),
        menuItem(6, "Leave Application", currentPage == DrawerSections.leave_application ? true : false),
        menuItem(7, "Salary Details", currentPage == DrawerSections.salary_details ? true : false),
        menuItem(8, "Probation List", currentPage == DrawerSections.probation_list ? true : false),
      ],
    );
  }

  Widget menuItem(int id, String title, bool selected) {
    return Material(
      child: Container(
        margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
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
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w500),
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
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}
