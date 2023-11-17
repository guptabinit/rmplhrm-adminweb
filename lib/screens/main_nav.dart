import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rmpl_hrm_admin/add_holiday/add_holiday.dart';
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
import 'package:rmpl_hrm_admin/screens/other_screens/add_new_employee_screen.dart';
import 'package:rmpl_hrm_admin/screens/other_screens/add_notification_screen.dart';
import 'package:rmpl_hrm_admin/screens/probation_list_screen.dart';
import 'package:rmpl_hrm_admin/screens/salary_details_screen.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

import '../models/admin_model.dart';
import '../resources/auth_methods.dart';
import '../utils/utils.dart';

@Deprecated("Use root page instead of this")
class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const MainNavScreen(),
      );

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
      "Some error: $e".log();
    }
    super.initState();
  }

  var currentPage = DrawerSections.adminDashboard;
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
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          LoginScreen.route(),
          (route) => false,
        );
      }
    } else {
      showCustomToast(
        message: res,
        bgColor: redColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    late StatefulWidget container;
    if (currentPage == DrawerSections.adminDashboard) {
      container = const AdminDashboardScreen();
    } else if (currentPage == DrawerSections.employeeDetails) {
      container = EmployeeDetailScreen(branch: branch);
    } else if (currentPage == DrawerSections.notifications) {
      container = const NotificationScreen();
    } else if (currentPage == DrawerSections.attendance) {
      container = const AttendanceScreen();
    } else if (currentPage == DrawerSections.holidays) {
      container = const HolidayScreen();
    } else if (currentPage == DrawerSections.leaveApplication) {
      container = const LeaveApplicationScreen();
    } else if (currentPage == DrawerSections.salaryDetails) {
      container = const SalaryDetailScreen();
    } else if (currentPage == DrawerSections.probationList) {
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
                Navigator.of(context).push(
                  AddNewEmployeeScreen.route(branch),
                );
              } else if (pageNumber == 3) {
                Navigator.of(context).push(NewNotificationScreen.route());
              } else if (pageNumber == 5) {
                Navigator.of(context).push(AddHolidayPage.route());
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
                pageNumber == 2 ||
                        pageNumber == 3 ||
                        pageNumber == 5 ||
                        pageNumber == 8
                    ? Icons.add
                    : Icons.logout,
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
        menuItem(1, "Dashboard",
            currentPage == DrawerSections.adminDashboard ? true : false),
        menuItem(2, "Employee’s Details",
            currentPage == DrawerSections.employeeDetails ? true : false),
        menuItem(3, "Notifications",
            currentPage == DrawerSections.notifications ? true : false),
        menuItem(4, "Attendance",
            currentPage == DrawerSections.attendance ? true : false),
        menuItem(5, "Holidays",
            currentPage == DrawerSections.holidays ? true : false),
        menuItem(6, "Leave Application",
            currentPage == DrawerSections.leaveApplication ? true : false),
        menuItem(7, "Salary Details",
            currentPage == DrawerSections.salaryDetails ? true : false),
        menuItem(8, "Probation List",
            currentPage == DrawerSections.probationList ? true : false),
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
                currentPage = DrawerSections.adminDashboard;
              } else if (id == 2) {
                pageNumber = id;
                currentPage = DrawerSections.employeeDetails;
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
                currentPage = DrawerSections.leaveApplication;
              } else if (id == 7) {
                pageNumber = id;
                currentPage = DrawerSections.salaryDetails;
              } else if (id == 8) {
                pageNumber = id;
                currentPage = DrawerSections.probationList;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Home.svg',
                  colorFilter: const ColorFilter.mode(
                    darkColor,
                    BlendMode.srcIn,
                  ),
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
  adminDashboard,
  employeeDetails,
  notifications,
  attendance,
  holidays,
  leaveApplication,
  salaryDetails,
  probationList,
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  Color color;
}
