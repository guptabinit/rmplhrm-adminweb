part of 'attendance_count_bloc.dart';

sealed class AttendanceCountEvent extends Equatable {
  const AttendanceCountEvent();

  @override
  List<Object?> get props => [];
}

final class AttendanceCountLoaded extends AttendanceCountEvent {
  const AttendanceCountLoaded({
    required this.creator,
  });

  @override
  List<Object?> get props => [creator];

  final String creator;
}
