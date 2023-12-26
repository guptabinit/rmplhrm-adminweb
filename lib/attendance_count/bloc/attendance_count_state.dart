part of 'attendance_count_bloc.dart';

enum AttendanceCountStatus {
  initial,
  loading,
  success,
  failure,
}

final class AttendanceCountState extends Equatable {
  const AttendanceCountState({
    this.status = AttendanceCountStatus.initial,
    this.attendanceCount = AttendanceCount.empty,
    this.date,
  });

  AttendanceCountState copyWith({
    AttendanceCountStatus? status,
    AttendanceCount? attendanceCount,
    DateTime? date,
  }) {
    return AttendanceCountState(
      status: status ?? this.status,
      attendanceCount: attendanceCount ?? this.attendanceCount,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        status,
        attendanceCount,
        date,
      ];

  final AttendanceCountStatus status;
  final AttendanceCount attendanceCount;
  final DateTime? date;
}

extension AttendanceCountStatusX on AttendanceCountStatus {
  bool get isInitial => this == AttendanceCountStatus.initial;

  bool get isLoading => this == AttendanceCountStatus.loading;

  bool get isSuccess => this == AttendanceCountStatus.success;

  bool get isFailure => this == AttendanceCountStatus.failure;
}
