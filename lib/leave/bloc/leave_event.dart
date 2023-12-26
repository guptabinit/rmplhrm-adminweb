part of 'leave_bloc.dart';

sealed class LeaveEvent extends Equatable {
  const LeaveEvent();

  @override
  List<Object?> get props => [];
}

final class LeaveLoaded extends LeaveEvent {
  const LeaveLoaded(this.under);

  @override
  List<Object?> get props => [under];

  final String under;
}

final class SelectedLeave extends LeaveEvent {
  const SelectedLeave(this.leave);

  @override
  List<Object?> get props => [leave];

  final Leave leave;
}

final class LeaveDateChanged extends LeaveEvent {
  const LeaveDateChanged(this.date);

  @override
  List<Object?> get props => [date];

  final DateTime date;
}
