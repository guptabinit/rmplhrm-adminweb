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

final class AttendanceDateChanged extends AttendanceEvent {
  const AttendanceDateChanged({
    required this.date,
  });

  @override
  List<Object?> get props => [date];

  final DateTime date;
}
