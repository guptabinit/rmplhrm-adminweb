part of 'root_cubit.dart';

enum AppRoute {
  adminDashboard(name: "Dashboard", title: "Hello Admin!"),
  employeeDetails(name: "Employee's Details", title: "Employee's Details"),
  notifications(name: "Notifications", title: "Notifications"),
  attendance(name: "Attendance", title: "Attendance"),
  holidays(name: "Holidays", title: "Holidays"),
  leaveApplication(name: "Leave Application", title: "Leave Application"),
  salaryDetails(name: "Salary Details", title: "Salary Details"),
  probationList(name: "Probation List", title: "Probation List");

  const AppRoute({
    required this.name,
    required this.title,
  });

  final String name;
  final String title;
}

final class RootState extends Equatable {
  const RootState({
    this.route = AppRoute.adminDashboard,
  });

  @override
  List<Object> get props => [route];

  final AppRoute route;
}
