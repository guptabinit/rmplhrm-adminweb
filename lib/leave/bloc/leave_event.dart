part of 'leave_bloc.dart';

sealed class LeaveEvent extends Equatable {
  const LeaveEvent();

  @override
  List<Object?> get props => [];
}

final class LeaveFeatched extends LeaveEvent {}

final class LeaveDateChanged extends LeaveEvent {
  const LeaveDateChanged(this.date);

  @override
  List<Object?> get props => [date];

  final DateTime date;
}
