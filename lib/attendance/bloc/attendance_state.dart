part of 'attendance_bloc.dart';

enum AttendanceStatus {
  initial,
  loading,
  success,
  failure,
}

final class AttendanceState extends Equatable {
  AttendanceState({
    this.status = AttendanceStatus.initial,
    this.attendances = const [],
    this.selectedAttendance = Attendance.empty,
    DateTime? date,
    this.errorMessage,
  }) : date = date ?? DateTime.now();

  AttendanceState copyWith({
    AttendanceStatus? status,
    List<Attendance>? attendances,
    Attendance? selectedAttendance,
    DateTime? date,
    String? errorMessage,
  }) =>
      AttendanceState(
        status: status ?? this.status,
        attendances: attendances ?? this.attendances,
        selectedAttendance: selectedAttendance ?? this.selectedAttendance,
        date: date ?? this.date,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        status,
        attendances,
        selectedAttendance,
        date,
        errorMessage,
      ];

  final AttendanceStatus status;
  final List<Attendance> attendances;
  final Attendance selectedAttendance;
  final DateTime? date;
  final String? errorMessage;
}

extension AttendanceStatusX on AttendanceStatus {
  bool get isInitial => this == AttendanceStatus.initial;

  bool get isLoading => this == AttendanceStatus.loading;

  bool get isSuccess => this == AttendanceStatus.success;

  bool get isFailure => this == AttendanceStatus.failure;
}
