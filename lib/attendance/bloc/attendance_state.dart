part of 'attendance_bloc.dart';

enum AttendanceStatus {
  initial,
  loading,
  success,
  failure,
}

enum AttendanceRevokeStatus {
  initial,
  loading,
  success,
  failure,
}

final class AttendanceState extends Equatable {
  AttendanceState({
    this.status = AttendanceStatus.initial,
    this.revokeStatus = AttendanceRevokeStatus.initial,
    this.attendances = const [],
    this.selectedAttendance = Attendance.empty,
    DateTime? date,
    this.errorMessage,
  }) : date = date ?? DateTime.now();

  AttendanceState copyWith({
    AttendanceStatus? status,
    AttendanceRevokeStatus? revokeStatus,
    List<Attendance>? attendances,
    Attendance? selectedAttendance,
    DateTime? date,
    String? errorMessage,
  }) =>
      AttendanceState(
        status: status ?? this.status,
        revokeStatus: revokeStatus ?? this.revokeStatus,
        attendances: attendances ?? this.attendances,
        selectedAttendance: selectedAttendance ?? this.selectedAttendance,
        date: date ?? this.date,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        status,
        revokeStatus,
        attendances,
        selectedAttendance,
        date,
        errorMessage,
      ];

  final AttendanceStatus status;
  final AttendanceRevokeStatus revokeStatus;
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

extension AttendanceRevokeStatusX on AttendanceRevokeStatus {
  bool get isInitial => this == AttendanceRevokeStatus.initial;

  bool get isLoading => this == AttendanceRevokeStatus.loading;

  bool get isSuccess => this == AttendanceRevokeStatus.success;

  bool get isFailure => this == AttendanceRevokeStatus.failure;
}
