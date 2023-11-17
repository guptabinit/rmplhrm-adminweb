import 'package:flutter/material.dart' hide NavigationBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/add_holiday/view/add_holiday_page.dart';
import 'package:rmpl_hrm_admin/components/drawer_header.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/constants/consts.dart';
import 'package:rmpl_hrm_admin/holidays/view/holidays_page.dart';
import 'package:rmpl_hrm_admin/root/root.dart';
import 'package:rmpl_hrm_admin/screens/admin_dashboard_screen.dart';
import 'package:rmpl_hrm_admin/screens/attendance_screen.dart';
import 'package:rmpl_hrm_admin/screens/employee_details_screen.dart';
import 'package:rmpl_hrm_admin/screens/holidays_screen.dart';
import 'package:rmpl_hrm_admin/screens/leave_applications.dart';
import 'package:rmpl_hrm_admin/screens/notification_screen.dart';
import 'package:rmpl_hrm_admin/screens/other_screens/add_new_employee_screen.dart';
import 'package:rmpl_hrm_admin/screens/other_screens/add_notification_screen.dart';
import 'package:rmpl_hrm_admin/screens/probation_list_screen.dart';
import 'package:rmpl_hrm_admin/screens/salary_details_screen.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

const routes = <Widget>[
  AdminDashboardScreen(),
  EmployeeDetailScreen(
    branch: "Empty",
  ), // This branch should be replaced with the branch name by bloc listener
  NotificationScreen(),
  AttendanceScreen(),
  // HolidayScreen(),
  HolidaysPage(),
  LeaveApplicationScreen(),
  SalaryDetailScreen(),
  ProbationListScreen(),
];

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedRoute = context.select(
      (RootCubit cubit) => cubit.state.route,
    );
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.menu_outlined,
              color: whiteColor,
            ),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedRoute.title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: selectedRoute.index == 0 ? 18 : 18,
                fontWeight: FontWeight.w600,
                color: whiteColor,
              ),
            ),
            selectedRoute.index == 0 ? 4.heightBox : Container(),
            selectedRoute.index == 0 || selectedRoute.index == 8
                ? const Text(
                    "branch", // TODO: change to branch name by bloc listener
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: whiteColor,
                    ),
                  )
                : Container(),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (selectedRoute.index == 7) {
              } else if (selectedRoute.index == 1) {
                Navigator.of(context).push(
                  AddNewEmployeeScreen.route("branch"),
                );
              } else if (selectedRoute.index == 2) {
                Navigator.of(context).push(NewNotificationScreen.route());
              } else if (selectedRoute.index == 4) {
                Navigator.of(context).push(AddHolidayPage.route());
              } else {
                showCustomDialog(
                  context: context,
                  title: "Do you really want to log out?",
                  btn1: "Logout",
                  btn1fun: () {
                    // loggingOut();
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
                selectedRoute.index == 1 ||
                        selectedRoute.index == 2 ||
                        selectedRoute.index == 4 ||
                        selectedRoute.index == 7
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
              ...AppRoute.values.asMap().entries.map(
                    (e) => NavigationBar(
                      route: e.value,
                      selected: selectedRoute.index == e.key,
                    ),
                  ),
            ],
          ),
        ),
      ),
      body: routes[selectedRoute.index],
    );
  }
}
