part of 'attendance_count_bloc.dart';

sealed class AttendanceCountEvent extends Equatable {
  const AttendanceCountEvent();

  @override
  List<Object?> get props => [];
}

final class AttendanceCountLoaded extends AttendanceCountEvent {
  AttendanceCountLoaded({
    required this.creator,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @override
  List<Object?> get props => [creator, date];

  final String creator;
  final DateTime date;
}

final class AttendanceCountDate extends AttendanceCountEvent {
  AttendanceCountDate({
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @override
  List<Object?> get props => [date];

  final DateTime date;
}
