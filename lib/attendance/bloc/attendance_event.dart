part of 'attendance_bloc.dart';

sealed class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object?> get props => [];
}

final class AttendanceLoaded extends AttendanceEvent {
  const AttendanceLoaded({
    required this.creator,
  });

  @override
  List<Object?> get props => [creator];

  final String creator;
}

final class AttendanceRefresh extends AttendanceEvent {
  const AttendanceRefresh({
    required this.creator,
  });

  @override
  List<Object?> get props => [creator];

  final String creator;
}

final class AttendanceRevoke extends AttendanceEvent {
  const AttendanceRevoke({
    required this.punchedBy,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [punchedBy, createdAt];

  final String punchedBy;
  final DateTime createdAt;
}

final class SelectedAttendance extends AttendanceEvent {
  const SelectedAttendance(this.attendance);

  @override
  List<Object?> get props => [attendance];

  final Attendance attendance;
}

final class AttendanceDateChanged extends AttendanceEvent {
  const AttendanceDateChanged({
    required this.date,
  });

  @override
  List<Object?> get props => [date];

  final DateTime date;
}
