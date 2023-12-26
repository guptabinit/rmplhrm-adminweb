part of 'root_cubit.dart';

enum AppRoute {
  adminDashboard(
    name: 'Dashboard',
    title: 'Hello Admin!',
    icon: Icons.dashboard,
  ),
  employeeDetails(
    name: "Employee's Details",
    title: "Employee's Details",
    icon: Icons.person,
  ),
  notifications(
    name: 'Notifications',
    title: 'Notifications',
    icon: Icons.notifications,
  ),
  attendance(
    name: 'Attendance',
    title: 'Attendance',
    icon: Icons.access_time,
  ),
  holidays(
    name: 'Holidays',
    title: 'Holidays',
    icon: Icons.event,
  ),
  leaveApplication(
    name: 'Leave Application',
    title: 'Leave Application',
    icon: Icons.leave_bags_at_home,
  ),
  salaryDetails(
    name: 'Salary Details',
    title: 'Salary Details',
    icon: Icons.attach_money,
  ),
  probationList(
    name: 'Probation List',
    title: 'Probation List',
    icon: Icons.list,
  );

  const AppRoute({
    required this.name,
    required this.title,
    required this.icon,
  });

  final String name;
  final String title;
  final IconData icon;
}

final class RootState extends Equatable {
  const RootState({
    this.route = AppRoute.adminDashboard,
  });

  @override
  List<Object> get props => [route];

  final AppRoute route;
}
