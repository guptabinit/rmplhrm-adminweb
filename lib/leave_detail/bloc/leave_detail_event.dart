part of 'leave_detail_bloc.dart';

sealed class LeaveDetailEvent extends Equatable {
  const LeaveDetailEvent();

  @override
  List<Object?> get props => [];
}

final class LeaveDetailLoaded extends LeaveDetailEvent {
  const LeaveDetailLoaded(this.id);

  @override
  List<Object?> get props => [id];

  final String id;
}
