import 'package:flutter/material.dart' hide NavigationBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/add_employee/add_employee.dart';
import 'package:rmpl_hrm_admin/add_holiday/view/add_holiday_page.dart';
import 'package:rmpl_hrm_admin/add_notification/add_notification.dart';
import 'package:rmpl_hrm_admin/admin_profile/admin_profile.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/attendance/attendance.dart';
import 'package:rmpl_hrm_admin/components/drawer_header.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/constants/consts.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';
import 'package:rmpl_hrm_admin/holidays/view/holidays_page.dart';
import 'package:rmpl_hrm_admin/leave/leave.dart';
import 'package:rmpl_hrm_admin/notifications/view/notifications_page.dart';
import 'package:rmpl_hrm_admin/root/root.dart';
import 'package:rmpl_hrm_admin/screens/admin_dashboard_screen.dart';
import 'package:rmpl_hrm_admin/screens/probation_list_screen.dart';
import 'package:rmpl_hrm_admin/screens/salary_details_screen.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

const routes = <Widget>[
  AdminDashboardScreen(),
  EmployeeDetailsPage(),
  NotificationsPage(),
  AttendancePage(),
  HolidaysPage(),
  LeavePage(),
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
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu_outlined,
                color: whiteColor,
              ),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
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
            if (selectedRoute.index == 0) 4.heightBox else Container(),
            if (selectedRoute.index == 0 || selectedRoute.index == 8)
              BlocBuilder<AdminProfileBloc, AdminProfileState>(
                builder: (context, state) {
                  return Text(
                    state.admin.branch ?? '',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: whiteColor,
                    ),
                  );
                },
              )
            else
              Container(),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              if (selectedRoute.index == 7) {
              } else if (selectedRoute.index == 1) {
                await Navigator.of(context).push(
                  AddEmployeePage.route(),
                );
              } else if (selectedRoute.index == 2) {
                await Navigator.of(context).push(AddNotificationPage.route());
              } else if (selectedRoute.index == 4) {
                await Navigator.of(context).push(AddHolidayPage.route());
              } else {
                final value = await showCustomDialog<bool>(
                  context: context,
                  title: 'Do you really want to log out?',
                  optionBuilder: () => {
                    'Logout': true,
                    'Cancel': false,
                  },
                );
                if (value == true && context.mounted) {
                  context.read<AppBloc>().add(const AppLogoutRequested());
                }
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
          16.widthBox,
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
