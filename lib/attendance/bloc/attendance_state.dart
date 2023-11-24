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
    DateTime? date,
    this.errorMessage,
  }) : date = date ?? DateTime.now();

  AttendanceState copyWith({
    AttendanceStatus? status,
    List<Attendance>? attendances,
    DateTime? date,
    String? errorMessage,
  }) =>
      AttendanceState(
        status: status ?? this.status,
        attendances: attendances ?? this.attendances,
        date: date ?? this.date,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [status, attendances, date, errorMessage];

  final AttendanceStatus status;
  final List<Attendance> attendances;
  final DateTime? date;
  final String? errorMessage;
}

extension AttendanceStatusX on AttendanceStatus {
  bool get isInitial => this == AttendanceStatus.initial;

  bool get isLoading => this == AttendanceStatus.loading;

  bool get isSuccess => this == AttendanceStatus.success;

  bool get isFailure => this == AttendanceStatus.failure;
}
