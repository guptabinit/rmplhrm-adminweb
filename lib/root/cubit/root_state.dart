part of 'root_cubit.dart';

enum AppRoute {
  adminDashboard(title: "Dashboard"),
  employeeDetails(title: "Employee’s Details"),
  notifications(title: "Notifications"),
  attendance(title: "Attendance"),
  holidays(title: "Holidays"),
  leaveApplication(title: "Leave Application"),
  salaryDetails(title: "Salary Details"),
  probationList(title: "Probation List");

  const AppRoute({
    required this.title,
  });

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
